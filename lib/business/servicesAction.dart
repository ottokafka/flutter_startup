import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

addServices(fade, lineup) async {
  // in web use localhost but in android use 10.0.2.2
  // ios work with 127.0.0.1
  try {
    var url = 'http://150.136.56.131:5000/api/services';
//    var url = 'http://10.0.2.2:5000/api/services';
//    var url = 'https://startup-barber.herokuapp.com/api/businessinfo';

    var json = jsonEncode(<String, dynamic>{"fade": fade, "lineUp": lineup});

    // TODO: need to send a token with this request
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tokenBusiness = (prefs.getString("tokenBusiness"));

    Map<String, String> headers = {
      "Content-type": "application/json",
      "tokenBusiness": tokenBusiness
    };
    print(headers);
    var response = await http.put(url, headers: headers, body: json);

    print('Response body: ${response.body}');

    // we parse the json and use the jsonDecode method
    var parsedJson = jsonDecode(response.body);
    print(parsedJson);
  } catch (err) {
    print('Caught error: $err');
  }
}
