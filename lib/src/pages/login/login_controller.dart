import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController mobileController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isPrivacyTipChecked = false.obs;

  RxBool isValid = false.obs;

  onLogin() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    String mobile = mobileController.text;
    String code = codeController.text;

    print(mobile);
    print(code);
    Get.offAllNamed(AppRoutes.INDEX);
  }
}
