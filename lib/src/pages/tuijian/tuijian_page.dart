import 'package:flutter/material.dart' hide Banner;
import 'package:flutter_app/src/pages/tuijian/widgets/jingang.dart';
import 'package:get/get.dart';

import './widgets/banner.dart';
import 'index.dart';

class TuiJianPage extends GetWidget<TuiJianController> {
  const TuiJianPage({Key? key}) : super(key: key);

  Widget _buildView(BuildContext context) {
    return Column(
      children: [
        Banner(list: controller.bannerList),
        JinGang(list: controller.jingangList),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildView(context),
    );
  }
}
