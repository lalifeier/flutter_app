import 'package:get/get.dart';

import '../data/local/hive/default.dart';

class LocalSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DefaultCache>(
      () => DefaultCache(),
      tag: (DefaultCache).toString(),
      fenix: true,
    );
  }
}
