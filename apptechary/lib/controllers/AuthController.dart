import 'package:apptechary/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController{
  static var _user = FirebaseAuth.instance.currentUser();
  static FirebaseAuth _auth = FirebaseAuth.instance;
  AuthStatus status;
}