import 'package:flutter_app/src/data/local/hive/hive_manage.dart';
import 'package:flutter_app/src/data/local/hive/hive_manage_impl.dart';
import 'package:get/get.dart';

class LocalSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HiveManage>(
      () => HiveManageImpl(),
      tag: (HiveManage).toString(),
      fenix: true,
    );
  }
}
