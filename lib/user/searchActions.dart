import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<List> searchCity(city) async {
  await Future.delayed(Duration(seconds: 1));
  print(city);
  // in web use localhost but in android use 10.0.2.2
  // ios work with 127.0.0.1
  try {
//    var url = 'http://127.0.0.1:5000/api/businessinfo/city';
    var url = 'https://startup-barber.herokuapp.com/api/businessinfo/city';
    // email has to be wrapped in " " or there will be an error
    String json = '{"city": "$city"}';
    print(json);
    // Get the token from the device storage
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String getTokenUser = (prefs.getString("tokenUser"));
    Map<String, String> headers = {
      "Content-type": "application/json",
      "tokenUser": "$getTokenUser"
    };
    var response = await http.post(url, headers: headers, body: json);

    print('Response body: ${response.body}');

    // we parse the json and use the jsonDecode method
    var parsedJson = jsonDecode(response.body);
    print(parsedJson);
  } on Exception {
//    ----------------  A N D R O I D ---------------------

    var client = http.Client();
    try {
//      var url = 'http://10.0.2.2:5000/api/businessinfo/city';
      var url = 'https://startup-barber.herokuapp.com/api/businessinfo/city';
      // email has to be wrapped in " " or there will be an error
      String json = '{"city": "$city"}';
//    print(json);
      // Get the token from the device storage
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String getTokenUser = (prefs.getString("tokenUser"));
      Map<String, String> headers = {
        "Content-type": "application/json",
//      "tokenUser": "$getTokenUser"
      };

      final response = await client.post(url, headers: headers, body: json);

      print(await client.get(response.body));

      // we parse the json and use the jsonDecode method
      var parsedJson = jsonDecode(response.body);

      return parsedJson;
    } finally {
      client.close();
    }

//    return parsedJson;
//    print(parsedJson);

//    var url = 'http://10.0.2.2:5000/api/businessinfo/city';
//    // email has to be wrapped in " " or there will be an error
//    String json = '{"city": "$city"}';
////    print(json);
//    // Get the token from the device storage
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    String getTokenUser = (prefs.getString("tokenUser"));
//    Map<String, String> headers = {
//      "Content-type": "application/json",
////      "tokenUser": "$getTokenUser"
//    };
//    var response = await http.post(url, headers: headers, body: json);
//
//    print('Response body: ${response.body}');
//
//    // we parse the json and use the jsonDecode method
//    var parsedJson = jsonDecode(response.body);
//
////    return parsedJson;
////    print(parsedJson);
  }
}
