import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutterstartup/business/servicesAdd.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<Services> fetchServices() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String tokenBusiness = (prefs.getString("tokenBusiness"));

  var url = 'http://10.0.2.2:5000/api/businessinfo/me';
//  var url = 'https://startup-barber.herokuapp.com/api/businessinfo/me';;
  Map<String, String> headers = {
    "Content-type": "application/json",
    "tokenBusiness": "$tokenBusiness",
  };
  final response = await http.get(url, headers: headers);

//  print(response.statusCode);
//  print(response.body);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Services.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Services');
  }
}

class Services {
  final dynamic fade;
  final dynamic lineup;

  Services({this.fade, this.lineup});

  factory Services.fromJson(Map<dynamic, dynamic> json) {
    print(json["services"]);
    // if json services are null display empty Services
    if (json["services"] == null) {
      return Services();
    }
    return Services(
      fade: json['services']['fade'] as dynamic,
      lineup: json['services']['lineUp'] as dynamic,
    );
  }
}

class ServicesBusiness extends StatefulWidget {
  static const String id = "ServicesBusiness";
  ServicesBusiness({Key key}) : super(key: key);

  @override
  _ServicesBusinessState createState() => _ServicesBusinessState();
}

class _ServicesBusinessState extends State<ServicesBusiness> {
  Future<Services> futureServices;

  @override
  void initState() {
    super.initState();
    futureServices = fetchServices();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Services>(
      future: futureServices,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data;
//          print(data.fade);
          // if data fade is null means user had not setup services yet so show a link to setup
          if (data.fade == null) {
            return Center(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.content_cut),
                      title: Text("Services"),
                    ),
                    Text("Fade: ?"),
                    Text("lineup: ?"),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('ADD SERVICES'),
                          onPressed: () {
                            Navigator.pushNamed(context, ServicesAdd.id);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
          // todo: return all the location data here
//                return Text(snapshot.data.address);
          return Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.content_cut),
                    title: Text("Services"),
                  ),
                  Text("Fade: " + data.fade.toString()),
                  Text("lineup: " + data.lineup.toString()),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('EDIT'),
                        onPressed: () {
                          Navigator.pushNamed(context, ServicesAdd.id);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }
}
