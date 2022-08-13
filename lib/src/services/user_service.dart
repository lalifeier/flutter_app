import 'dart:convert';

import 'package:flutter_app/src/models/index.dart';
import 'package:flutter_app/src/services/storage_service.dart';
import 'package:get/get.dart';

import '../routes/index.dart';

class UserService extends GetxService {
  static UserService get to => Get.find();

  final _userInfo = const UserInfo().obs;
  UserInfo get userInfo => _userInfo.value;

  String token = "";
  bool get hasToken => token.isNotEmpty;

  final _isLogin = false.obs;
  bool get isLogin => _isLogin.value;
  set isLogin(bool value) => _isLogin.value = value;

  @override
  void onInit() async {
    super.onInit();
    token = await StorageService.to.getToken();

    if (token.isEmpty) {
      _isLogin.value = false;
      _userInfo(const UserInfo());
      return;
    }
    _isLogin.value = true;

    var userInfoStr = await StorageService.to.getUserInfo();
    _userInfo(UserInfo.fromJson(jsonDecode(userInfoStr)));
  }

  Future<void> setUserInfo(UserInfo userInfo) async {
    _isLogin.value = true;
    _userInfo(userInfo);
    await StorageService.to.setUserInfo(jsonEncode(userInfo));
  }

  Future<void> setToken(String value) async {
    await StorageService.to.setToken(value);
    token = value;
  }

  Future<bool> checkIsLogin() async {
    if (_isLogin.value == false) {
      await Get.offAllNamed(RouteNames.login);
      return false;
    }
    return true;
  }

  Future<void> logout() async {
    _userInfo(const UserInfo());
    _isLogin.value = false;
    token = '';
  }
}
