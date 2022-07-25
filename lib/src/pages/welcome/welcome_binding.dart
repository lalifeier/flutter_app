import 'package:get/get.dart';

import '../../data/provider/welcome_provider.dart';
import 'welcome_controller.dart';

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
