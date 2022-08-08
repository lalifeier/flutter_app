import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mine_controller.dart';

class MinePage extends GetWidget<MineController> {
  const MinePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(title: Text('Mine'.tr)),
      body: Text('Mine'),
    );
  }
}
