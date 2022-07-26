import 'package:get/get.dart';

import '../../data/provider/home_provider.dart';

class HomeController extends GetxController {
  final HomeProvider? provider;
  HomeController({this.provider});

  int selectedIndex = 1;

  void onItemTapped(int index) {
    selectedIndex = index + 1;
    update();
  }
}
