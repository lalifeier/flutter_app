import 'package:get/get.dart';

import 'hive_service.dart';
import 'settings_service.dart';
import 'storage_service.dart';
import 'user_service.dart';

Future<void> initServices() async {
  print('starting services ...');

  await HiveService.init();

  Get.putAsync<StorageService>(() async => StorageService());

  Get.putAsync<SettingsService>(() async => SettingsService());
  Get.putAsync<UserService>(() async => UserService());

  print('All services started...');
}
