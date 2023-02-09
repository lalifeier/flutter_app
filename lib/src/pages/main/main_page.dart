import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../locales/index.dart';
import '../../utils/index.dart';
import 'main_controller.dart';

class MainPage extends GetWidget<MainController> {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DateTime? lastPressedAt;

    return WillPopScope(
      onWillPop: () async {
        if (lastPressedAt == null ||
            DateTime.now().difference(lastPressedAt!) >
                const Duration(seconds: 1)) {
          lastPressedAt = DateTime.now();

          Loading.toast(LocaleKeys.commonExitApp.tr);

          return false;
        }

        // await SystemChannels.platform.invokeMethod('SystemNavigator.pop');

        return true;
      },
      child: Scaffold(
        // appBar: _buildAppBar(),
        body: _buildPageView(),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      // backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Obx(() => Text(controller.tabTitles[controller.currentIndex])),
      // actions: <Widget>[
      //   IconButton(
      //     icon: const Icon(Icons.search),
      //     onPressed: () {},
      //   )
      // ],
    );
  }

  Widget _buildPageView() {
    return PageView.builder(
      controller: controller.pageController,
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: controller.handlePageChanged,
      itemCount: controller.pages.length,
      itemBuilder: (context, index) {
        return controller.pages[index];
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    return Obx(
      () => BottomNavigationBar(
        items: controller.bottomTabs,
        currentIndex: controller.currentIndex,
        onTap: controller.handleBottomNavigationBarTap,
        type: BottomNavigationBarType.fixed,
        // iconSize: 24.sp,
        // selectedFontSize: 12.sp,
        // unselectedFontSize: 12.sp,
      ),
    );
  }
}
