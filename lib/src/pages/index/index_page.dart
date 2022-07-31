import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index_controller.dart';

class IndexPage extends GetWidget<IndexController> {
  const IndexPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
