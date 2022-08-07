import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_controller.dart';

class MainPage extends GetWidget<MainController> {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: controller.pages[controller.currentIndex],
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: controller.pages,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: controller.bottomNavigationItems,
          currentIndex: controller.currentIndex,
          onTap: controller.onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}



// class MainWidget extends StatefulWidget {
//   const MainWidget({Key? key}) : super(key: key);

//   @override
//   State<MainWidget> createState() => _MainWidgetState();
// }

// class _MainWidgetState extends State<MainWidget> {
//   @override
//   Widget build(BuildContext context) {

//   }
// }
