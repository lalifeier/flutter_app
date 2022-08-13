import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  MainController();

  final RxInt _currentPage = 0.obs;
  set currentPage(value) => _currentPage.value = value;
  int get currentPage => _currentPage.value;

  late final List<String> tabTitles;
  late final List<BottomNavigationBarItem> bottomTabs;

  late final PageController pageController;

  @override
  void onInit() {
    super.onInit();

    tabTitles = [
      '主页',
      '个人中心',
    ];
    bottomTabs = [
      const BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined), label: '主页'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined), label: '个人中心'),
    ];

    pageController = PageController(initialPage: currentPage);
  }

  void handlePageChanged(int index) {
    currentPage = index;
  }

  void handleBottomNavigationBarTap(int index) {
    pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
