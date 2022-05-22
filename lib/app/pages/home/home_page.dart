import 'package:flutter/material.dart';
import 'package:flutter_app/app/pages/home/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'.tr),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("hi"),
      ),
      // bottomNavigationBar: ,
    );
  }
}
