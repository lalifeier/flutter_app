import 'package:get/get.dart';

import '../../routes/routes.dart';

class SplashController extends GetxController {
  // final DefaultCache defaultCache = Get.find(tag: (DefaultCache).toString());

  @override
  void onReady() async {
    super.onReady();

    await Future.delayed(const Duration(seconds: 3));

    Get.offNamed(AppRoutes.MAIN);

    // Get.offNamed(
    //     await defaultCache.getIsLogin() ? AppRoutes.INDEX : AppRoutes.WELCOME);
  }
}
