import 'package:flutter_app/src/data/local/preference/preference_manager.dart';
import 'package:get/get.dart';

import '../remote/auth_remote_data_source.dart';

abstract class AuthRepository {
  final AuthRemoteDataSource _remoteSource =
      Get.find(tag: (AuthRemoteDataSource).toString());

  final _localSource = Get.find<PreferenceManager>();
}
