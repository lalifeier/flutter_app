import 'package:flutter/material.dart';
import 'package:flutter_app/src/constants/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/index.dart';
import '../tuijian/index.dart';
import 'home_controller.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  Widget _buildView(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: TabBar(
            controller: controller.tabController,
            isScrollable: true,
            indicatorColor: AppColors.primaryColor,
            labelColor: AppColors.primaryColor,
            // indicatorSize: TabBarIndicatorSize.tab,
            labelPadding: EdgeInsets.symmetric(horizontal: 5.w),
            unselectedLabelColor: Colors.black54,
            onTap: ((index) => {controller.currentIndex = index}),
            tabs: controller.tabBarTitles.map((value) {
              return Tab(
                text: value,
              );
            }).toList(),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: controller.tabController,
            children: controller.tabBarTitles.asMap().keys.map((index) {
              return index == 0 ? const TuiJianPage() : Text(index.toString());
            }).toList(),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: AppColors.primaryColor,
        title: const SearchBar(
          height: 46,
          placeholderText: "输入商品名或粘贴宝贝标题搜索",
        ),
      ),
      body: _buildView(context),
    );
  }
}
