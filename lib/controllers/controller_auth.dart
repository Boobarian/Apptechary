import 'package:apptechary/controllers/controller_firestore.dart';
import 'package:apptechary/models/data_currentuser.dart';
import 'package:apptechary/screens/screen_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthenticationController extends ChangeNotifier{
  static void login(email, password, context) async{
    try{

      final user = FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      if(user != null){
        Navigator.pushReplacementNamed(context, HomeScreen.routeId);
      }
      else{
        print("null!");
      }
    }catch(e){
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(e.message),));
    }
  }

  static void register(name, email, password, context) async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
          .then((value){
            FirestoreController.createUser(name, email);
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Registration Successful'),));
      });
    }catch(exception){
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(exception.message),));
    }
  }
}