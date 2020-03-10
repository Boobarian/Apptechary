import 'package:apptechary/Screens/home.dart';
import 'package:apptechary/Screens/register.dart';
import 'package:apptechary/components/RoundedButton.dart';
import 'package:apptechary/constants.dart';
import 'package:apptechary/controllers/AuthController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginPage extends StatefulWidget {
  static const routeId = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  String _uid;
  String _email;
  String _password;
  String errorMessage = '';
  bool showSpinner = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState(){
    super.initState();
    setState(() {
      showSpinner = true;
    });
    var isLoggedin = AuthController.checkUser();
    if(isLoggedin == true){
      print("user exists!");
      Navigator.pushNamed(context, HomePage.routeId);
    }
    else{
      print('user is null!');
    }
    setState(() {
      showSpinner = false;
    });
  }

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
                    child: Image.asset(apptecharyLogo),
                  ),
                ),
                Text(
                  'Apptechary',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    fontFamily: 'Lobster',
                    letterSpacing: 5
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                    onChanged: (value) {
                      _email = value;
                    },
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your email')),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                    onChanged: (value) {
                      _password = value;
                    },
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your password')),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  title: 'Log In',
                  color: Colors.lightGreenAccent.shade400,
                  onPressed: () async{
                    setState(() {
                      showSpinner = true;
                    });
                    if(_email != null && _password != null){
                      try{
                        final fuser = await _auth.signInWithEmailAndPassword
                          (email: _email, password: _password);
                        if(fuser != null){
                          Navigator.popAndPushNamed(context, HomePage.routeId);
                          setState(() {
                            showSpinner = false;
                          });
                        }
                      }catch(e){
                        print(e);
                        setState(() {
                          showSpinner = false;
                          errorMessage = 'Login Failed, please try again';
                        });
                      }
                    }
                    else{
                      setState(() {
                        showSpinner = false;
                        errorMessage = 'Please fill all of the fields';
                      });
                    }
                  },
                ),
                Hero(
                  tag: registerButtonTag,
                  child: RoundedButton(
                    title: 'Register',
                    color: Colors.blueAccent,
                    onPressed: (){
                      Navigator.pushNamed(context, RegisterPage.routeId);
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
}
