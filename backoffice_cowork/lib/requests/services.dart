import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../utils/token_preferences.dart';


const getServices = "http://localhost:8081/getService";

class Services {

  static Future countServices() async {
    final response = await http.get(
      Uri.parse(getServices),
      headers: {
        HttpHeaders.authorizationHeader:
        TokenSimplePreferences.getToken('token').toString(),
      },
    );

    if (response.statusCode != 200) {
      throw Error();
    }

    final jsonBody = json.decode(response.body);
    final counter = jsonBody.length;

    return counter;
  }

}