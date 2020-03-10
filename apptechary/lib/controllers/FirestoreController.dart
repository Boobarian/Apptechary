import 'package:apptechary/constants.dart';
import 'package:apptechary/models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreController{
  static Future<User> getUserData(UserId)async{
    var user;
    var snapshot = Firestore.instance.collection(userRef).where('uid', isEqualTo: UserId)
        .snapshots();
    if(snapshot != null){
      print('snapshot exists!');
      print(snapshot);
    }
    else{
      print('no snapshots found!');
    }
    return user;
  }
}