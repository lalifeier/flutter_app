import 'app_config.dart';

class EnvConfig {
  final String appTitle;
  final String baseUrl;

  EnvConfig({
    required this.appTitle,
    required this.baseUrl,
  });
}

abstract class EnvName {
  static const String debug = "debug";
  static const String release = "release";
  static const String test = "test";
}

class Env {
  static final EnvConfig _debugConfig = EnvConfig(
    appTitle: "debugTitle",
    baseUrl: "http://api.debug.xxx.com",
  );

  static final EnvConfig _testConfig = EnvConfig(
    appTitle: "testTitle",
    baseUrl: "http://api.test.xxx.com",
  );

  static final EnvConfig _releaseConfig = EnvConfig(
    appTitle: "releaseTitle",
    baseUrl: "http://api.release.xxx.com",
  );

  static EnvConfig get envConfig => _getEnvConfig();

  static EnvConfig _getEnvConfig() {
    switch (AppConfig.appEnv) {
      case EnvName.debug:
        return _debugConfig;
      case EnvName.test:
        return _testConfig;
      case EnvName.release:
        return _releaseConfig;
      default:
        return _debugConfig;
    }
  }
}
