import 'package:get/get.dart';

class LocalSourceBindings implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<PreferenceManager>(
    //   () => PreferenceManagerImpl(),
    //   tag: (PreferenceManager).toString(),
    //   fenix: true,
    // );

    // Get.lazyPut<StorageService>(() => StorageService());
  }
}
