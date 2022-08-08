import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home.dart';
import '../mine/mine.dart';
import 'main_controller.dart';

class MainPage extends GetWidget<MainController> {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: _buildPageView(),
        bottomNavigationBar: _buildBottomNavigationBar());
  }

  AppBar _buildAppBar() {
    return AppBar(
      // backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Obx(() => Text(controller.tabTitles[controller.currentPage])),
      // actions: <Widget>[
      //   IconButton(
      //     icon: const Icon(Icons.search),
      //     onPressed: () {},
      //   )
      // ],
    );
  }

  Widget _buildPageView() {
    return PageView(
      controller: controller.pageController,
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: controller.handlePageChanged,
      children: const <Widget>[
        HomePage(),
        MinePage(),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return Obx(
      () => BottomNavigationBar(
        items: controller.bottomTabs,
        currentIndex: controller.currentPage,
        onTap: controller.handleBottomNavigationBarTap,
        type: BottomNavigationBarType.fixed,
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
