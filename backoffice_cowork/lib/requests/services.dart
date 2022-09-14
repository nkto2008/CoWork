import 'dart:convert';
import 'dart:io';

import 'package:backoffice_cowork/models/model_service.dart';
import 'package:http/http.dart' as http;

import '../utils/token_preferences.dart';


const getServiceUrl = "http://localhost:8081/getService";
const createServiceUrl = "http://localhost:8081/addService";
const delServiceUrl = "http://localhost:8081/deleteService";
const updateServiceUrl = "http://localhost:8081/updateService";

class Services {
  static Future<List<Service>?> getAllServicesDesc() async {
    final response = await http.get(
      Uri.parse(getServiceUrl),
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader:
        TokenSimplePreferences.getToken('token').toString(),
      },
    );

    if (response.statusCode == 400) return null;

    if (response.statusCode != 200) throw Error();

    final jsonBody = json.decode(response.body);
    final List<Service> services =
    (jsonBody as List).map((service) => Service.fromJson(service)).toList();
    return services;
  }

  static Future createService(String name, String price) async {
    var body = jsonEncode(
      {
        "name": name,
        "price": price
      },
    );

    final response = await http.post(
      Uri.parse(createServiceUrl),
      headers: {
        "Access-Control-Allow-Origin": "*",
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

    return 1;
  }

  static Future updateService(String id, String name, double price) async {
    var body = jsonEncode(
      {
        "name": name,
        "price": price,
        "id": id,
      },
    );

    print(body);

    final response = await http.patch(
      Uri.parse(updateServiceUrl),
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader:
        TokenSimplePreferences.getToken('token').toString(),
      },
      body: body,
      encoding: Encoding.getByName("utf-8"),
    );

    print(response.body);

    if (response.statusCode != 200) {
      throw Error();
    }

    return 1;
  }

  static Future countServices() async {
    final response = await http.get(
      Uri.parse(getServiceUrl),
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

  static Future<bool> delService(String id) async {
    var body = jsonEncode({"id": id});
    final response = await http.delete(
      Uri.parse(delServiceUrl),
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