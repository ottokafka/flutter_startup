import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterstartup/business/LocationAdd.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<Availability> fetchLocation() async {
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
    return Availability.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Availability');
  }
}

class Availability {
  final String work1;
  final String day_of_week1;
  final String start_time1;
  final String end_time1;
  final String work2;
  final String day_of_week2;
  final String start_time2;
  final String end_time2;
  final String work3;
  final String day_of_week3;
  final String start_time3;
  final String end_time3;
  final String work4;
  final String day_of_week4;
  final String start_time4;
  final String end_time4;
  final String work5;
  final String day_of_week5;
  final String start_time5;
  final String end_time5;
  final String work6;
  final String day_of_week6;
  final String start_time6;
  final String end_time6;
  final String work7;
  final String day_of_week7;
  final String start_time7;
  final String end_time7;

  Availability({
    this.work1,
    this.day_of_week1,
    this.start_time1,
    this.end_time1,
    this.work2,
    this.day_of_week2,
    this.start_time2,
    this.end_time2,
    this.work3,
    this.day_of_week3,
    this.start_time3,
    this.end_time3,
    this.work4,
    this.day_of_week4,
    this.start_time4,
    this.end_time4,
    this.work5,
    this.day_of_week5,
    this.start_time5,
    this.end_time5,
    this.work6,
    this.day_of_week6,
    this.start_time6,
    this.end_time6,
    this.work7,
    this.day_of_week7,
    this.start_time7,
    this.end_time7,
  });

  factory Availability.fromJson(Map<String, dynamic> json) {
    print(json["availability"]);
    // if json Availability is null. display an empty Availability
    if (json["availability"] == null) {
      return Availability();
    }
    return Availability(
      day_of_week1: json['availability']['day_of_week1'] as String,
      start_time1: json['availability']['start_time1'] as String,
      end_time1: json['availability']['end_time1'] as String,
      day_of_week2: json['availability']['day_of_week2'] as String,
      start_time2: json['availability']['start_time2'] as String,
      end_time2: json['availability']['end_time2'] as String,
      day_of_week3: json['availability']['day_of_week3'] as String,
      start_time3: json['availability']['start_time3'] as String,
      end_time3: json['availability']['end_time3'] as String,
      day_of_week4: json['availability']['day_of_week4'] as String,
      start_time4: json['availability']['start_time4'] as String,
      end_time4: json['availability']['end_time4'] as String,
      day_of_week5: json['availability']['day_of_week5'] as String,
      start_time5: json['availability']['start_time5'] as String,
      end_time5: json['availability']['end_time5'] as String,
      day_of_week6: json['availability']['day_of_week6'] as String,
      start_time6: json['availability']['start_time6'] as String,
      end_time6: json['availability']['end_time6'] as String,
      day_of_week7: json['availability']['day_of_week7'] as String,
      start_time7: json['availability']['start_time7'] as String,
      end_time7: json['availability']['end_time7'] as String,
    );
  }
}

class AvailabilityBusiness extends StatefulWidget {
  static const String id = "availability";
  AvailabilityBusiness({Key key}) : super(key: key);

  @override
  _LocationBusinessState createState() => _LocationBusinessState();
}

class _LocationBusinessState extends State<AvailabilityBusiness> {
  Future<Availability> futureLocation;

  @override
  void initState() {
    super.initState();
    futureLocation = fetchLocation();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Availability>(
      future: futureLocation,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data;
          if (data.day_of_week1 == null) {
            return Center(
              child: Card(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.access_time),
                        title: Text("Availability"),
                      ),
                      ListView(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(20.0),
                        children: <Widget>[
                          Center(child: const Text('Monday: ?')),
                          Center(child: const Text('Tuesday: ?')),
                          Center(child: const Text('Wednesday: ?')),
                          Center(child: const Text('Thursday: ?')),
                          Center(child: const Text('Friday: ?')),
                          Center(child: const Text('Saturday: ?')),
                          Center(child: const Text('Sunday: ?')),
                          ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                child: const Text('ADD AVAILABILITY'),
                                onPressed: () {
                                  Navigator.pushNamed(context, LocationAdd.id);
                                },
                              ),
                            ],
                          ),
                        ],
                      )
                    ]),
              ),
            );
          }
//                return Text(snapshot.data.address);
          return Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.access_time),
                    title: Text("Availability"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data.day_of_week1 + ": ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(data.start_time1 + " - "),
                      Text(data.end_time1),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data.day_of_week2 + ": ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(data.start_time2 + " - "),
                      Text(data.end_time2),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data.day_of_week3 + ": ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(data.start_time3 + " - "),
                      Text(data.end_time3),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data.day_of_week4 + ": ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(data.start_time4 + " - "),
                      Text(data.end_time4),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data.day_of_week5 + ": ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(data.start_time5 + " - "),
                      Text(data.end_time5),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data.day_of_week6 + ": ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(data.start_time6 + " - "),
                      Text(data.end_time6),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data.day_of_week7 + ": ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(data.start_time7 + " - "),
                      Text(data.end_time7),
                    ],
                  ),
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
        return CircularProgressIndicator();
      },
    );
  }
}
