import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../index.dart';

class Background extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    BoxDecoration defaultBackground = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFFB2E1B),
          Color(0xFFFF5640),
        ],
      ),
    );
    return Obx(
      () => Container(
        child: Column(
          children: [
            Container(
              height: 85,
              decoration: defaultBackground,
            ),
            Container(
              child: ClipPath(
                clipper: BackgroundClipper(),
                child: Container(
                  width: double.infinity,
                  decoration: defaultBackground,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height / 1.2);
    path.cubicTo(0, size.height, size.width * 1.2, size.height, size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
