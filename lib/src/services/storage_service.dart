import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../constants/index.dart';

class StorageService extends GetxService {
  static StorageService get to => Get.find();

  Box box = Hive.box(HiveConstants.defaultBox);

  Future<bool> getIsFirstOpen() async {
    return await (box).get(HiveConstants.isFirstOpenKey, defaultValue: true);
  }

  Future<void> setIsFirstOpen(bool value) async {
    await (box).put(HiveConstants.isFirstOpenKey, value);
  }

  Future<String> getTheme() async {
    return await (box).get(HiveConstants.themeKey);
  }

  Future<void> setTheme(String value) async {
    await (box).put(HiveConstants.themeKey, value);
  }

  Future<String> getLanguage() async {
    return await (box).get(HiveConstants.languageKey, defaultValue: '');
  }

  Future<void> setLanguage(String value) async {
    await (box).put(HiveConstants.languageKey, value);
  }

  Future<String> getUserInfo() async {
    return await (box).get(HiveConstants.userInfoKey);
  }

  Future<void> setUserInfo(String value) async {
    await (box).put(HiveConstants.userInfoKey, value);
  }

  Future<String> getToken() async {
    return await (box).get(HiveConstants.tokenKey, defaultValue: '');
  }

  Future<void> setToken(String value) async {
    await (box).put(HiveConstants.tokenKey, value);
  }
}
