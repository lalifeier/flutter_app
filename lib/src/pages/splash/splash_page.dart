import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/index.dart';
import 'splash_controller.dart';

class SplashPage extends GetWidget<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  Widget _buildView(BuildContext context) {
    // return Stack(
    //   children: [
    //     const Center(
    //       child: FlutterLogo(
    //         size: 64,
    //       ),
    //     ),
    //     Align(
    //       alignment: Alignment.bottomCenter,
    //       child: Container(
    //         margin: const EdgeInsets.only(
    //           bottom: 30,
    //         ),
    //         child: const CircularProgressIndicator(),
    //       ),
    //     ),
    //   ],
    // );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.logo,
            width: 70,
            // height: 69,
          ),
          const Text(
            "花生",
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
          const Text(
            "少花钱，多生钱",
            style: TextStyle(
              color: Color(0xff909090),
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: _buildView(context),
    );
  }
}
