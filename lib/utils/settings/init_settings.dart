import 'dart:io';

import 'package:asmanshop/data/clients/local/get_storage.dart';
import 'package:asmanshop/utils/globals/enums.dart';
import 'package:asmanshop/utils/services/login_service.dart';
import 'package:asmanshop/utils/settings/http_overrides.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

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
    final token = StorageGet().getValue<String>(EnumStorageKeys.userToken);
    LoginService().login(token ?? '');
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
