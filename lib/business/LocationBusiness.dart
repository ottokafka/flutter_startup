import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterstartup/business/LocationAdd.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<Location> fetchLocation() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String tokenBusiness = (prefs.getString("tokenBusiness"));

  var url = 'http://10.0.2.2:5000/api/businessinfo/me';
//  var url = 'https://startup-barber.herokuapp.com/api/businessinfo/me';;
  Map<String, String> headers = {
    "Content-type": "application/json",
    "tokenBusiness": "$tokenBusiness",
  };
  final response = await http.get(url, headers: headers);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Location.fromJson(json.decode(response.body));
  } else if (response.statusCode == 400) {
    // if return a 400 bad request response business has not setup a business profile yet
    print(response.statusCode);
  } else {
    // If the server did not return a 200 OK response, or did return a 400 bad request response
    // then throw an exception.
    throw Exception('Failed to load Location');
  }
}

class Location {
  final String company;
  final String address;
  final String city;
  final String state;
  final String zip;

  Location({this.company, this.address, this.city, this.state, this.zip});

  factory Location.fromJson(Map<String, dynamic> json) {
    print(json["location"]);
    return Location(
      company: json['company'] as String,
      address: json['location']['address'] as String,
      city: json['location']['city'] as String,
      state: json['location']['state'] as String,
      zip: json['location']['zip'] as String,
    );
  }
}

class LocationBusiness extends StatefulWidget {
  static const String id = "LocationBusiness";
  LocationBusiness({Key key}) : super(key: key);

  @override
  _LocationBusinessState createState() => _LocationBusinessState();
}

class _LocationBusinessState extends State<LocationBusiness> {
  Future<Location> futureLocation;

  @override
  void initState() {
    super.initState();
    futureLocation = fetchLocation();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Location>(
      future: futureLocation,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data;
          // todo: return all the location data here
//                return Text(snapshot.data.address);
          return Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.place),
                    title: Text("Location"),
                  ),
                  Text(data.company),
                  Text(data.address),
                  Text(data.city),
                  Text(data.state),
                  Text(data.zip),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('EDIT'),
                        onPressed: () {
                          Navigator.pushNamed(context, LocationAdd.id);
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
        //todo: load Create a Location card thats empty
//        return CircularProgressIndicator();
        return Center(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.place),
                  title: Text("Location"),
                ),
                Text("Company Name"),
                Text("Address"),
                Text("City"),
                Text("State"),
                Text("zip"),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text('CREATE'),
                      onPressed: () {
                        Navigator.pushNamed(context, LocationAdd.id);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
