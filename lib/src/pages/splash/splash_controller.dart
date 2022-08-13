import 'package:flutter_app/src/services/settings_service.dart';
import 'package:get/get.dart';

import '../../routes/index.dart';
import '../../services/user_service.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();

    // FlutterNativeSplash.remove();

    toHome();
  }

  void toHome() async {
    await Future.delayed(const Duration(seconds: 1));

    if (await SettingsService.to.isFirstOpen) {
      Get.offNamed(RouteNames.welcome);
      return;
    }

    if (await UserService.to.checkIsLogin()) {
      Get.offNamed(RouteNames.main);
    }
  }
}
