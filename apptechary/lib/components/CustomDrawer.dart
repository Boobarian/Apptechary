import 'package:apptechary/Screens/login.dart';
import 'package:apptechary/components/RoundedButton.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final String _accountName = 'My Drugstore';
  final String _email = 'My email';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            onDetailsPressed: null,
            decoration: BoxDecoration(
              color: Colors.blueAccent
            ),
            currentAccountPicture: Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 75,
            ),
            accountName: Text(
                _accountName,
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            accountEmail: Text(
                _email,
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
          drawerHeading('Drug'),
          drawerDivider(),
          drawerItem('Add New Drug', null),
          drawerDivider(),
          drawerHeading('Inventory'),
          drawerDivider(),
          drawerItem('Feature', null),
          drawerItem('Feature', null),
          drawerItem('Feature', null),
          drawerDivider(),
          drawerHeading('Transaction'),
          drawerDivider(),
          drawerItem('Feature', null),
          drawerItem('Feature', null),
          drawerItem('Feature', null),
          drawerDivider(),
          drawerHeading('Prediction'),
          drawerDivider(),
          drawerItem('Sale Prediction', null),
          drawerDivider(),
          drawerHeading('Settings'),
          drawerDivider(),
          drawerItem('Feature', null),
          drawerItem('Feature', null),
          drawerItem('Feature', null),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 25.0),
            child: RoundedButton(
              onPressed: (){
                Navigator.pushNamed(context, LoginPage.routeId);
              },
              color: Colors.red,
              title: 'Delete this account',
            ),
          ),
        ],
      ),
    );
  }
  
  Widget drawerItem(title, onPressed){
    return ListTile(
      leading: Icon(
        Icons.brightness_1,
        color: Colors.blueAccent,
      ),
      title: Text(title),
      onTap: onPressed,
    );
  }

  Widget drawerHeading(title){
    return Container(
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  Widget drawerDivider(){
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 10.0, 0),
      child: Divider(
        thickness: 2.0,
      ),
    );
  }
}
