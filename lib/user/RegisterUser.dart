import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstartup/user/RegisterUserAction.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DashboardUser.dart';

class RegisterUser extends StatefulWidget {
  static const String id = "registerUser";

  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  String name;
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
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoTextField(
              textAlign: TextAlign.center,
              placeholder: "name",
              clearButtonMode: OverlayVisibilityMode.editing,
              autocorrect: false,
              onChanged: (value) {
                name = value;
              },
            ),
            SizedBox(height: 20),
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
              clearButtonMode: OverlayVisibilityMode.editing,
              autocorrect: false,
              onChanged: (value) {
                password = value;
              },
            ),
            SizedBox(height: 20),
            CupertinoButton.filled(
              child: Text("Register"),
              onPressed: () {
                registerUser(name, email, password);
                checkToken();
              },
            ),
          ],
        ),
      ),
    );
  }
}
