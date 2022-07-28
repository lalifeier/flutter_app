import 'package:get/get.dart';

import 'storage_service.dart';

void initServices() async {
  // await Get.putAsync(() => DbService().init());
  // await Get.putAsync(SettingsService()).init();
  await Get.putAsync(() => StorageService().init());
}
