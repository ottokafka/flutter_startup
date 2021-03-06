import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterstartup/business/LandingBusiness.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'DashboardUser.dart';
import 'LoginUser.dart';
import 'RegisterUser.dart';

class LandingUser extends StatefulWidget {
  static const String id = "landingUser";

  @override
  _LandingUserState createState() => _LandingUserState();
}

class _LandingUserState extends State<LandingUser> {
  @override
  Widget build(BuildContext context) {
    checkToken() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tokenUser = (prefs.getString("tokenUser"));
      print("The tokenUser is: $tokenUser");
      if (tokenUser != null) {
        Navigator.pushNamed(context, DashboardUser.id);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
//      appBar: AppBar(
//        title: Text("Home"),
//        backgroundColor: Colors.lightBlueAccent,
//      ),
      body: Center(
        child: Column(
          // This mainAxisAlignment puts the elements in the middle of the phone
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
//          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
              child: MaterialButton(
                height: 42.0,
                color: Colors.lightBlue,
                child: Text("Login"),
                onPressed: () {
                  checkToken();
                  Navigator.pushNamed(context, LoginUser.id);
                },
              ),
            ),
            SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
              child: MaterialButton(
                height: 42.0,
                color: Colors.lightBlueAccent,
                child: Text("Register"),
                onPressed: () {
                  checkToken();
                  Navigator.pushNamed(context, RegisterUser.id);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 50, 32, 0),
              child: MaterialButton(
                height: 42.0,
                color: Colors.black,
                textColor: Colors.white,
                child: Text("Setup business"),
                onPressed: () {
                  Navigator.pushNamed(context, LandingBusiness.id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
