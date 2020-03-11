import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstartup/user/DashboardUser.dart';
import 'screens/LandingPage.dart';
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
      initialRoute: Search.id,
      routes: {
        LandingPage.id: (context) => LandingPage(),
        LoginUser.id: (context) => LoginUser(),
        RegisterUser.id: (context) => RegisterUser(),
        DashboardUser.id: (context) => DashboardUser(),
        Search.id: (context) => Search(),
        SearchResults.id: (context) => SearchResults(),
      },
    );
  }
}
