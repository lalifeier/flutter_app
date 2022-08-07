import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  Environment._();

  static String appEnv =
      const String.fromEnvironment("APP_ENV", defaultValue: "development");

  static String getFileName() {
    return '.env.$appEnv';
  }

  static Future load() async => await dotenv.load(fileName: getFileName());

  static dynamic get(String key, {dynamic defaultValue}) {
    if (!dotenv.env.containsKey(key) && defaultValue != null) {
      return defaultValue;
    }

    String? value = dotenv.env[key];

    if (value == 'null' || value == null) {
      return null;
    }

    if (value.toLowerCase() == 'true') {
      return true;
    }

    if (value.toLowerCase() == 'false') {
      return false;
    }

    return value.toString();
  }

  static String apiBaseUrl = dotenv.get('API_BASE_URL');

  static String channel = const String.fromEnvironment('APP_CHANNEL');

  static bool get isRelease => const bool.fromEnvironment("dart.vm.product");
}
