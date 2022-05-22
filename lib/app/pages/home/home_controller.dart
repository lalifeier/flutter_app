import 'package:flutter_app/app/data/provider/home_provider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final HomeProvider? provider;
  HomeController({this.provider});

  final _text = 'Home'.obs;
  set text(text) => _text.value = text;
  get text => _text.value;
}
