import 'dart:convert';
import 'dart:io';

import 'package:backoffice_cowork/models/model_schedule.dart';
import 'package:http/http.dart' as http;

import '../models/model_place.dart';
import '../utils/token_preferences.dart';

const getPlacesUrl = "http://localhost:8081/getPlace";
const delPlaceUrl = "http://localhost:8081/deletePlace";
const createPlaceUrl = "http://localhost:8081/createPlace";
const updatePlaceUrl = "http://localhost:8081/updatePlace";

class Places {
  static Future<List<Place>?> getAllPlacesDesc() async {
    final response = await http.get(
      Uri.parse(getPlacesUrl),
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader:
            TokenSimplePreferences.getToken('token').toString(),
      },
    );
    if (response.statusCode == 400) return null;

    if (response.statusCode != 200) throw Error();

    final jsonBody = json.decode(response.body);

    List<Place> places = [];

    for (int i = 0; i < jsonBody.length; i++) {
      Place ptmp = Place(
        jsonBody[i]["place"]["name"],
        jsonBody[i]["place"]["city"],
        jsonBody[i]["place"]["cp"],
        jsonBody[i]["place"]["_id"],
      );
      for (int j = 0; j < jsonBody[i]["schedules"].length; j++) {
        Schedule stmp = Schedule(
          jsonBody[i]["schedules"][j]["idPlace"],
          jsonBody[i]["schedules"][j]["day"],
          jsonBody[i]["schedules"][j]["time"],
          jsonBody[i]["schedules"][j]["_id"],
        );
        ptmp.schedules.add(stmp);
      }
      places.add(ptmp);
    }
    return places;
  }

  static Future createPlace(
      String name,
      String city,
      String zip,
      String monday,
      String tuesday,
      String wednesday,
      String thursday,
      String friday,
      String saturday,
      String sunday) async {
    var body = jsonEncode(
      {
        "name": name,
        "city": city,
        "cp": zip,
        "horaire": {
          "lundi": monday,
          "mardi": tuesday,
          "mercredi": wednesday,
          "jeudi": thursday,
          "vendredi": friday,
          "samedi": saturday,
          "dimanche": sunday,
        }
      },
    );

    final response = await http.post(
      Uri.parse(updatePlaceUrl),
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

  static Future updatePlace(
      String id,
      String name,
      String city,
      String zip,
      String monday,
      String tuesday,
      String wednesday,
      String thursday,
      String friday,
      String saturday,
      String sunday) async {
    var body = jsonEncode(
      {
        "id": id,
        "name": name,
        "city": city,
        "cp": zip,
        "horaire": {
          "lundi": monday,
          "mardi": tuesday,
          "mercredi": wednesday,
          "jeudi": thursday,
          "vendredi": friday,
          "samedi": saturday,
          "dimanche": sunday,
        },
      },
    );

    final response = await http.patch(
      Uri.parse(updatePlaceUrl),
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

  static Future countPlaces() async {
    final response = await http.get(
      Uri.parse(getPlacesUrl),
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

  static Future<bool> delPlace(String id) async {
    var body = jsonEncode({"id": id});
    final response = await http.delete(
      Uri.parse(delPlaceUrl),
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
