import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstartup/business/RegisterBusinessAction.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DashboardBusiness.dart';

class RegisterBusiness extends StatefulWidget {
  static const String id = "registerBusiness";
  @override
  _RegisterBusinessState createState() => _RegisterBusinessState();
}

class _RegisterBusinessState extends State<RegisterBusiness> {
  String password;
  String email;
  String firstName;
  String lastName;
  String phoneNumber;

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
        title: Text("Register"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoTextField(
              placeholder: "First Name",
              clearButtonMode: OverlayVisibilityMode.editing,
              onChanged: (value) {
                firstName = value;
              },
            ),
            CupertinoTextField(
              placeholder: "Last Name",
              onChanged: (value) {
                lastName = value;
              },
              obscureText: false,
            ),
            CupertinoTextField(
              placeholder: "Email",
              onChanged: (value) {
                email = value;
              },
              obscureText: false,
            ),
            CupertinoTextField(
              placeholder: "Phone Number",
              onChanged: (value) {
                phoneNumber = value;
              },
              obscureText: false,
            ),
            CupertinoTextField(
              placeholder: "Password",
              obscureText: true,
//              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
            ),
            SizedBox(height: 20),
            CupertinoButton.filled(
              child: Text("Register"),
              onPressed: () {
                secondFunction() async {
                  await registerBusiness(
                      firstName, lastName, email, password, phoneNumber);
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
