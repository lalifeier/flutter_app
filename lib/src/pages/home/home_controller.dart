import 'package:flutter/material.dart';
import 'package:flutter_app/src/apis/taobao.dart';
import 'package:get/get.dart';

// GetSingleTickerProviderStateMixin
// GetTickerProviderStateMixin
class HomeController extends GetxController with GetTickerProviderStateMixin {
  final tabs = [
    const Tab(text: 'loading...'),
  ].obs;

  final carouseList = [].obs;

  List categoryList = [];

  late TabController tabController;

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(length: tabs.length, vsync: this);

    asyncLoadTabs();
  }

  @override
  void onReady() async {
    await getCarouseList();

    super.onReady();
  }

  void asyncLoadTabs({int index = 0}) async {
    await getSuperCategory();

    tabController.dispose();
    tabController =
        TabController(length: tabs.length, vsync: this, initialIndex: index);
    // update();
  }

  // void switchTab(int index) async {
  //   asyncLoadTabs(index: index);
  // }

  Future getCarouseList() async {
    var resp = await TaoBaoApi.getCarouseList();
    carouseList.value = resp.carouse;
  }

  Future getSuperCategory() async {
    var resp = await TaoBaoApi.GetSuperCategory();
    categoryList = resp.categories;

    tabs.value = [const Tab(text: '推荐')];
    for (var category in resp.categories) {
      tabs.value.add(Tab(text: category.cname));
    }

    print(tabs);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
