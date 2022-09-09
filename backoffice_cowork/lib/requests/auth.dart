import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../utils/token_preferences.dart';

const loginURL = "http://localhost:8081/welcome";
const logoutURL = "http://localhost:8081/bye";

class Auth {
  static Future<String?> login(email, password) async {

    try{
      var body = jsonEncode({"email": '$email', "password": '$password'});
      var url = Uri.parse(loginURL);
      String? token;

      var response = await http.post(
        url,
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Content-Type": "application/json",
        },
        body: body,
        encoding: Encoding.getByName("utf-8"),
      );

      if(response.statusCode == 400 && response.body == "Invalid Credentials"){
        return "Email ou mot de passe incorrect";
      }

      if(response.statusCode == 200){
        token = jsonDecode(response.body);
        await TokenSimplePreferences.setToken(token.toString());
        return "good";
      }

      return null;

    }catch(err){
      String error = "error : $err";
      return error;
    }
  }

  static Future<String?> logout() async{
    String? res;
    try {
      final response = await http.post(
        Uri.parse(logoutURL),
        headers: {
          "Content-Type": "application/json",
          HttpHeaders.authorizationHeader:
          TokenSimplePreferences.getToken('token').toString(),
        },
      );

      if (response.statusCode == 200) {
        await TokenSimplePreferences.removeToken('token');
        return "Disconnect";
      }

      return "Session expired";

    }catch(err){
      return "error: $err";
    }
  }
}
