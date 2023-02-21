import 'dart:io';

import 'package:asman_work/app/services/shared_prefs_manager.dart';
import 'package:asman_work/utils/settings/http_overrides.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialSettings {
  InitialSettings._();
  static Future<void> init() async {
    // Isolate.current.addErrorListener(
    //   RawReceivePort((pair) async {
    //     final List<dynamic> errorAndStacktrace = pair;
    //     await FirebaseCrashlytics.instance.recordError(
    //       errorAndStacktrace.first,
    //       errorAndStacktrace.last,
    //     );
    //   }).sendPort,
    // );
    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();
    final prefs = await SharedPreferences.getInstance();
    SharedPrefsManager(prefs);
    HttpOverrides.global = MyHttpOverrides();
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    //final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    // await Firebase.initializeApp();
    // CcLockalNotification.initialize();
    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
}
