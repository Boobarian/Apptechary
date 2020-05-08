import 'package:apptechary/constants.dart';
import 'package:apptechary/models/data_currentuser.dart';
import 'package:apptechary/models/data_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreController{
  static final Firestore _firestore = Firestore.instance;
  static final CollectionReference _userRef = _firestore.collection(kUserPath);


  static void createUser(String name, String email){
    _firestore.collection(kUserPath).document().setData({
      'name' : name,
      'email' : email,
      'address': 'not yet entered',
    });
  }

  static Future<User> readUserData(String uid) async{
    await _firestore.collection(kUserPath)
        .document(uid).get()
        .then((DocumentSnapshot snapshot){
          User user = new User(uid: uid,
            username: snapshot.data['name'],
            email: snapshot.data['email'],
            address: snapshot.data['address'],
          );
          return user;
    }).catchError((){
      return null;
    });
    return null;
  }

  static void writeData(Map<String, dynamic> data, String path){
    try{
      _firestore.collection(path).document().setData(data);
    }catch(e){
      print(e.message);
    }
  }

   static Stream<QuerySnapshot> getStream(String uid, String path){
    final streamRef = _userRef.document(uid)
        .collection(path).snapshots();
    return streamRef;
  }
}