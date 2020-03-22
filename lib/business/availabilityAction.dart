import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

addAvailability(
    work1,
    work2,
    work3,
    work4,
    work5,
    work6,
    work7,
    start_time1,
    end_time1,
    start_time2,
    end_time2,
    start_time3,
    end_time3,
    start_time4,
    end_time4,
    start_time5,
    end_time5,
    start_time6,
    end_time6,
    start_time7,
    end_time7) async {
  // in web use localhost but in android use 10.0.2.2
  // ios work with 127.0.0.1
  try {
    var url = 'http://150.136.56.131:5000/api/availability';
//    var url = 'http://127.0.0.1:5000/api/registerBusiness';
//    var url = 'http://10.0.2.2:5000/api/availability';
//    var url = 'https://startup-barber.herokuapp.com/api/businessinfo';
    // start_time2 has to be wrapped in " " or there will be an error

    var body = jsonEncode(<String, dynamic>{
      "day_of_week1": "Monday",
      "work1": work1,
      'start_time1': start_time1,
      "end_time1": end_time1,
      "day_of_week2": "Tuesday",
      "work2": work2,
      'start_time2': start_time2,
      "end_time2": end_time2,
      "day_of_week3": "Wednesday",
      "work3": work3,
      'start_time3': start_time3,
      "end_time3": end_time3,
      "day_of_week4": "Thursday",
      "work4": work4,
      'start_time4': start_time4,
      "end_time4": end_time4,
      "day_of_week5": "Friday",
      "work5": work5,
      'start_time5': start_time5,
      "end_time5": end_time5,
      "day_of_week6": "Saturday",
      "work6": work6,
      'start_time6': start_time6,
      "end_time6": end_time6,
      "day_of_week7": "Sunday",
      "work7": work7,
      'start_time7': start_time7,
      "end_time7": end_time7,
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tokenBusiness = (prefs.getString("tokenBusiness"));

    Map<String, String> headers = {
      "Content-type": "application/json",
      "tokenBusiness": tokenBusiness
    };
    print(headers);
    var response = await http.put(url, headers: headers, body: body);

    print('Response body: ${response.body}');

    // we parse the json and use the jsonDecode method
    var parsedJson = jsonDecode(response.body);
    print(parsedJson);
  } catch (err) {
    print('Caught error: $err');
  }
}
