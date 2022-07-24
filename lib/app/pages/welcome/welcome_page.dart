import 'package:flutter/material.dart';
import 'package:flutter_app/app/pages/welcome/welcome_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WelcomePage extends GetWidget<WelcomeController> {
  const WelcomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WelcomeImage(),
          Row(
            children: [
              const Spacer(),
              Expanded(
                flex: 8,
                child: LoginAndSignupBtn(),
              ),
              const Spacer()
            ],
          )
        ],
      ),
    );
  }
}

class WelcomeImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Welcome',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 32),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: SvgPicture.asset(
                "assets/icons/chat.svg",
              ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

class LoginAndSignupBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            // Get.offNamed(AppRoutes.login);
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: const StadiumBorder(),
            maximumSize: const Size(double.infinity, 56),
            minimumSize: const Size(double.infinity, 56),
          ),
          child: Text(
            'Login'.toUpperCase(),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            // Get.offNamed(AppRoutes.login);
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: const StadiumBorder(),
            maximumSize: const Size(double.infinity, 56),
            minimumSize: const Size(double.infinity, 56),
          ),
          child: Text(
            'Sign Up'.toUpperCase(),
          ),
        ),
      ],
    );
  }
}
