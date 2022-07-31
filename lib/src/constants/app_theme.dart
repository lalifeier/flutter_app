import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/color.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    primarySwatch: createMaterialColor(AppColors.lightPrimaryColor),
    textTheme: GoogleFonts.robotoTextTheme(),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColors.lightPrimaryColor),
      ),
    ),
  );

  // static final ThemeData lightTheme = ThemeData(
  //   primaryColor: AppColors.lightPrimaryColor,
  //   textButtonTheme: TextButtonThemeData(
  //     style: TextButton.styleFrom(
  //       textStyle: TextStyle(
  //         color: AppColors.lightPrimaryColor,
  //       ),
  //     ),
  //   ),
  //   elevatedButtonTheme: ElevatedButtonThemeData(
  //     style: ElevatedButton.styleFrom(
  //       primary: AppColors.lightPrimaryColor,
  //     ),
  //   ),
  //   outlinedButtonTheme: OutlinedButtonThemeData(
  //     style: OutlinedButton.styleFrom(
  //       primary: AppColors.lightPrimaryColor,
  //       side: BorderSide(color: AppColors.lightPrimaryColor),
  //     ),
  //   ),
  //   // scaffoldBackgroundColor: AppColors.lightPrimaryVariantColor,
  //   // appBarTheme: const AppBarTheme(
  //   //   color: AppColors.lightPrimaryVariantColor,
  //   //   iconTheme: IconThemeData(color: AppColors.lightOnPrimaryColor),
  //   // ),
  //   // colorScheme: const ColorScheme.light(
  //   //   primary: AppColors.lightPrimaryColor,
  //   //   secondary: AppColors.lightSecondaryColor,
  //   //   onPrimary: AppColors.lightOnPrimaryColor,
  //   // ),
  //   // iconTheme: IconThemeData(
  //   //   color: AppColors.iconColor,
  //   // ),
  //   // textTheme: _lightTextTheme,
  // );

  // static final ThemeData darkTheme = ThemeData(
  //   scaffoldBackgroundColor: AppColors.darkPrimaryVariantColor,
  //   appBarTheme: const AppBarTheme(
  //     color: AppColors.darkPrimaryVariantColor,
  //     iconTheme: IconThemeData(color: AppColors.darkOnPrimaryColor),
  //   ),
  //   colorScheme: const ColorScheme.light(
  //     primary: AppColors.darkPrimaryColor,
  //     secondary: AppColors.darkSecondaryColor,
  //     onPrimary: AppColors.darkOnPrimaryColor,
  //   ),
  //   iconTheme: IconThemeData(
  //     color: AppColors.iconColor,
  //   ),
  //   textTheme: _darkTextTheme,
  // );

  static const TextTheme _lightTextTheme = TextTheme(
    headline5: _lightScreenHeadingTextStyle,
    bodyText2: _lightScreenTaskNameTextStyle,
    bodyText1: _lightScreenTaskDurationTextStyle,
  );

  // static final TextTheme _darkTextTheme = TextTheme(
  //   headline5: _darkScreenHeadingTextStyle,
  //   bodyText2: _darkScreenTaskNameTextStyle,
  //   bodyText1: _darkScreenTaskDurationTextStyle,
  // );

  static const TextStyle _lightScreenHeadingTextStyle =
      TextStyle(fontSize: 48.0, color: AppColors.lightOnPrimaryColor);
  static const TextStyle _lightScreenTaskNameTextStyle =
      TextStyle(fontSize: 20.0, color: AppColors.lightOnPrimaryColor);
  static const TextStyle _lightScreenTaskDurationTextStyle =
      TextStyle(fontSize: 16.0, color: Colors.grey);

  // static final TextStyle _darkScreenHeadingTextStyle =
  //     _lightScreenHeadingTextStyle.copyWith(
  //         color: AppColors.darkOnPrimaryColor);
  // static final TextStyle _darkScreenTaskNameTextStyle =
  //     _lightScreenTaskNameTextStyle.copyWith(
  //         color: AppColors.darkOnPrimaryColor);
  // static const TextStyle _darkScreenTaskDurationTextStyle =
  //     _lightScreenTaskDurationTextStyle;

  // changeTheme() {
  //   Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
  //   // Get.changeTheme(ThemeData.dark());
  // }
}
