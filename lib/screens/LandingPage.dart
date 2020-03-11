import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../user/LoginUser.dart';
import '../user/RegisterUser.dart';

class LandingPage extends StatefulWidget {
  static const String id = "landingPage";

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Navbar"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: Column(
          // This mainAxisAlignment puts the elements in the middle of the phone
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
//          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
//            FloatingActionButton.extended(
//              icon: const Icon(Icons.add),
//              label: Text("Login"),
//              onPressed: () {
//                Navigator.pushNamed(context, LoginUser.id);
//              },
//            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
              child: MaterialButton(
                height: 42.0,
                color: Colors.lightBlue,
                child: Text("Login"),
                onPressed: () {
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
                  Navigator.pushNamed(context, RegisterUser.id);
                },
              ),
            ),

//            CupertinoButton.filled(
//              child: Text("Login"),
//              onPressed: () {
//                Navigator.pushNamed(context, LoginUser.id);
//              },
//            ),
////             this sized box puts space between 2 elements
//            SizedBox(height: 20),
//            CupertinoButton.filled(
//              child: Text("Register"),
//              onPressed: () {
//                Navigator.pushNamed(context, RegisterUser.id);
//              },
//            ),
          ],
        ),
      ),
    );
  }
}

//
//class _FloatingActionButtonDemo extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: Column(
//        mainAxisSize: MainAxisSize.min,
//        children: [
//          FloatingActionButton(
//            child: const Icon(Icons.add),
//            onPressed: () {},
//            tooltip: "GalleryLocalizations.of(context).buttonTextCreate",
//          ),
//          SizedBox(height: 20),
//          FloatingActionButton.extended(
//            icon: const Icon(Icons.add),
//            label: Text("GalleryLocalizations.of(context).buttonTextCreate"),
//            onPressed: () {},
//          ),
//        ],
//      ),
//    );
//  }
//}
//
