import 'dart:convert';
import 'dart:io';

import 'package:backoffice_cowork/models/model_user.dart';
import 'package:http/http.dart' as http;

import '../models/model_place.dart';
import '../utils/token_preferences.dart';

const getUsersUrl = "http://localhost:8081/getUsers";
const delUserUrl = "http://localhost:8081/deleteUsers";

class Users {
  static Future<List<User>?> getAllUsersDesc() async {
    final response = await http.get(
      Uri.parse(getUsersUrl),
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader:
            TokenSimplePreferences.getToken('token').toString(),
      },
    );

    if (response.statusCode == 400) return null;

    if (response.statusCode != 200) throw Error();

    final jsonBody = json.decode(response.body);
    final List<User> users =
        (jsonBody as List).map((user) => User.fromJson(user)).toList();
    return users;
  }

  static Future countUsers() async {
    final response = await http.get(
      Uri.parse(getUsersUrl),
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

  static Future updateUser(User user, String id, String lname, String fname, String pseudo,
      String email, String phone) async {



    final response = await http.patch(
      Uri.parse(getUsersUrl),
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

  static Future<bool> delUser(String id) async {
    var body = jsonEncode({"id": id});
    final response = await http.delete(
      Uri.parse(delUserUrl),
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader:
            TokenSimplePreferences.getToken('token').toString(),
      },
      body: body,
      encoding: Encoding.getByName("utf-8"),
    );

    if (response.statusCode != 200) {
      throw Error();
    }

    return true;
  }
}
