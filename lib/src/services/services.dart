import 'package:get/get.dart';

import 'hive_service.dart';

void initServices() async {
  print('starting services ...');

  // await Get.putAsync(() => DbService().init());

  // await Get.putAsync(SettingsService()).init();

  await Get.putAsync(() => HiveService().init());

  print('All services started...');
}
