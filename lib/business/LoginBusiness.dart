import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstartup/business/loginBusinessAction.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DashboardBusiness.dart';

class LoginBusiness extends StatefulWidget {
  static const String id = "loginBusiness";

  @override
  _LoginBusinessState createState() => _LoginBusinessState();
}

class _LoginBusinessState extends State<LoginBusiness> {
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    checkToken() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tokenBusiness = (prefs.getString("tokenBusiness"));
      print("The tokenBusiness is: $tokenBusiness");
      if (tokenBusiness != null) {
        Navigator.pushNamed(context, DashboardBusiness.id);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                email = value;
              },
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
//              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 20),
            CupertinoButton.filled(
              child: Text("Login"),
              onPressed: () {
                secondFunction() async {
                  await loginBusiness(email, password);
                  checkToken();
                }

                secondFunction();
              },
            ),
          ],
        ),
      ),
    );
  }
}
