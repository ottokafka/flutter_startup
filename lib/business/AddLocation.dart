import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DashboardBusiness.dart';
import 'addLocatiionAction.dart';

class AddLocation extends StatefulWidget {
  static const String id = "addLocation";
  @override
  _AddLocationState createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  String company;
  String address;
  String city;
  String state;
  String zip;

  @override
  Widget build(BuildContext context) {
    checkToken() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tokenBusiness = (prefs.getString("tokenBusiness"));
//      print("The tokenBusiness is: $tokenBusiness");
      if (tokenBusiness != null) {
        Navigator.pushNamed(context, DashboardBusiness.id);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Location"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoTextField(
              placeholder: "Company name",
              clearButtonMode: OverlayVisibilityMode.editing,
              onChanged: (value) {
                company = value;
              },
            ),
            CupertinoTextField(
              placeholder: "Address",
              onChanged: (value) {
                address = value;
              },
              obscureText: false,
            ),
            CupertinoTextField(
              placeholder: "city",
              onChanged: (value) {
                city = value;
              },
              obscureText: false,
            ),
            CupertinoTextField(
              placeholder: "state",
              onChanged: (value) {
                state = value;
              },
              obscureText: false,
            ),
            CupertinoTextField(
              placeholder: "zip",
              obscureText: true,
//              textAlign: TextAlign.center,
              onChanged: (value) {
                zip = value;
              },
            ),
            SizedBox(height: 20),
            CupertinoButton.filled(
              child: Text("Add Location"),
              onPressed: () {
                secondFunction() async {
                  await addBusinessLocation(company, address, city, state, zip);
                  Navigator.pushNamed(context, DashboardBusiness.id);
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
