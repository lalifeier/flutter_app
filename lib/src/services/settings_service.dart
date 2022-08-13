import 'dart:ui';

import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../constants/index.dart';
import '../locales/index.dart';
import 'storage_service.dart';

class SettingsService extends GetxService {
  static SettingsService get to => Get.find();

  PackageInfo? _packageInfo;
  String get version => _packageInfo?.version ?? '-';

  Future<bool> get isFirstOpen async =>
      await StorageService.to.getIsFirstOpen();

  Locale locale = PlatformDispatcher.instance.locale;

  final RxBool _isDarkMode = Get.isDarkMode.obs;
  bool get isDarkMode => _isDarkMode.value;

  void init() async {}

  @override
  void onReady() {
    super.onReady();
    getPackageInfo();
    initLanguage();
    initTheme();
  }

  Future<void> getPackageInfo() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  void setIsFirstOpen({bool value = true}) async {
    await StorageService.to.setIsFirstOpen(value);
  }

  void initLanguage() async {
    String language = await StorageService.to.getLanguage();
    if (language.isEmpty) return;
    int index = Translation.supportedLocales.indexWhere((el) {
      return el.languageCode == language;
    });
    if (index < 0) return;
    locale = Translation.supportedLocales[index];
    Get.updateLocale(locale);
  }

  void setLanguage(Locale value) async {
    locale = value;
    Get.updateLocale(value);
    await StorageService.to.setLanguage(value.languageCode);
  }

  void initTheme() async {
    final theme = await StorageService.to.getTheme();
    setThemeMode(theme);
  }

  Future<void> setThemeMode(String theme) async {
    _isDarkMode.value = theme == "dark" ? true : false;
    Get.changeTheme(
      isDarkMode == true ? AppTheme.dark : AppTheme.light,
    );
    StorageService.to.setTheme(isDarkMode == true ? "dark" : "light");
  }
}
