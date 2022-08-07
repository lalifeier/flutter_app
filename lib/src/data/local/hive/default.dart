import 'package:flutter_app/src/data/local/hive/base.dart';
import 'package:hive/hive.dart';

import '../../../constants/constants.dart';

class DefaultCache extends CacheBase {
  @override
  Box box = Hive.box(HiveConstants.DEFAULT_BOX);

  Future<bool> getIsLogin() async {
    return await getValue(HiveConstants.IS_LOGIN_KEY);
  }

  Future<void> setIsLogin(bool value) async {
    await setValue(HiveConstants.IS_LOGIN_KEY, value);
  }
}
