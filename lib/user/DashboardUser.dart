import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstartup/user/Search.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LandingUser.dart';

class DashboardUser extends StatefulWidget {
  static const String id = "dashboardUser";

  @override
  _DashboardUserState createState() => _DashboardUserState();
}

class _DashboardUserState extends State<DashboardUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("Dashboard"),
//        backgroundColor: Colors.lightBlueAccent,
//      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Padding(
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
            ),
            SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
              child: MaterialButton(
                height: 42.0,
                color: Colors.lightBlueAccent,
                child: Text("Add Payment"),
                onPressed: () {
//                  Navigator.pushNamed(context, RegisterUser.id);
                },
              ),
            ),

            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
              child: MaterialButton(
                height: 42.0,
                color: Colors.deepOrange,
                child: Text("Logout"),
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString("tokenUser", null);
                  Navigator.pushNamed(context, LandingUser.id);
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
