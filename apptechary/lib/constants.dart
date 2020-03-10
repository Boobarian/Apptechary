import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(
    color: greyTextField,
  ),
  fillColor: Colors.white,
  filled: true,
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kWhiteText = TextStyle(
  color: Colors.white,
);

const kLogo = CircleAvatar(
  maxRadius: 20.0,
  backgroundColor: Colors.transparent,
  backgroundImage: AssetImage('images/logo.png'),
);

const apptecharyLogo = 'images/logo.png';
const logoTag = 'logo';
const registerButtonTag = 'registerButton';
const drugTag = 'drugItem';

const userRef = 'users';
const notSet = 'not set';

const LoginStatus = 'not set';

enum AuthStatus{
  successful,
  failed
}

mixin Cat{
  void canFly(){

  }
}

const greyTextField = const Color(0xFF757575);