// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import 'dart:io';

// class StorageService extends GetxService {
//   Future<SharedPreferences> init() async {
//     return await SharedPreferences.getInstance();
//   }
// }

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveService extends GetxService {
  late Box<String> box;

  final BOX_NAME = "default";

  Future<void> init() async {
    if (GetPlatform.isWeb) {
      await Hive.initFlutter();
    } else {
      Directory dir = await getApplicationDocumentsDirectory();
      await Hive.initFlutter(dir.path);
    }

    box = await Hive.openBox<String>(BOX_NAME);
  }

  Future<void> clear() async {
    await Hive.deleteFromDisk();
  }
}
