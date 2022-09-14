import 'dart:convert';
import 'dart:io';

import 'package:backoffice_cowork/models/model_schedule.dart';
import 'package:backoffice_cowork/models/model_service.dart';
import 'package:http/http.dart' as http;

import '../models/model_place.dart';
import '../models/model_servforsub.dart';
import '../models/model_subscribe.dart';
import '../utils/token_preferences.dart';

const getSubscribesUrl = "http://localhost:8081/getSub";
const delSubscribeUrl = "http://localhost:8081/deletePlace";
const createSubscribeUrl = "http://localhost:8081/createSubs";
const updateSubscribeUrl = "http://localhost:8081/updatePlace";

class Subscribes {

  static Future<List<Subscribe>?> getAllSubscribesDesc() async {
    final response = await http.get(
      Uri.parse(getSubscribesUrl),
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader:
        TokenSimplePreferences.getToken('token').toString(),
      },
    );
    if (response.statusCode == 400) return null;

    if (response.statusCode != 200) throw Error();

    final jsonBody = json.decode(response.body);

    List<Subscribe> subscribe = [];

    for (int i = 0; i < jsonBody.length; i++) {
      Subscribe sbtmp = Subscribe(
        jsonBody[i]["sub"]["name"],
        jsonBody[i]["sub"]["price"],
        jsonBody[i]["sub"]["_id"],
      );
      for (int j = 0; j < jsonBody[i]["schedules"].length; j++) {
        ServiceSub svtmp = ServiceSub(
          jsonBody[i]["service"][j]["_id"],
          jsonBody[i]["service"][j]["name"],
          jsonBody[i]["service"][j]["price"],
        );
        sbtmp.services.add(svtmp);
      }
      subscribe.add(sbtmp);
    }
    return subscribe;
  }

  static Future countSubscribes() async {
    final response = await http.get(
      Uri.parse(getSubscribesUrl),
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

  static Future<bool> delSubscribe(String id) async {
    var body = jsonEncode({"id": id});
    final response = await http.delete(
      Uri.parse(delSubscribeUrl),
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
