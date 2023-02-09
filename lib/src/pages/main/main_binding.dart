import 'package:flutter_app/src/pages/home/home_controller.dart';
import 'package:flutter_app/src/pages/mine/mine_controller.dart';
import 'package:get/get.dart';

import '../tuijian/index.dart';
import 'main_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<MineController>(() => MineController());

    Get.lazyPut<TuiJianController>(() => TuiJianController());
  }
}
