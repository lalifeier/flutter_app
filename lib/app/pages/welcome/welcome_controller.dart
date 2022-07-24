import 'package:get/get.dart';
import '../../../app/data/provider/welcome_provider.dart';

class WelcomeController extends GetxController {
  final WelcomeProvider? provider;
  WelcomeController({this.provider});

  final _text = 'Welcome'.obs;
  set text(text) => _text.value = text;
  get text => _text.value;
}
