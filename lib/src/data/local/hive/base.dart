import 'package:hive_flutter/hive_flutter.dart';

class CacheBase<T> {
  late Box<T> box;

  Future<dynamic> getValue(String key, {T? defaultValue}) async {
    return (box).get(key, defaultValue: defaultValue);
  }

  Future<void> setValue(String key, T value) async {
    await (box).put(key, value);
  }
}
