
#!/bin/sh

flutter build apk --release --obfuscate --split-debug-info=build/app/outputs/flutter-apk --split-per-abi --dart-define=APP_CHANNEL=$1 --target lib/main.dart
mv ../build/app/outputs/apk/release/*.apk ../build/app/outputs/flutter-apk
