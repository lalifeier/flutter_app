import 'package:get/get.dart';

import '../../data/provider/login_provider.dart';
import 'login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(
        provider: LoginProvider(),
      ),
    );
  }
}
