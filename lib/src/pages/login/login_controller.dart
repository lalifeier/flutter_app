import 'package:get/get.dart';

class LoginController extends GetxController {
  final _text = 'Login'.obs;
  set text(text) => _text.value = text;
  get text => _text.value;
}
