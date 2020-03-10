import 'package:apptechary/Screens/drug_overview.dart';
import 'package:apptechary/Screens/inventory_overview.dart';
import 'package:apptechary/Screens/login.dart';
import 'package:apptechary/Screens/transaction_overview.dart';
import 'package:apptechary/components/CustomDrawer.dart';
import 'package:apptechary/constants.dart';
import 'package:apptechary/controllers/FirestoreController.dart';
import 'package:apptechary/models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeId = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final databaseReference = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _user;

  String _title = 'Overview';

  Widget tabHeader(title){
    return Text(
      title,
      style: TextStyle(
        fontSize: 15.0,
      ),
    );
  }
  
  Future<String> getUid() async{
    var userId;
    final FirebaseUser user = await _auth.currentUser();
    userId = user.uid;
    print(userId + 'this is the user id');
    return userId;
  }

  Future<User> getUser()async{
    var userId = await getUid();
    var userData;
    FirestoreController.getUserData(userId).then((data) => print(data));
    print(userData);
    return userData;
  }

  @override
  void initState() {
    super.initState();
    print('going to home!');
    var userData = getUser();
    print(userData.toString());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _title,
            textAlign: TextAlign.center,
            style: kWhiteText.copyWith(fontSize: 20.0)
          ),
          automaticallyImplyLeading: false,
          bottom: TabBar(
            tabs: <Widget>[
              tabHeader('Inventory'),
              tabHeader('Drug List'),
              tabHeader('Transactions')
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: (){
                try{
                  Future<FirebaseUser> user = _auth.currentUser();
                  if(user != null){
                    _auth.signOut();
                    print('Successfully logged out');
                    Navigator.pushNamed(context, LoginPage.routeId);
                  }
                }catch(e){
                  print(e);
                }
              },
            )
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            InventoryOverviewPage(),
            DrugOverviewPage(),
            TransactionOverviewPage(),
          ],
        ),
        drawer: CustomDrawer(),
      ),
    );
  }
}
