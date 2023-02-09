
#!/bin/sh

# Android SDK
cat >> ~/.zshrc <<EOF
export ANDROID_HOME=/opt/android-sdk-linux
export ANDROID_SDK_ROOT=$ANDROID_HOME

export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$ANDROID_HOME/platforms:$PATH"
EOF


ANDROID_SDK_TOOLS_VERSION 8512546

# sdkmanager --list
# android list sdk --all
# android list sdk --extended --proxy-host mirrors.neusoft.edu.cn --proxy-port 80 -s
ANDROID_VERSION=30
ANDROID_BUILD_TOOLS_VERSION="30.0.3"
ANDROID_ARCHITECTURE="x86_64"

mkdir -p $HOME/.android
touch $HOME/.android/repositories.cfg
wget -q https://dl.google.com/android/repository/commandlinetools-linux-${ANDROID_SDK_TOOLS_VERSION}_latest.zip -O android-sdk-tools.zip
sudo mkdir -p ${ANDROID_HOME}/cmdline-tools/
sudo unzip -q android-sdk-tools.zip -d ${ANDROID_HOME}/cmdline-tools/
sudo mv ${ANDROID_HOME}/cmdline-tools/cmdline-tools ${ANDROID_HOME}/cmdline-tools/latest
# sudo chown $USER: $ANDROID_HOME -R
rm android-sdk-tools.zip
yes | sdkmanager --licenses
yes | sdkmanager "build-tools;${ANDROID_BUILD_TOOLS_VERSION}"
yes | sdkmanager "platforms;android-${ANDROID_VERSION}"
yes | sdkmanager platform-tools
yes | sdkmanager emulator
yes | sdkmanager "system-images;android-${ANDROID_VERSION};google_apis_playstore;${ANDROID_ARCHITECTURE}"

# flutter
# fvm
cat >> ~/.zshrc <<EOF
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
export PATH="$HOME/.pub-cache/bin:$HOME/fvm/default/bin:$PATH"

# alias flutter="fvm flutter"
# alias dart="fvm dart"
EOF

wget https://github.com/fluttertools/fvm/releases/download/2.4.1/fvm-2.4.1-linux-x64.tar.gz

# install
brew tap leoafarias/fvm
brew install fvm

# uninstall
brew uninstall fvm
brew untap leoafarias/fvm

# fvm install 3.3.0
fvm install stable
fvm global stable

flutter config --no-analytics --enable-web
flutter precache
yes | flutter doctor --android-licenses
flutter doctor
flutter emulators --create
flutter update-packages

vim ~/fvm/versions/stable/packages/flutter_tools/gradle/flutter.gradle
buildscript {
    repositories {
        // google()
        // mavenCentral()
        maven { url 'https://maven.aliyun.com/nexus/content/repositories/google' }
        maven { url 'https://maven.aliyun.com/nexus/content/groups/public' }
    }
    dependencies {
        /* When bumping, also update ndkVersion above. */
        classpath 'com.android.tools.build:gradle:4.1.0'
    }
}
