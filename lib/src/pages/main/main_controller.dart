import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home.dart';
import '../mine/mine.dart';

class MainController extends GetxController {
  MainController();

  final RxInt _currentIndex = 0.obs;

  int get currentIndex => _currentIndex.value;

  PageController pageController = PageController(initialPage: 0);

  final List<BottomNavigationBarItem> bottomNavigationItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '主页'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.account_circle_outlined), label: '个人中心'),
  ];

  final List<Widget> pages = [
    const HomePage(),
    const MinePage(),
  ];

  void onItemTapped(int index) {
    pageController.jumpToPage(index);
    _currentIndex.value = index;
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
