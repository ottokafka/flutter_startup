import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

registerBusiness(firstName, lastName, email, password, phoneNumber) async {
  // in web use localhost but in android use 10.0.2.2
  // ios work with 127.0.0.1
  try {
    var url = 'http://150.136.56.131:5000/api/registerBusiness';
//    var url = 'http://127.0.0.1:5000/api/registerBusiness';
//    var url = 'http://10.0.2.2:5000/api/registerBusiness';
//    var url = 'https://startup-barber.herokuapp.com/api/registerBusiness';

    var json = jsonEncode(<String, dynamic>{
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber
    });

    print(json);

    Map<String, String> headers = {"Content-type": "application/json"};
    var response = await http.post(url, headers: headers, body: json);

    print('Response body: ${response.body}');

    // we parse the json and use the jsonDecode method
    var parsedJson = jsonDecode(response.body);
    // print how just the token numbers
//  print(parsedJson["token"]);
    var tokenBusiness = parsedJson["tokenBusiness"];

    SharedPreferences prefs = await SharedPreferences.getInstance();

    // This saves the token into the device as token: j9384ujhsdf
    await prefs.setString("tokenBusiness", tokenBusiness);
    // will grab the token from the device
    String getTokenBusiness = (prefs.getString("tokenBusiness"));

    // show that the token is coming from device storage
    print(getTokenBusiness);
  } catch (err) {
    print('Caught error: $err');
  }
}
