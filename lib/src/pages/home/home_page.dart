import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('主页'),
      //   centerTitle: true,
      // ),
      body: Column(
        children: [
          _buildSwiperWidget(context),
        ],
      ),
    );
  }

  Widget _buildSwiperWidget(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          print('xxxx');
          return Image.network(
            controller.imgList[index],
            fit: BoxFit.cover,
          );
        },
        itemCount: controller.imgList.length,
        // itemWidth: 300.0,
        // itemHeight: 400.0,
        // layout: SwiperLayout.TINDER,
      ),
    );
  }
}
