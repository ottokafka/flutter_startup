import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardBusiness extends StatefulWidget {
  static const String id = 'dashboardBusiness';
  @override
  _DashboardBusinessState createState() => _DashboardBusinessState();
}

class _DashboardBusinessState extends State<DashboardBusiness> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Dashboard business"),
    );
  }
}
