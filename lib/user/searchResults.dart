import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// --- Fetch to data with http Client request
Future<List<Location>> fetchPhotos(http.Client client) async {
//  var url = 'http://10.0.2.2:5000/api/businessinfo/city';
  var url = 'https://startup-barber.herokuapp.com/api/businessinfo/city';
  String json = '{"city": "sacramento"}';
  Map<String, String> headers = {
    "Content-type": "application/json",
  };

  final response = await client.post(url, headers: headers, body: json);
  print(response);
  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseLocations, response.body);
}

List<Location> parseLocations(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Location>((json) {
    return Location.fromJson(json);
  }).toList();
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

class SearchResults extends StatelessWidget {
  static const String id = "searchResults";

  @override
  Widget build(BuildContext context) {
    final appTitle = 'Isolate Demo';

    return Scaffold(
      body: HomePage(title: appTitle),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navbar"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: FutureBuilder<List<Location>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? LocationList(locations: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class LocationList extends StatelessWidget {
  final List<Location> locations;

  LocationList({Key key, this.locations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: locations.length,
      itemBuilder: (context, index) {
        print(locations[index].city);

        return Center(
          child: Card(
            child: InkWell(
              splashColor: Colors.blue.withAlpha(20),
              onTap: () {
                print('Card tapped.');
              },
              child: ListView(
                children: <Widget>[
                  Text(
                    locations[index].company,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    locations[index].address,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    locations[index].city,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    locations[index].state,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    locations[index].zip,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
