// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'dart:async';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/src/locales/index.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'src/bindings/initial_binding.dart';
import 'src/constants/index.dart';
import 'src/routes/index.dart';
import 'src/services/index.dart';
import 'src/utils/index.dart';

void setSystemUi() {
  if (GetPlatform.isMobile) {
    // 屏幕方向 竖直上
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // 透明状态栏
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent, // transparent status bar
    // ));
  }

  if (GetPlatform.isAndroid) {
    // 去除顶部系统下拉和底部系统按键
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    // 去掉底部系统按键
    // SystemChrome.setEnabledSystemUIMode(
    //   SystemUiMode.manual,
    //   overlays: [SystemUiOverlay.bottom],
    // );

    // 自定义样式
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
      // 顶部状态栏颜色
      statusBarColor: Colors.transparent,
      // 该属性仅用于 iOS 设备顶部状态栏亮度
      statusBarBrightness: Brightness.light,
      // 顶部状态栏图标的亮度
      statusBarIconBrightness: Brightness.light,

      // 底部状态栏与主内容分割线颜色
      systemNavigationBarDividerColor: Colors.transparent,
      // 底部状态栏颜色
      systemNavigationBarColor: Colors.white,
      // 底部状态栏图标样式
      systemNavigationBarIconBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

Future<void> init() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  setSystemUi();

  await Environment.load();

  Loading();

  // Hive.deleteFromDisk();

  await initServices();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // await runZonedGuarded(() async {
  //   FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  //   runApp(const App());
  // }, (error, stackTrace) {
  //   FirebaseCrashlytics.instance.recordError(error, stackTrace);
  // });
}

void main() async {
  await init();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          builder: EasyLoading.init(),
          // // builder: EasyLoading.init(
          // builder: (context, child) => ResponsiveWrapper.builder(
          //   child,
          //   defaultScaleFactor: 1.2,
          //   maxWidth: 1200,
          //   minWidth: 480,
          //   defaultScale: true,
          //   breakpoints: [
          //     const ResponsiveBreakpoint.resize(480, name: MOBILE),
          //     const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          //     const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          //     const ResponsiveBreakpoint.autoScale(2460, name: '4K'),
          //   ],
          //   background: const ColoredBox(color: Colors.white),
          // ),
          // ),
          // unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()),
          initialRoute: RouteNames.splash,
          getPages: RoutePages.pages,
          navigatorObservers: [RoutePages.observer],

          initialBinding: InitialBinding(),

          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.system,

          translations: Translation(),
          localizationsDelegates: Translation.localizationsDelegates,
          supportedLocales: Translation.supportedLocales,
          locale: Translation.locale,
          fallbackLocale: Translation.fallbackLocale,

          debugShowCheckedModeBanner: false,
          enableLog: true,
        );
      },
    );
  }
}
