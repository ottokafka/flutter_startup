import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstartup/user/searchActions.dart';
import 'package:http/http.dart' as http;

class SearchResults extends StatelessWidget {
  static const String id = "searchReults";
  @override
  Widget build(BuildContext context) {
    String city = "sacramento";

    return Container(
      child: Center(
        child: FutureBuilder(
//                future: http.get('http://10.0.2.2:5000/api/login/test'),
            future: searchCity(city),
            builder: (context, snapshot) {
              print(snapshot.data);
              Center(
                child: MaterialButton(
                  onPressed: () {
                    searchCity(city);
                  },
                ),
              );
              if (snapshot.hasError) {
                return Center(
                    child: Text('error: ${snapshot.error.toString()}'));
              }
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              return Center(
                  child: Text(snapshot.data[0]["location"].toString()));
            }),
      ),
    );
  }
}
