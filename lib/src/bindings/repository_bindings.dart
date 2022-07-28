import 'package:flutter_app/src/data/repository/auth_repository_impl.dart';
import 'package:get/get.dart';

import '../data/repository/auth_repository.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(),
      tag: (AuthRepository).toString(),
    );
  }
}
