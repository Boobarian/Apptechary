import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class CurrentFuser extends ChangeNotifier{
  FirebaseUser fuser;

  void replaceData(FirebaseUser user) {
    fuser = user;
    notifyListeners();
  }
}