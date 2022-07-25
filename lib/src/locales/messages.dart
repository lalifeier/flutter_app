import 'package:get/get.dart';

import 'lang/en_us.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'zh_CN': {},
      };
}
