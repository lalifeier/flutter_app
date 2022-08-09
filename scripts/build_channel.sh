
#!/bin/sh

flutter build apk --dart-define=ANDROID_CHANNEL=$1
# cd build/app/outputs/apk/release
# mv *.apk
