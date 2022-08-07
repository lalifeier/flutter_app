import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../data/local/hive/default.dart';
import '../../routes/routes.dart';
import '../../utils/is.dart';

class LoginController extends GetxController {
  final DefaultCache defaultCache = Get.find(tag: (DefaultCache).toString());

  LoginController();

  TextEditingController mobileController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isPrivacyTipChecked = false.obs;

  RxBool isValid = false.obs;

  RxBool showClear = false.obs;
  RxBool codeEnable = false.obs;

  FocusNode focusNode = FocusNode();

  @override
  void onReady() async {
    super.onReady();

    mobileController.addListener(() {
      showClear.value = mobileController.text.isNotEmpty;
      codeEnable.value = isMobile(mobileController.text);
    });

    codeController.addListener(() {});
  }

  Future<void> onLogin() async {
    String mobile = mobileController.text;
    String code = codeController.text;

    print(mobile);
    print(code);
    if (!formKey.currentState!.validate()) {
      return;
    }

    Get.offAllNamed(AppRoutes.MAIN);

    defaultCache.setIsLogin(true);
  }

  removePhone() {
    showClear.value = false;
    mobileController.clear();
  }
}
