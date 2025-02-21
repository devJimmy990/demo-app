import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static SharedPreferences? _shared;

  SharedPreference._();

  static Future<void> initialize() async {
    _shared ??= await SharedPreferences.getInstance();
  }

  // Save a string value
  static Future<bool> setString(
      {required String key, required String value}) async {
    if (_shared == null) throw Exception('SharedPreferences not initialized');
    return _shared!.setString(key, value);
  }

  // Retrieve a string value
  static String? getString({required String key}) {
    if (_shared == null) throw Exception('SharedPreferences not initialized');
    return _shared!.getString(key);
  }

  // Remove a value
  static Future<bool> remove({required String key}) async {
    if (_shared == null) throw Exception('SharedPreferences not initialized');
    return _shared!.remove(key);
  }
}
