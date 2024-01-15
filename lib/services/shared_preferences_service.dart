import 'dart:async' show Future;
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static late SharedPreferences _preferences;

  SharedPreferencesService._();

  // Using a singleton pattern
  static Future<SharedPreferencesService> getInstance() async {
    _instance ??= SharedPreferencesService._();

    _preferences = await SharedPreferences.getInstance();

    return _instance!;
  }

  static dynamic getData(String key) {
    return _preferences.get(key) ?? 0;
  }

  static void saveData(String key, dynamic value) {
    if (value is String) {
      _preferences.setString(key, value);
    } else if (value is int) {
      _preferences.setInt(key, value);
    } else if (value is double) {
      _preferences.setDouble(key, value);
    } else if (value is bool) {
      _preferences.setBool(key, value);
    } else if (value is List<String>) {
      _preferences.setStringList(key, value);
    }
  }

  static removeData(String key) {
    _preferences.remove(key);
  }
}
