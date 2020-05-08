import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User extends ChangeNotifier{
  final String uid;
  String username;
  String email;
  String address;

  User({this.uid, this.username, this.email, this.address});

  User parseData(DocumentSnapshot snapshot){

  }
}