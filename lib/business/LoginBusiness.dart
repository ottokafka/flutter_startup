import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstartup/business/loginBusinessAction.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DashboardBusiness.dart';

class LoginBusiness extends StatelessWidget {
  static const String id = "loginBusiness";
  String password;
  String email;

  @override
  Widget build(BuildContext context) {
    checkToken() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tokenUser = (prefs.getString("tokenUser"));
      print("The tokenUser is: $tokenUser");
      if (tokenUser != null) {
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
                password = value;
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
