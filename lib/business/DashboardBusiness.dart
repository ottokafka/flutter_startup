import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstartup/business/AvailabilityAdd.dart';
import 'package:flutterstartup/business/AvailabilityBusiness.dart';
import 'package:flutterstartup/business/LocationBusiness.dart';
import 'package:flutterstartup/business/servicesAdd.dart';
import 'package:flutterstartup/business/servicesBusiness.dart';
import 'package:flutterstartup/user/LandingUser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardBusiness extends StatefulWidget {
  static const String id = 'dashboardBusiness';
  @override
  _DashboardBusinessState createState() => _DashboardBusinessState();
}

class _DashboardBusinessState extends State<DashboardBusiness> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Business Dashboard"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: new SingleChildScrollView(
        child: Column(
          children: <Widget>[
            LocationBusiness(),
            AvailabilityBusiness(),
            ServicesBusiness(),

            CupertinoButton.filled(
              child: Text("Logout"),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString("tokenBusiness", null);
                Navigator.pushNamed(context, LandingUser.id);
              },
            ),
//            CupertinoButton.filled(
//              child: Text("Add Services"),
//              onPressed: () {
//                Navigator.pushNamed(context, ServicesAdd.id);
//              },
//            ),

            // TODO: add services
          ],
        ),
      ),
    );
  }
}
