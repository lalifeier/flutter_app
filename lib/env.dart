class EnvConfig {
  final String appTitle;
  final String baseUrl;

  EnvConfig({
    required this.appTitle,
    required this.baseUrl,
  });
}

enum Environment { debug, test, release }

abstract class EnvName {
  static const String debug = "debug";
  static const String release = "release";
  static const String test = "test";
}

class AppConfig {
  static const appEnv = String.fromEnvironment("DART_DEFINE_APP_ENV");

  static const CHANNEL =
      String.fromEnvironment('APP_CHANNEL', defaultValue: 'unknown');

  // static const VERSION =
  //     int.fromEnvironment('APP_VERSION', defaultValue: 1);
  static bool get isRelease => const bool.fromEnvironment("dart.vm.product");

  static final EnvConfig _debugConfig = EnvConfig(
    appTitle: "debugTitle",
    baseUrl: "http://www.debugxxx.com",
  );

  static final EnvConfig _releaseConfig = EnvConfig(
    appTitle: "releaseTitle",
    baseUrl: "http://www.releasexxx.com",
  );

  static final EnvConfig _testConfig = EnvConfig(
    appTitle: "testTitle",
    baseUrl: "http://www.testxxx.com",
  );

  static EnvConfig get envConfig => _getEnvConfig();

  static EnvConfig _getEnvConfig() {
    switch (appEnv) {
      case EnvName.debug:
        return _debugConfig;
      case EnvName.release:
        return _releaseConfig;
      case EnvName.test:
        return _testConfig;
      default:
        return _debugConfig;
    }
  }
}
