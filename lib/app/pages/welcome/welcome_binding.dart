import 'package:flutter_app/app/data/provider/welcome_provider.dart';
import 'package:flutter_app/app/pages/welcome/welcome_controller.dart';
import 'package:get/get.dart';

class WelcomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(
      () => WelcomeController(
        provider: WelcomeProvider(),
      ),
    );
  }
}
