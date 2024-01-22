import 'package:shared_preferences/shared_preferences.dart';

class ASharedPreferences {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Save methods for various data types

  static Future<void> saveString(String key, String value) async {
    await _preferences.setString(key, value);
  }

  static Future<void> saveInt(String key, int value) async {
    await _preferences.setInt(key, value);
  }

  static Future<void> saveDouble(String key, double value) async {
    await _preferences.setDouble(key, value);
  }

  static Future<void> saveBool(String key, bool value) async {
    await _preferences.setBool(key, value);
  }

  static Future<void> saveStringList(String key, List<String> value) async {
    await _preferences.setStringList(key, value);
  }

  // Retrieve methods for various data types

  static String getString(String key, {String defaultValue = ''}) {
    return _preferences.getString(key) ?? defaultValue;
  }

  static int getInt(String key, {int defaultValue = 0}) {
    return _preferences.getInt(key) ?? defaultValue;
  }

  static double getDouble(String key, {double defaultValue = 0.0}) {
    return _preferences.getDouble(key) ?? defaultValue;
  }

  static bool getBool(String key, {bool defaultValue = false}) {
    return _preferences.getBool(key) ?? defaultValue;
  }

  static List<String> getStringList(String key,
      {List<String> defaultValue = const []}) {
    return _preferences.getStringList(key) ?? defaultValue;
  }

  // Remove method

  static Future<void> remove(String key) async {
    await _preferences.remove(key);
  }

  // Clear all preferences
  static Future<void> clear() async {
    await _preferences.clear();
  }
}
