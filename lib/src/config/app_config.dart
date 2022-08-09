import 'env_config.dart';

class AppConfig {
  static const appEnv = String.fromEnvironment("APP_ENV");

  static bool get isRelease => const bool.fromEnvironment("dart.vm.product");

  static const channel =
      String.fromEnvironment('APP_CHANNEL', defaultValue: 'unknown');

  static String baseUrl = Env.envConfig.baseUrl;
}
