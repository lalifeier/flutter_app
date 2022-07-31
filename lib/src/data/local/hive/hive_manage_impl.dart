import 'dart:io';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'hive_manage.dart';
import 'model/user.dart';

const BOX_NAME = "default";

class HiveManageImpl implements HiveManage {
  late Box<String> box;

  // late Box<User> userBox;

  Future<void> init() async {
    if (GetPlatform.isWeb) {
      await Hive.initFlutter();
    } else {
      Directory dir = await getApplicationDocumentsDirectory();
      await Hive.initFlutter('${dir.path}/data');
    }

    Hive.registerAdapter(UserAdapter());

    box = await Hive.openBox<String>(BOX_NAME);

    // userBox = await Hive.openBox<User>('userBox');
    // userBox.add(User(userName: 'xxxx'));
  }

  Future<void> clear() async {
    await Hive.deleteFromDisk();
  }
}
