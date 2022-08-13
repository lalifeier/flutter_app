import 'dart:io';

import 'package:flutter_app/src/constants/index.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  static Future<void> init() async {
    if (GetPlatform.isWeb) {
      await Hive.initFlutter();
    } else {
      Directory dir = await getApplicationDocumentsDirectory();
      await Hive.initFlutter(dir.path);
    }

    _registerAdapters();

    await _openBoxes();
  }

  static void _registerAdapters() {
    // Hive.registerAdapter(UserAdapter());
  }

  static Future _openBoxes() async {
    await Hive.openBox(HiveConstants.defaultBox);
    // await Hive.openBox(HiveConstants.USER_BOX);
  }
}
