import 'package:apptechary/Screens/login.dart';
import 'package:apptechary/components/RoundedButton.dart';
import 'package:apptechary/models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../constants.dart';

class RegisterPage extends StatefulWidget {
  static const routeId = '/register';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _name;
  String _email;
  String _password;
  String errorMessage = '';
  bool showSpinner = false;

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade200,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: logoTag,
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Text(
                  'Create New Acccount',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    fontSize: 28.0
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  onChanged: (value) {
                    _name = value;
                  },
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter the drugstore name'
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  onChanged: (value) {
                    _email = value;
                  },
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email'
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  onChanged: (value) {
                    _password = value;
                  },
                  textAlign: TextAlign.center,
                  obscureText: false,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password',
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Hero(
                  tag: registerButtonTag,
                  child: RoundedButton(
                    title: 'Register',
                    color: Colors.blueAccent,
                    onPressed: () async{
                      setState(() {
                        showSpinner = true;
                      });
                      if(_name != null && _email != null && _password.length != null){
                        try{
                          final newUser = await _auth.createUserWithEmailAndPassword
                            (email: _email, password: _password);
                          if(newUser != null){
                            String _uid;
                            _auth.currentUser().then((user){
                              _uid = user.uid;
                              //createRecord(_uid, _name);
                              register(_uid, _name, _email);
                            });
                            Navigator.pop(context);
                          }

                          setState(() {
                            showSpinner = false;
                          });
                        }catch(e){
                          errorMessage = "Registration failed, please try again. ";
                          print(e);
                          switch(e.runtimeType){
                            case PlatformException: {
                              PlatformException msg = e;
                              errorMessage += msg.message;
                            }
                          }
                          setState(() {
                            showSpinner = false;
                          });
                        }
                      }
                      else{
                        AuthStatus status = AuthStatus.failed;
                        setState(() {
                          showSpinner = false;
                          errorMessage = 'Please fill all of the fields';
                        });
                      }
                    },
                  ),
                ),
                Container(
                  child: Text(
                    errorMessage,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createRecord(uid, name){
    final firestore = Firestore.instance;
    firestore.collection(userRef).add({
      'userId': uid.toString(),
      'name': _name,
      'phoneNumber': notSet,
      'address': notSet
    });
  }

  void register(uid, name, email){
    User user = new User(uid, name, email, 'not set', 'not set');
    final firestore = Firestore.instance;
    firestore.collection(userRef).add(user.toJson());
  }
}
