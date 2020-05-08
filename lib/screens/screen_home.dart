import 'package:apptechary/components/appbar_home.dart';
import 'package:apptechary/components/tab_custom.dart';
import 'package:apptechary/controllers/controller_utility.dart';
import 'package:apptechary/models/data_items_tab.dart';
import 'package:apptechary/models/data_user.dart';
import 'package:apptechary/models/listdata_drug.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  static final routeId = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiProvider(
        providers: [
          Provider<User>(create: (context) => User()),
          Provider<DrugData>(create: (context) => DrugData(),)
        ],
        child: DefaultTabController(
          length: TabItems.items.length,
          child: Scaffold(
            appBar: HomeAppBar(),
            body: CustomTabView(),
          ),
        ),
      ),
    );
  }
}

class GetImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){
        UtilityController.getImageFromCamera();
      },
    );
  }
}

