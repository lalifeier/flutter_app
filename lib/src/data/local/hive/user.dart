import 'package:hive_flutter/hive_flutter.dart';

import 'base.dart';
import 'model/user.dart';

class UserCache extends CacheBase {
  @override
  String boxName = 'userBox';

  @override
  Future<void> init() async {
    Hive.registerAdapter(UserAdapter());
    box = await Hive.openBox<User>(boxName);
    // box.add(User(userName: 'xxxx'));
  }
}
