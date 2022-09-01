import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../utils/tokenPreferences.dart';

const loginURL = "http://localhost:8081/welcome";
const logoutURL = "http://localhost:8081/bye";

class Auth {
  static Future<String?> login(email, password) async {

    print(email);
    print(password);

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

      print(response.body);

      token = jsonDecode(response.body);
      print(token);

      if(response.statusCode == 200){
        await TokenSimplePreferences.setToken(token!);
      }
      if(response.statusCode == 400){
        token = "Email ou mot de passe incorrect";
      }

      return token;

    }catch(err){
      String error = "error : $err";
      return error;
    }
  }

  static Future<Map> logout() async{
    try {
      Map<String, dynamic> res;
      final response = await http.post(
        Uri.parse(logoutURL),
        headers: {
          "Content-Type": "application/json",
          HttpHeaders.authorizationHeader:
          TokenSimplePreferences.getToken('token').toString(),
        },
      );

      res = jsonDecode(response.body);

      if (response.statusCode == 200) {
        await TokenSimplePreferences.removeToken('token');
      }

      return res;

    }catch(err){
      Map<String, dynamic> error = {"error": err};
      return error;
    }
  }
}
