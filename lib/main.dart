import 'package:eazifly_student/app.dart';
import 'package:eazifly_student/core/network/handle_token.dart';
import 'package:eazifly_student/core/service_locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait<void>([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    Future(
      () async {
        await ServiceLocator().init();
        await GetStorage.init();
        await TokenUtil.loadTokenToMemory();
      },
    ),
  ]);
  runApp(const MyApp());
}
