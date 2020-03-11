import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstartup/user/DashboardUser.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutterstartup/user/loginUserAction.dart';

class LoginUser extends StatefulWidget {
  static const String id = "loginUser";

  @override
  _LoginUserState createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    checkToken() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tokenUser = (prefs.getString("tokenUser"));
      if (tokenUser != null) {
        Navigator.pushNamed(context, DashboardUser.id);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Navbar"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoTextField(
              textAlign: TextAlign.center,
              placeholder: "email",
              keyboardType: TextInputType.emailAddress,
              clearButtonMode: OverlayVisibilityMode.editing,
              autocorrect: false,
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(height: 20),
            CupertinoTextField(
              obscureText: true,
              textAlign: TextAlign.center,
              placeholder: "password",
              keyboardType: TextInputType.visiblePassword,
              clearButtonMode: OverlayVisibilityMode.editing,
              autocorrect: false,
              onChanged: (value) {
                password = value;
              },
            ),
            SizedBox(height: 20),
            CupertinoButton.filled(
              child: Text("Login"),
              onPressed: () {
                loginUser(email, password);
                checkToken();
              },
            ),
          ],
        ),
      ),
    );
  }
}
