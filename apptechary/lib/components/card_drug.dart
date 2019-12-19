import 'package:apptechary/components/CustomListTile.dart';
import 'package:flutter/material.dart';

class DrugCard extends StatelessWidget {
  DrugCard({this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(64, 75, 96, .9),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: CustomListTile(),
      ),
    );
  }
}
