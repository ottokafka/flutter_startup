import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstartup/user/Search.dart';

class DashboardUser extends StatefulWidget {
  static const String id = "dashboardUser";

  @override
  _DashboardUserState createState() => _DashboardUserState();
}

class _DashboardUserState extends State<DashboardUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
              child: MaterialButton(
                height: 42.0,
                color: Colors.lightBlue,
                child: Text("Search"),
                onPressed: () {
                  Navigator.pushNamed(context, Search.id);
                },
              ),
            ),
            SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
              child: MaterialButton(
                height: 42.0,
                color: Colors.lightBlueAccent,
                child: Text("Update Profile"),
                onPressed: () {
//                  Navigator.pushNamed(context, RegisterUser.id);
                },
              ),
            ),
//
          ],
        ),
      ),
    );
  }
}
