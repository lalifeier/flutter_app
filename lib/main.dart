import 'package:flutter/material.dart';
import 'package:flutter_app/app/locales/messages.dart';
import 'package:flutter_app/app/routes/app_pages.dart';
import 'package:flutter_app/app/themes/themes.dart';
import 'package:flutter_app/app/utils/env.dart';
import 'package:get/route_manager.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Environment.load();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: GetMaterialApp(
        builder: (context, child) => ResponsiveWrapper.builder(
          child,
          defaultScaleFactor: 1.2,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: '4K'),
          ],
          background: const ColoredBox(color: Colors.white),
        ),
        // unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()),
        initialRoute: AppRoutes.initial,
        getPages: AppPages.pages,
        theme: Themes.green,
        translations: Messages(),
        locale: Get.deviceLocale,
        fallbackLocale: const Locale('en', 'US'),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
