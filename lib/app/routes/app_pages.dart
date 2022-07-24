import 'package:flutter_app/app/pages/home/home_binding.dart';
import 'package:flutter_app/app/pages/home/home_page.dart';
import 'package:flutter_app/app/pages/login/login_binding.dart';
import 'package:flutter_app/app/pages/login/login_page.dart';
import 'package:flutter_app/app/pages/splash/splash_page.dart';
import 'package:flutter_app/app/pages/welcome/welcome_binding.dart';
import 'package:flutter_app/app/pages/welcome/welcome_page.dart';
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
      name: AppRoutes.welcome,
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
