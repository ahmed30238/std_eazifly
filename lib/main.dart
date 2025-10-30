import 'package:eazifly_student/app.dart';
import 'package:eazifly_student/core/enums/storage_enum.dart';
import 'package:eazifly_student/core/fire_base_helper/firebase_notifiction.dart';
import 'package:eazifly_student/core/network/handle_token.dart';
import 'package:eazifly_student/core/service_locator/service_locator.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quick_log/quick_log.dart';
import 'package:requests_inspector/requests_inspector.dart';

void main() async {
  Logger logger = const Logger("Main Logger");

  WidgetsFlutterBinding.ensureInitialized();
  // Logger logger = const Logger("Main Logger");
  await ServiceLocator().init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  logger.debug(
    "this is storaged FCMToken before getting it ${await GetStorage().read(StorageEnum.fcmToken.name)}",
  );
  await GetStorage.init();
  await TokenUtil.loadTokenToMemory();
  await NotificationService.instance.initialize();
  // logger.debug(
  //   "this is FCMToken ${await NotificationService.instance.getFcmToken()}",
  // );
  logger.debug(
    "this is storaged FCMToken ${await GetStorage().read(StorageEnum.fcmToken.name)}",
  );
  logger.debug(
    "this is storaged token ${await GetStorage().read(TokenEnum.token.name)}",
  );
  NotificationService.instance.setupFlutterNotifications();
  // Global crash reporting
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp(
    const RequestsInspector(
      enabled: kDebugMode,
      hideInspectorBanner: true,
      showInspectorOn: ShowInspectorOn.LongPress,
      child: MyApp(),
    ),
  );
}
