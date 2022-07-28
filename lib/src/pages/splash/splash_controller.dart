import 'package:get/get.dart';

import '../../routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();

    await Future.delayed(const Duration(seconds: 3));

    Get.offNamed(AppRoutes.WELCOME);
  }
}
