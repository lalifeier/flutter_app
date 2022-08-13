import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/index.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  AuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    Future.delayed(
        const Duration(seconds: 1), () => Get.snackbar("提示", "请先登录APP"));

    return const RouteSettings(name: RouteNames.login);
  }
}
