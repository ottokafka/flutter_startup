import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstartup/business/LandingBusiness.dart';
import 'package:flutterstartup/business/LoginBusiness.dart';
import 'package:flutterstartup/business/RegisterBusiness.dart';
import 'package:flutterstartup/business/DashboardBusiness.dart';
import 'package:flutterstartup/user/DashboardUser.dart';
import 'user/LandingUser.dart';
import 'user/RegisterUser.dart';
import 'user/LoginUser.dart';
import 'user/Search.dart';
import 'user/searchResults.dart';
import 'package:provider/provider.dart';

void main() => runApp(FlutterStartup());

class FlutterStartup extends StatelessWidget {
  final String data = "top secret";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      home: Scaffold(),
      initialRoute: LandingUser.id,
      routes: {
        LandingUser.id: (context) => LandingUser(),
        LoginUser.id: (context) => LoginUser(),
        RegisterUser.id: (context) => RegisterUser(),
        DashboardUser.id: (context) => DashboardUser(),
        Search.id: (context) => Search(),
        SearchResults.id: (context) => SearchResults(),
        LandingBusiness.id: (context) => LandingBusiness(),
        LoginBusiness.id: (context) => LoginBusiness(),
        RegisterBusiness.id: (context) => RegisterBusiness(),
        DashboardBusiness.id: (context) => DashboardBusiness(),
      },
    );
  }
}
