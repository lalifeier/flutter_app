import 'package:get/get.dart';

class HomeController extends GetxController {
  int selectedIndex = 1;

  void onItemTapped(int index) {
    selectedIndex = index + 1;
    update();
  }
}
