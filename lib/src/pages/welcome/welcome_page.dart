import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import 'welcome_controller.dart';
import 'widget/privacy_tip.dart';

class WelcomePage extends GetWidget<WelcomeController> {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 5),
          Column(
            children: const [
              FlutterLogo(size: 64),
              SizedBox(height: 15),
              Text(
                '123****6789',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Spacer(flex: 6),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    maximumSize: const Size(double.infinity, 56),
                    minimumSize: const Size(double.infinity, 56),
                  ),
                  child: const Text('本机一键登录'),
                ),
                const SizedBox(height: 20),
                OutlinedButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.LOGIN);
                  },
                  style: OutlinedButton.styleFrom(
                    maximumSize: const Size(double.infinity, 56),
                    minimumSize: const Size(double.infinity, 56),
                  ),
                  child: const Text('其他方式登录'),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: PrivacyTipWidget(),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
