// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'dart:async';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app.dart';
import 'package:flutter_app/app/utils/env.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Environment.load();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // await runZonedGuarded(() async {
  //   FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  //   runApp(const App());
  // }, (error, stackTrace) {
  //   FirebaseCrashlytics.instance.recordError(error, stackTrace);
  // });

  runApp(const App());
}
