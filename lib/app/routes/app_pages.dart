import 'package:flutter_app/app/pages/home/home_binding.dart';
import 'package:flutter_app/app/pages/home/home_page.dart';
import 'package:flutter_app/app/pages/splash/splash_page.dart';
import 'package:get/get.dart';

part './app_routes.dart';

class AppPages {
  AppPages._();

  static final pages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.login,
    //   page: () => const LoginPage(),
    // ),
  ];
}
