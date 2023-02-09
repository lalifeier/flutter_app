import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

class MainController extends GetxController {
  MainController();

  final _currentIndex = 0.obs;
  set currentIndex(value) => _currentIndex.value = value;
  int get currentIndex => _currentIndex.value;

  late final List<String> tabTitles;
  late final List<BottomNavigationBarItem> bottomTabs;

  late final PageController pageController;

  late final List<Widget> pages;

  @override
  void onInit() {
    super.onInit();

    tabTitles = [
      '首页',
      // '分类'
      '个人中心',
    ];
    bottomTabs = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        label: '首页',
        tooltip: '',
      ),
      //    const BottomNavigationBarItem(
      // icon: Icon(Icons.category_outlined), label: '分类'),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person_outlined),
        label: '我的',
        tooltip: '',
      ),
    ];
    pages = const <Widget>[
      HomePage(),
      MinePage(),
    ];

    pageController = PageController(initialPage: currentIndex);
  }

  void handlePageChanged(int index) {
    currentIndex = index;
  }

  void handleBottomNavigationBarTap(int index) {
    pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
