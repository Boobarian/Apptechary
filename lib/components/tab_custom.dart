import 'package:apptechary/models/data_items_tab.dart';
import 'package:apptechary/screens/screen_drug.dart';
import 'package:apptechary/screens/screen_inventory.dart';
import 'package:apptechary/screens/screen_transaction.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget{
  final Size size;

  CustomTabBar({this.size});
  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: TabItems.items,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => size;
}

class CustomTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: <Widget>[
        InventoryScreen(),
        DrugScreen(),
        TransactionScreen(),
      ],
    );
  }
}

