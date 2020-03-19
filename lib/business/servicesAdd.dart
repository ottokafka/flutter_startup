import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstartup/business/servicesAction.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'DashboardBusiness.dart';

class ServicesAdd extends StatefulWidget {
  static const String id = "servicesAdd";
  @override
  _ServicesAddState createState() => _ServicesAddState();
}

class _ServicesAddState extends State<ServicesAdd> {
  String fade;
  String lineup;

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
        title: Text("Add Services"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoTextField(
              placeholder: "fade",
              clearButtonMode: OverlayVisibilityMode.editing,
              onChanged: (value) {
                fade = value;
              },
            ),
            CupertinoTextField(
              placeholder: "lineup",
              onChanged: (value) {
                lineup = value;
              },
              obscureText: false,
            ),
            SizedBox(height: 20),
            CupertinoButton.filled(
              child: Text("Add services"),
              onPressed: () {
                secondFunction() async {
                  await addServices(fade, lineup);
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
