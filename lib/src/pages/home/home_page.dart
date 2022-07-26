import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('hello'.tr),
      //   centerTitle: true,
      // ),
      body: Center(
        child: Text(
          '${controller.selectedIndex}',
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   shape: const CircularNotchedRectangle(),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       IconButton(onPressed: () {}, icon: const Icon(Icons.home_outlined)),
      //       IconButton(
      //           onPressed: () {},
      //           icon: const Icon(Icons.account_circle_outlined))
      //     ],
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: 'Mine')
        ],
        currentIndex: controller.selectedIndex,
        onTap: controller.onItemTapped,
      ),
    );
  }
}
