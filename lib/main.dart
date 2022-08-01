// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'dart:async';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'src/bindings/initial_binding.dart';
import 'src/constants/constants.dart';
import 'src/locales/messages.dart';
import 'src/routes/app_pages.dart';
import 'src/utils/environment.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Environment.load();

  // initServices();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // await runZonedGuarded(() async {
  //   FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  //   runApp(const App());
  // }, (error, stackTrace) {
  //   FirebaseCrashlytics.instance.recordError(error, stackTrace);
  // });

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {},
        child: GetMaterialApp(
          // builder: EasyLoading.init(
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
          // ),
          // unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()),
          initialRoute: AppPages.INITIAL,
          initialBinding: InitialBinding(),
          getPages: AppPages.pages,
          theme: AppTheme.lightTheme,
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.light,
          translations: Messages(),
          locale: Get.deviceLocale,
          fallbackLocale: const Locale('en', 'US'),
          debugShowCheckedModeBanner: false,
          enableLog: true,
        ));
  }
}
