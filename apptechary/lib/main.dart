import 'package:apptechary/Screens/drug_details.dart';
import 'package:apptechary/Screens/home.dart';
import 'package:apptechary/Screens/login.dart';
import 'package:apptechary/Screens/register.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginPage.routeId,
      routes: {
        LoginPage.routeId: (context) => LoginPage(),
        RegisterPage.routeId: (context) => RegisterPage(),
        HomePage.routeId: (context) => HomePage(),
        DrugDetailsPage.routeId: (context) => DrugDetailsPage(),
      }
    );
  }
}

