import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstartup/business/AddAvailability.dart';
import 'package:flutterstartup/business/AvailabilityBusiness.dart';
import 'package:flutterstartup/business/LocationBusiness.dart';

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
      body: Column(
        children: <Widget>[
          LocationBusiness(),
          AvailabilityBusiness(),
          CupertinoButton.filled(
            child: Text("Add Availability"),
            onPressed: () {
              Navigator.pushNamed(context, AddAvailability.id);
            },
          ),

          // TODO: add services
        ],
      ),
    );
  }
}
