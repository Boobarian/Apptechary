import 'package:apptechary/components/raisedbutton_round.dart';
import 'package:apptechary/components/textformfield_round.dart';
import 'package:apptechary/controllers/controller_auth.dart';
import 'package:apptechary/models/data_currentuser.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const routeId = '/register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _registerform = GlobalKey<FormState>();

  String _name;
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text('Create New Account',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 38.0,
              wordSpacing: 2.0,
              letterSpacing: 1.5,
            ),
          ),
          SizedBox(height: 50.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: KeyboardAvoider(
              child: Form(
                key: _registerform,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RoundTextFormField(
                      textColor: Colors.white,
                      labelText: 'Name',
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
                          _name = value;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
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
                        title: 'Create New Account',
                        buttonCallback: () {
                          if(_registerform.currentState.validate()){
                            AuthenticationController.register(_name, _email, _password, context);
                          }
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
