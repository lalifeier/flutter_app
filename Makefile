.PHONY: install analyze format format-analyze

# install
install:
	flutter pub get

# outdated
outdated:
	flutter pub outdated

# upgrade
upgrade:
	flutter pub upgrade --major-versions

# analyze
analyze:
	flutter analyze

# format
format:
	flutter format lib/

# format-analyze
format-analyze:
	flutter format --dry-run lib/
	flutter analyze

# json model
json-model:
	flutter packages pub run json_to_model --source=./jsons  --output=lib/src/models

# run dev
run-dev:
	flutter run  --dart-define=APP_ENV=development --target lib/main.dart

# run prod
run-prod:
	flutter run --release --flavor production --dart-define=FLAVOR=production --target lib/main.dart

# build_runner clean
clean:
	flutter packages pub run build_runner clean

# build_runner build
build_runner:
	flutter packages pub run build_runner build --delete-conflicting-outputs

# build android dev
build-android-dev:
	flutter build apk --dart-define=APP_ENV=development --target lib/main.dart

# build android prod
build-android-prod:
	flutter build apk --release --obfuscate --split-debug-info=build/app/outputs/flutter-apk --split-per-abi --dart-define=APP_ENV=production --target lib/main.dart

# build ios dev
build-ios-dev:
	flutter build ios --no-codesign --flavor development --dart-define=FLAVOR=development --target lib/main.dart

# build ios prod
build-ios-prod:
	flutter build ios --release --no-codesign --flavor production --dart-define=FLAVOR=production --target lib/main.dart

# build web dev
build-web-dev:
	flutter build web --dart-define=APP_ENV=development --target lib/main.dart

# build web prod
build-web-prod:
	flutter build web --release --web-renderer html --dart-define=FLAVOR=production --target lib/main.dart

# unit test
unit-test:
	flutter test --coverage --coverage-path=./coverage/lcov.info

# codecov
codecov:
	./scripts/codecov.sh ${CODECOV_TOKEN}

# flutter_native_splash create
splash-create:
	flutter pub run flutter_native_splash:create

# flutter_native_splash remove
splash-remove:
	flutter pub run flutter_native_splash:remove

# flutter_launcher_icons
launcher-icons:
	flutter pub run flutter_launcher_icons:main

help:
	@echo ''
	@echo 'Usage:'
	@echo ' make [target]'
	@echo ''
	@echo 'Targets:'
	@awk '/^[a-zA-Z\-\_0-9]+:/ { \
	helpMessage = match(lastLine, /^# (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")-1); \
			helpMessage = substr(lastLine, RSTART + 2, RLENGTH); \
			printf "\033[36m%-22s\033[0m %s\n", helpCommand,helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help
