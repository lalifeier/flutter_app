import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: _buildSearchWidget(context),
          bottom: TabBar(
            controller: controller.tabController,
            isScrollable: true,
            indicatorColor: Colors.white,
            // indicatorSize: TabBarIndicatorSize.tab,
            tabs: controller.tabs,
            // onTap: controller.switchTab,
          ),
        ),
        body: TabBarView(
          controller: controller.tabController,
          children: controller.tabs.map((Tab tab) {
            final String label = tab.text!;
            if (label == "推荐") {
              return Container(
                child: Column(
                  children: [
                    _buildSwiperWidget(context),
                  ],
                ),
              );
            }
            return Container(
              alignment: Alignment.center,
              child: Text(label, textScaleFactor: 1),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildSearchWidget(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // color: const Color(0x00F4F4F4),
        color: Colors.white,
      ),
      child: Row(
        children: const [
          Icon(
            Icons.search,
            color: Colors.black,
          ),
          SizedBox(width: 16),
          // Text(
          //   "输入商品名或粘贴宝贝标题搜索",
          //   style: TextStyle(
          //     fontSize: 18,
          //   ),
          // )
          // TextFormField(
          //   decoration: const InputDecoration(
          //     hintText: "输入商品名或粘贴宝贝标题搜索",
          //     hintStyle: TextStyle(
          //       fontSize: 18,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  Widget _buildSwiperWidget(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Obx(
        () => Swiper(
          autoplay: true,
          scale: 0.9,
          viewportFraction: 0.93,
          itemBuilder: (BuildContext context, int index) {
            return CachedNetworkImage(
              imageUrl: controller.carouseList[index].topicImage,
              // placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            );

            // return Image.network(
            //   controller.carouseList[index].topicImage,
            //   fit: BoxFit.cover,
            // );
          },
          itemCount: controller.carouseList.length,
          pagination: const SwiperPagination(
              // alignment: Alignment.bottomRight,
              ),
          // control: const SwiperControl(),
        ),
      ),
    );
  }

  // Widget _buildCategoryWidget(BuildContext context) {
  //   return
  // }
}
