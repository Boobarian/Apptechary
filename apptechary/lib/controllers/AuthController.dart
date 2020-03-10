import 'package:apptechary/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController{
  static FirebaseUser _user;
  static FirebaseAuth _auth = FirebaseAuth.instance;
  AuthStatus status;

  static Future<bool> checkUser() async {
    _user = await _auth.currentUser();
    if(_user != null){
      return false;
    }
    else{
      return false;
    }
  }
}