import 'package:flutter/material.dart';
import 'package:flutter_app/src/apis/taobao.dart';
import 'package:get/get.dart';

// GetSingleTickerProviderStateMixin
// GetTickerProviderStateMixin
class MyTabController extends GetxController with GetTickerProviderStateMixin {
  List<Tab> tabs = [
    // const Tab(text: 'loading...'),
  ];

  // HomeController({required this.tabs});

  List categoryList = [];

  late TabController tabController;

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(length: tabs.length, vsync: this);

    asyncLoadTabs();
  }

  void asyncLoadTabs({int index = 0}) async {
    await getSuperCategory();

    tabController.dispose();
    tabController =
        TabController(length: tabs.length, vsync: this, initialIndex: index);
    update();
  }

  Future getSuperCategory() async {
    var resp = await TaoBaoApi.GetSuperCategory();
    categoryList = resp.categories;

    tabs = [const Tab(text: '推荐')];
    for (var category in resp.categories) {
      tabs.add(Tab(text: category.cname));
    }

    print(tabs);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
