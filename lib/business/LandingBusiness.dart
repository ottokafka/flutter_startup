import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterstartup/business/DashboardBusiness.dart';
import 'package:flutterstartup/business/LoginBusiness.dart';
import 'package:flutterstartup/business/RegisterBusiness.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../user/LoginUser.dart';
import '../user/RegisterUser.dart';

class LandingBusiness extends StatefulWidget {
  static const String id = "landingBusiness";

  @override
  _LandingBusinessState createState() => _LandingBusinessState();
}

class _LandingBusinessState extends State<LandingBusiness> {
  checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tokenBusiness = (prefs.getString("tokenBusiness"));
    print("The tokenBusiness is: $tokenBusiness");
    if (tokenBusiness != null) {
      Navigator.pushNamed(context, DashboardBusiness.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Business Page"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: Column(
          // This mainAxisAlignment puts the elements in the middle of the phone
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
//          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 50, 32, 0),
              child: MaterialButton(
                height: 42.0,
                color: Colors.black,
                textColor: Colors.white,
                child: Text("Register business"),
                onPressed: () {
                  checkToken();
                  Navigator.pushNamed(context, RegisterBusiness.id);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 50, 32, 0),
              child: MaterialButton(
                height: 42.0,
                color: Colors.green,
                textColor: Colors.white,
                child: Text("Login business"),
                onPressed: () {
                  checkToken();
                  Navigator.pushNamed(context, LoginBusiness.id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
