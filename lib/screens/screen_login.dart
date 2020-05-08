import 'package:apptechary/components/raisedbutton_round.dart';
import 'package:apptechary/components/textformfield_round.dart';
import 'package:apptechary/controllers/controller_auth.dart';
import 'package:apptechary/screens/screen_register.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

class LoginScreen extends StatefulWidget {
  static const routeId = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginform = GlobalKey<FormState>();

  String _email;
  String _password;


  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              minRadius: 50.0,
              maxRadius: 150.0,
              backgroundImage: AssetImage('images/logo.png'),
              backgroundColor: Colors.transparent,
            ),
          ),
          Text('Apptechary',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 50.0,
              fontFamily: 'Lobster',
              letterSpacing: 7.5,
            ),
          ),
          SizedBox(height: 20.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: KeyboardAvoider(
              child: Form(
                key: _loginform,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RoundTextFormField(
                      textColor: Colors.white,
                      labelText: 'Email',
                      hintColor: Colors.transparent,
                      labelColor: Colors.white,
                      cursorColor: Colors.white,
                      autoValidate: true,
                      focusedBorderColor: Colors.white,
                      borderColor: Colors.blue,
                      validationCallback: (String value) {
                        if (value.isEmpty) {
                          return 'Do not leave the fields empty!';
                        } else {
                          return null;
                        }
                      },
                      updateValueCallback: (String value) {
                        if (value.isNotEmpty) {
                          _email = value;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RoundTextFormField(
                      textColor: Colors.white,
                      cursorColor: Colors.white,
                      labelText: 'Password',
                      obscure: true,
                      hintColor: Colors.transparent,
                      labelColor: Colors.white,
                      autoValidate: true,
                      focusedBorderColor: Colors.white,
                      borderColor: Colors.blue,
                      validationCallback: (String value) {
                        if (value.isEmpty) {
                          return 'Do not leave the fields empty!';
                        } else if (value.length < 6) {
                          return 'Must be at least 6 characters!';
                        } else {
                          return null;
                        }
                      },
                      updateValueCallback: (String value) {
                        if (value.isNotEmpty) {
                          _password = value;
                        }
                      },
                    ),
                    SizedBox(height: 20.0,),
                    Builder(builder: (BuildContext context) {
                      return RoundRaisedButton(
                          title: 'Login',
                          buttonCallback: () async {
                            if(_loginform.currentState.validate()){
//                            try{
//                                final user = await _auth.signInWithEmailAndPassword(email: _email, password: _password);
//                              if(user
//                                  != null){
//                                Navigator.pushNamed(context, HomeScreen.routeId);
//                              }
//                              else{
//                                print("null!");
//                              }
//                            }catch(e){
//                              Scaffold.of(context).showSnackBar(SnackBar(content: Text(e.message),));
//                            }
                              AuthenticationController.login(_email, _password, context);
                            }
                            else{
                              print("Hello world!");
                            }
                          }
                      );
                    }),
                    SizedBox(height: 10.0,),
                    Builder(builder: (BuildContext context) {
                      return RoundRaisedButton(
                        title: 'Register',
                        buttonCallback: () {
                          Navigator.pushNamed(context, RegisterScreen.routeId);
                        },
                        buttonColor: Colors.blue,
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
