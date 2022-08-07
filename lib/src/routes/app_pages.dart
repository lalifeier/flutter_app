import 'package:get/get.dart';

import '../pages/home/home.dart';
import '../pages/login/login.dart';
import '../pages/main/main.dart';
import '../pages/mine/mine.dart';
import '../pages/splash/splash.dart';
import '../pages/welcome/welcome.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = AppRoutes.SPLASH;

  static final pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.WELCOME,
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.MAIN,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.MINE,
      page: () => const MinePage(),
      binding: MineBinding(),
    ),
  ];
}
