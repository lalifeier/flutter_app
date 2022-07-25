import 'package:get/get.dart';

import '../../data/provider/splash_provider.dart';
import 'splash_controller.dart';

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
