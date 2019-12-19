import 'package:apptechary/Screens/drug_details.dart';
import 'package:apptechary/components/card_drug.dart';
import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  CustomListView({@required this.itemList, this.widget});
  final List<String> itemList;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index){
        return GestureDetector(
            child: DrugCard(),
            onDoubleTap: (){
              print(itemList[index]);
              Navigator.pushNamed(context, DrugDetailsPage.routeId);
            },
        );
      },
      itemCount: itemList.length,
    );
  }
}
