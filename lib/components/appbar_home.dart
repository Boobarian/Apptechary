import 'package:apptechary/components/tab_custom.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: CustomTabBar(size: Size(double.infinity, 50.0),),
      title: Text('Home'),
      elevation: 20.0,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 100.0);
}
