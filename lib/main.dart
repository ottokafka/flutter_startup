import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Location>> fetchPhotos(http.Client client) async {
  var url = 'http://10.0.2.2:5000/api/businessinfo/city';
  String json = '{"city": "sacramento"}';
  Map<String, String> headers = {
    "Content-type": "application/json",
  };

  final response = await client.post(url, headers: headers, body: json);

//  print(response.body);
  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseLocations, response.body);
}

List<Location> parseLocations(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
//  print(parsed);
//  print(parsed[1]['location']);
//  return parsed.map<Location>((json) => Location.fromJson(json)).toList();
  return parsed.map<Location>((json) {
    return Location.fromJson(json);
  }).toList();
}

class Location {
//  final String location;
  final String address;
  final String city;

  Location({this.address, this.city});

  factory Location.fromJson(Map<String, dynamic> json) {
    print(json["location"]);
    return Location(
      address: json['location']['address'] as String,
      city: json['location']['city'] as String,
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Isolate Demo';

    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
//        return Image.network(photos[index].thumbnailUrl);
        return Text(locations[index].address);
      },
    );
  }
}

//
//
//import 'dart:async';
//import 'dart:convert';
//
//import 'package:flutter/foundation.dart';
//import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//
//Future<List<Photo>> fetchPhotos(http.Client client) async {
//  final response =
//  await client.get('https://jsonplaceholder.typicode.com/photos');
//
//  // Use the compute function to run parsePhotos in a separate isolate.
//  return compute(parsePhotos, response.body);
//}
//
//// A function that converts a response body into a List<Photo>.
//List<Photo> parsePhotos(String responseBody) {
//  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
//
//  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
//}
//
//class Photo {
//  final int albumId;
//  final int id;
//  final String title;
//  final String url;
//  final String thumbnailUrl;
//
//  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});
//
//  factory Photo.fromJson(Map<String, dynamic> json) {
//    return Photo(
//      albumId: json['albumId'] as int,
//      id: json['id'] as int,
//      title: json['title'] as String,
//      url: json['url'] as String,
//      thumbnailUrl: json['thumbnailUrl'] as String,
//    );
//  }
//}
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final appTitle = 'Isolate Demo';
//
//    return MaterialApp(
//      title: appTitle,
//      home: MyHomePage(title: appTitle),
//    );
//  }
//}
//
//class MyHomePage extends StatelessWidget {
//  final String title;
//
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(title),
//      ),
//      body: FutureBuilder<List<Photo>>(
//        future: fetchPhotos(http.Client()),
//        builder: (context, snapshot) {
//          if (snapshot.hasError) print(snapshot.error);
//
//          return snapshot.hasData
//              ? PhotosList(photos: snapshot.data)
//              : Center(child: CircularProgressIndicator());
//        },
//      ),
//    );
//  }
//}
//
//class PhotosList extends StatelessWidget {
//  final List<Photo> photos;
//
//  PhotosList({Key key, this.photos}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return GridView.builder(
//      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//        crossAxisCount: 2,
//      ),
//      itemCount: photos.length,
//      itemBuilder: (context, index) {
//        print(photos[index].title);
////        return Image.network(photos[index].thumbnailUrl);
//        return Text(photos[index].url);
//      },
//    );
//  }
//}
