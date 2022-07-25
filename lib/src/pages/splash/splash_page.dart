import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../..//routes/app_pages.dart';
import 'splash_controller.dart';

class SplashPage extends GetWidget<SplashController> {
  const SplashPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.welcome);
    });

    return Stack(
      children: [
        Center(
          child: FlutterLogo(
            size: Get.size.width * 0.4,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(
              bottom: Get.context!.mediaQueryPadding.bottom + 20,
            ),
            child: const CircularProgressIndicator(),
          ),
        )
      ],
    );
  }
}
