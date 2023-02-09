import 'package:flutter/material.dart';
import 'package:get/get.dart';

// GetSingleTickerProviderStateMixin
// GetTickerProviderStateMixin
class HomeController extends GetxController with GetTickerProviderStateMixin {
  final tabBarTitles = [
    '热门',
    '男装',
    '手机',
    '电器',
    '汽车',
    '百货',
    '电脑',
    '鞋包',
    '食品',
    '女装',
    '家具',
    '内衣',
    '家具',
    '内衣',
    '家具',
    '运动',
    '水果',
    '母婴',
    '家纺',
    '医药'
  ];

  final _currentIndex = 0.obs;
  set currentIndex(value) => _currentIndex.value = value;
  int get currentIndex => _currentIndex.value;

  late TabController tabController;

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(
      initialIndex: currentIndex,
      length: tabBarTitles.length,
      vsync: this,
    );

    // asyncLoadTabs();
  }

  // @override
  // void onReady() async {
  //   await getCarouseList();

  //   super.onReady();
  // }

  void asyncLoadTabs({int index = 0}) async {
    // await getSuperCategory();

    tabController.dispose();
    tabController = TabController(
      length: tabBarTitles.length,
      vsync: this,
      initialIndex: index,
    );
    // update();
  }

  // void switchTab(int index) async {
  //   asyncLoadTabs(index: index);
  // }

  // Future getCarouseList() async {
  //   var resp = await TaoBaoApi.getCarouseList();
  //   carouseList.value = resp.carouse;
  // }

  // Future getSuperCategory() async {
  //   var resp = await TaoBaoApi.GetSuperCategory();
  //   categoryList = resp.categories;

  //   tabs.value = ['推荐'];
  //   for (var category in resp.categories) {
  //     tabs.value.add(Tab(text: category.cname));
  //   }

  //   print(tabs);
  // }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
