# flutter_app

A new Flutter project.

## 技术栈

- [Flutter](https://docs.flutter.dev/)
- [GetX](https://github.com/jonataslaw/getx)
- [cupertino_icons](https://pub.dev/packages/cupertino_icons)
- [flutter_screenutil](https://github.com/OpenFlutter/flutter_screenutil)
- [responsive_framework](https://github.com/Codelessly/ResponsiveFramework)
- [card_swiper](https://github.com/TheAnkurPanchani/card_swiper)
- [easy_refresh](https://github.com/xuelongqy/flutter_easy_refresh)
- [flutter_spinkit](https://github.com/jogboms/flutter_spinkit)
- [flutter_datetime_picker]()
- [dio](https://github.com/flutterchina/dio)
- [flutter_dotenv](https://github.com/java-james/flutter_dotenv)
- [hive](https://github.com/hivedb/hive)
- [convert](https://github.com/dart-lang/convert)
- [crypto](https://github.com/dart-lang/crypto)
- [video_player](https://pub.dev/packages/video_player)
- [permission_handler](https://github.com/baseflow/flutter-permission-handler)

## 环境

### 国内源

####

```bash
cat >> ~/.zshrc <<EOF
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
EOF
```

#### 修改 flutter 的 gradle 配置

```bash
# vim /usr/local/flutter/packages/flutter_tools/gradle/flutter.gradle
# 修改buildscript下
// google()
// mavenCentral()
maven { url 'https://maven.aliyun.com/nexus/content/repositories/google' }
maven { url 'https://maven.aliyun.com/nexus/content/groups/public' }

# 修改FlutterPlugin下
// private static final String DEFAULT_MAVEN_HOST = "https://storage.googleapis.com";
private static final String DEFAULT_MAVEN_HOST = "https://storage.flutter-io.cn/download.flutter.io";
```

#### 修改 项目 的 gradle 配置

```bash
# vim android/build.gradle
# 修改buildscript下
// google()
// mavenCentral()
maven { url 'https://maven.aliyun.com/nexus/content/repositories/google' }
maven { url 'https://maven.aliyun.com/nexus/content/groups/public' }
```

## 工具

### getx

```shell
flutter pub global activate get_cli
```

### json2dart

- [json2dart](https://caijinglong.github.io/json2dart)

### firebase

```shell
curl -sL https://firebase.tools | bash
```
