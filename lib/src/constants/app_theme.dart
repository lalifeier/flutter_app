import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../extension/index.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    // useMaterial3: true,
    primarySwatch: AppColors.primaryColor.materialColor,
    textTheme: GoogleFonts.robotoTextTheme(),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColors.primaryColor),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: AppColors.darkPrimaryColor.materialColor,
    textTheme: GoogleFonts.robotoTextTheme(),
  );
}
