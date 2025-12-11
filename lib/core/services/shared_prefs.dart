import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static getBool(String key) {
    return prefs.getBool(key) ?? false;
  }

  static setBool(String key, bool value) async {
    prefs.setBool(key, value);
  }
}
