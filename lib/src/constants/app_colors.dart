import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);

class AppColors {
  AppColors._();

  static Color iconColor = Colors.blueAccent.shade200;

  static Color lightPrimaryColor = HexColor('#235196');
  static Color lightTextColor = HexColor('#212121');

  static const Color lightPrimaryVariantColor = Color(0XFFE1E1E1);
  static const Color lightSecondaryColor = Colors.green;
  static const Color lightOnPrimaryColor = Colors.black;

  static const Color darkPrimaryColor = Colors.white24;
  static const Color darkPrimaryVariantColor = Colors.black;
  static const Color darkSecondaryColor = Colors.white;
  static const Color darkOnPrimaryColor = Colors.white;
}
