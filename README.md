# flutter_app

A new Flutter project.

## Environment

### proxy

```js
# android/build.gradle
// google()
// mavenCentral()
maven { url 'https://maven.aliyun.com/nexus/content/repositories/google' }
maven { url 'https://maven.aliyun.com/nexus/content/groups/public' }

# flutter sdk
# /usr/local/flutter/packages/flutter_tools/gradle/flutter.gradle
// google()
// mavenCentral()
maven { url 'https://maven.aliyun.com/nexus/content/repositories/google' }
maven { url 'https://maven.aliyun.com/nexus/content/groups/public' }
```

## Tool

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
