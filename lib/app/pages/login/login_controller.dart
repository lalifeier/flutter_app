import 'package:get/get.dart';

import '../../data/provider/login_provider.dart';

class LoginController extends GetxController {
  final LoginProvider? provider;
  LoginController({this.provider});

  final _text = 'Login'.obs;
  set text(text) => _text.value = text;
  get text => _text.value;
}
