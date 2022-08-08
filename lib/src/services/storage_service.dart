import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  late final SharedPreferences _preference;

  Future<StorageService> init() async {
    _preference = await SharedPreferences.getInstance();
    return this;
  }

  String getString(String key, {String defaultValue = ""}) {
    return _preference.getString(key) ?? defaultValue;
  }

  Future<bool> setString(String key, String value) async {
    return await _preference.setString(key, value);
  }

  int getInt(String key, {int defaultValue = 0}) {
    return _preference.getInt(key) ?? defaultValue;
  }

  Future<bool> setInt(String key, int value) async {
    return await _preference.setInt(key, value);
  }

  double getDouble(String key, {double defaultValue = 0.0}) {
    return _preference.getDouble(key) ?? defaultValue;
  }

  Future<bool> setDouble(String key, double value) async {
    return await _preference.setDouble(key, value);
  }

  bool getBool(String key, {bool defaultValue = false}) {
    return _preference.getBool(key) ?? defaultValue;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _preference.setBool(key, value);
  }

  List<String> getStringList(String key,
      {List<String> defaultValue = const []}) {
    return _preference.getStringList(key) ?? defaultValue;
  }

  Future<bool> setStringList(String key, List<String> value) async {
    return await _preference.setStringList(key, value);
  }

  Future<bool> remove(String key) async {
    return await _preference.remove(key);
  }

  Future<bool> clear() async {
    return await _preference.clear();
  }
}
