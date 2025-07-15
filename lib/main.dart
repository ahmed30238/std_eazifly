import 'package:eazifly_student/app.dart';
import 'package:eazifly_student/core/enums/storage_enum.dart';
import 'package:eazifly_student/core/fire_base_helper/firebase_notifiction.dart';
import 'package:eazifly_student/core/network/handle_token.dart';
import 'package:eazifly_student/core/service_locator/service_locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quick_log/quick_log.dart';
import 'package:requests_inspector/requests_inspector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Logger logger = const Logger("Main Logger");

  await Future.wait<void>([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]),
    Future(
      () async {
        await ServiceLocator().init();
        await GetStorage.init();
        await TokenUtil.loadTokenToMemory();
      },
    ),
  ]);
  await NotificationService.instance.initialize();
  logger.debug(
      "this is FCMToken ${await GetStorage().read(StorageEnum.fcmToken.name)}");
  // logger.info("my token is empty ${TokenUtil.getTokenFromMemory().isEmpty}");
  // logger.error("val is ${TokenUtil.getTokenFromMemory()}");
  NotificationService.instance.setupFlutterNotifications();
  runApp(
    const RequestsInspector(
      enabled: kDebugMode,
      hideInspectorBanner: true,
      showInspectorOn: ShowInspectorOn.LongPress,
      child: MyApp(),
    ),
  );
}
