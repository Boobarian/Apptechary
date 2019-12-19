import 'package:apptechary/Screens/drug_overview.dart';
import 'package:apptechary/Screens/inventory_overview.dart';
import 'package:apptechary/Screens/login.dart';
import 'package:apptechary/Screens/transaction_overview.dart';
import 'package:apptechary/constants.dart';
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

  String _name = 'Drugstore Name';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _name,
            textAlign: TextAlign.center,
            style: kWhiteText.copyWith(fontSize: 20.0)
          ),
          automaticallyImplyLeading: false,
          bottom: TabBar(
            tabs: <Widget>[
              Text('Inventory'),
              Text('Drug List'),
              Text('Transactions')
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Signout',
                style: kWhiteText,
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
        drawer: Drawer(
          child: ListView(
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}