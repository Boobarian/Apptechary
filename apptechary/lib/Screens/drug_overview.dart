import 'package:apptechary/components/CustomFloatingActionButton.dart';
import 'package:apptechary/components/CustomListView.dart';
import 'package:apptechary/components/card_drug.dart';
import 'package:apptechary/constants.dart';
import 'package:apptechary/models/druglist.dart';
import 'package:flutter/material.dart';

class DrugOverviewPage extends StatefulWidget {
  @override
  _DrugOverviewPageState createState() => _DrugOverviewPageState();
}

class _DrugOverviewPageState extends State<DrugOverviewPage> {
  String string;
  List<String> drugList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomListView(itemList: drugList, widget: Card(),),
      floatingActionButton: CustomFloatingActionButton(
        icon: Icons.add,
        color: Colors.lightGreen,
        label: 'Add New Drug',
        onPressed: (){
          setState(() {
            drugList.add('lmao');
          });
        },
      ),
    );
  }
}
