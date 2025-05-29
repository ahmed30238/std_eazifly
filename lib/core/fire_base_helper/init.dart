// import 'dart:developer';

// import 'package:eazifly/core/enums/storage_enum.dart';
// import 'package:eazifly/firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:get_storage/get_storage.dart';

// class NotificationHelper {
//   NotificationHelper._();

//   static final NotificationHelper instance = NotificationHelper._();
//   late FirebaseMessaging messaging;
//   Future<void> initializeFirebase() async {
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );
//     messaging = FirebaseMessaging.instance;

//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//   }
  

//   Future<String?> getFcmToken() async {
//     String? token = '';
//     try {
//       token = await messaging.getToken();
//       GetStorage().write(StorageEnum.fcmToken.name, token);
//     } catch (error) {
//       log(error.toString());
//     }
//     return token;
//   }
// }
