import 'dart:ui';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'lang/en_US.dart';
import 'lang/zh_CN.dart';

class Translation extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('en', 'US');

  static const supportedLocales = [
    Locale('en', 'US'),
    Locale('zh', 'CN'),
  ];

  static const localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'en': en_US,
        'zh': zh_CN,
      };
}
