import 'package:apptechary/constants.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String imageUri = apptecharyLogo;
  final String title = 'Drug Name';
  final String subtitle = 'Drug Type';
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
          border: new Border(
            right: new BorderSide(
              width: 1.0,
              color: Colors.white24,
            ),
          ),
        ),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: new AssetImage(imageUri),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: Colors.white,
        size: 30.0,
      ),
    );
  }
}
