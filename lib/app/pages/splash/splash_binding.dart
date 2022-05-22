import 'package:flutter_app/app/data/provider/splash_provider.dart';
import 'package:flutter_app/app/pages/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(
        provider: SplashProvider(),
      ),
    );
  }
}
