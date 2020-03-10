import 'package:apptechary/constants.dart';
import 'package:flutter/material.dart';

class DrugDetailsPage extends StatefulWidget {
  static final routeId = '/drug_details';

  @override
  _DrugDetailsPageState createState() => _DrugDetailsPageState();
}

class _DrugDetailsPageState extends State<DrugDetailsPage> {
  Widget itemList(leading, title){
    return ListTile(
      leading: Text('$leading', style: kWhiteText, textAlign: TextAlign.center,),
      title: Text('$title', style: kWhiteText,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: (SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                'Drug Name',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  fontSize: 30.0,
                ),
              ),
              CircleAvatar(
                radius: 100.0,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(apptecharyLogo),
              ),
              itemList('Drug Type', 'Paracetamol')
            ],
          ),
        )),
      ),
    );
  }
}
