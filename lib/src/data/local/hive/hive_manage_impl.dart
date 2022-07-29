import 'dart:io';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'hive_manage.dart';

class HiveManageImpl implements HiveManage {
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
