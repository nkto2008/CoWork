import 'package:shared_preferences/shared_preferences.dart';

class TokenSimplePreferences {
  static SharedPreferences? preferences;

  static const _keyToken = 'token';
  static const _keyRules = 'rules';

  static Future init() async => preferences = await SharedPreferences.getInstance();

  //-----TOKEN-----//
  static Future setToken(String token) async =>
      await preferences?.setString(_keyToken, token);

  static String? getToken(String s) => preferences?.getString(_keyToken);

  static Future<bool>? removeToken(String s) => preferences?.remove(_keyToken);


  //-----RULES-----//
  static Future setRules(String rules) async =>
      await preferences?.setString(_keyRules, rules);

  static String? getRules(String s) => preferences?.getString(_keyRules);

  static Future<bool>? removeRules(String s) => preferences?.remove(_keyRules);
}
