import 'package:apptechary/constants.dart';
import 'package:flutter/material.dart';

class DrugDetailsPage extends StatefulWidget {
  static final routeId = '/drug_details';

  @override
  _DrugDetailsPageState createState() => _DrugDetailsPageState();
}

class _DrugDetailsPageState extends State<DrugDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: (SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(apptecharyLogo),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
