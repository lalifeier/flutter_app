import 'package:get/get.dart';

class WelcomeController extends GetxController {
  final _text = 'Welcome'.obs;
  set text(text) => _text.value = text;
  get text => _text.value;
}
