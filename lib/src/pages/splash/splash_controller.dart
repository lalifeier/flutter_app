import 'package:get/get.dart';

import '../../data/provider/splash_provider.dart';
import '../../routes/routes.dart';

class SplashController extends GetxController {
  final SplashProvider? provider;
  SplashController({this.provider});

  @override
  void onReady() async {
    super.onReady();

    await Future.delayed(const Duration(seconds: 3));

    Get.offNamed(AppRoutes.welcome);
  }
}
