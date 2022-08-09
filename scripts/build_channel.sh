
#!/bin/sh

flutter build apk --obfuscate --split-debug-info=build/app/outputs/flutter-apk --split-per-abi --dart-define=APP_CHANNEL=$1
mv ../build/app/outputs/apk/release/*.apk ../build/app/outputs/flutter-apk
