import 'package:flutter/widgets.dart';
import 'package:flutter_app/src/models/index.dart';
import 'package:get/get.dart';

import '../../routes/index.dart';
import '../../services/user_service.dart';
import '../../utils/index.dart';

class LoginController extends GetxController {
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

    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      print(mobile);
      print(code);
      Loading.show(text: "Logining, Please...");
      // LoginResponse resp = await UserApi.login(LoginRequest(
      //   username: mobile,
      //   password: code,
      // ));
      // print(resp);

      UserService.to.setToken('xxxxx');
      UserService.to.setUserInfo(const UserInfo(username: 'xxxx'));

      Get.offAllNamed(RouteNames.main);
    } catch (e) {
      await Loading.error(text: "Login Failed!");
    } finally {
      await Loading.dismiss();
    }

    // defaultCache.setIsLogin(true);
  }

  removePhone() {
    showClear.value = false;
    mobileController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    mobileController.dispose();
    codeController.dispose();
  }
}
