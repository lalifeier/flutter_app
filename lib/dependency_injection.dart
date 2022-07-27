import 'package:get/get.dart';

import 'src/services/services.dart';

class DenpendencyInjection {
  static Future<void> init() async {
    await Get.putAsync(() => StorageService().init());
  }
}
