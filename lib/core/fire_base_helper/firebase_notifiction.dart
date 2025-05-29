import 'dart:async';
import 'dart:developer';

import 'package:eazifly_student/core/enums/storage_enum.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/core/routes/router.dart';
import 'package:eazifly_student/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_storage/get_storage.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await NotificationService.instance.setupFlutterNotifications();
  await NotificationService.instance.showNotification(message);
}

class NotificationService {
  NotificationService._();
  static final NotificationService instance = NotificationService._();

  // HomeNotificationCubit? _notificationCubit;
  // void setCubit(HomeNotificationCubit cubit) {
  //   _notificationCubit = cubit;
  // }

  // ChatsCubit? _chatsCubit;
  // void setChatsCubit(ChatsCubit cubit) {
  //   _chatsCubit = cubit;
  // }

  final _localNotifications = FlutterLocalNotificationsPlugin();
  bool _isFlutterLocalNotificationsInitialized = false;
  late FirebaseMessaging _messaging;
  Future<void> initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    _messaging = FirebaseMessaging.instance;
  }

  Future<String?> getFcmToken() async {
    String? token = '';
    try {
      token = await _messaging.getToken();
      GetStorage().write(StorageEnum.fcmToken.name, token);
    } catch (error) {
      log(error.toString());
    }
    return token;
  }

  Future<void> initialize() async {
    await initializeFirebase();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Request permission
    await _requestPermission();
    _messaging = FirebaseMessaging.instance;

    // Setup message handlers
    await _setupMessageHandlers();
    await getFcmToken();
  }

  Future<void> _requestPermission() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
      announcement: false,
      carPlay: false,
      criticalAlert: false,
    );
  }

  Future<void> setupFlutterNotifications() async {
    if (_isFlutterLocalNotificationsInitialized) {
      return;
    }

    // android setup
    const channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // .resolvePlatformSpecificImplementation<
    //     AndroidFlutterLocalNotificationsPlugin>()
    // ?.createNotificationChannel(channel);

    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // ios setup
    // ignore: prefer_const_constructors
    final initializationSettingsDarwin = DarwinInitializationSettings();

    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    // flutter notification setup
    await _localNotifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {},
    );

    _isFlutterLocalNotificationsInitialized = true;
  }

  Future<void> showNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      await _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'high_importance_channel',
            'High Importance Notifications',
            channelDescription:
                'This channel is used for important notifications.',
            importance: Importance.high,
            priority: Priority.high,
            icon: '@mipmap/ic_launcher',
          ),
          iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        payload: message.data.toString(),
      );
    }
  }

  Future<void> _setupMessageHandlers() async {
    //foreground message
    FirebaseMessaging.onMessage.listen((message) {
      log("this is notification${message.data.toString()}");
      log("${message.data["type"]}");
      log("${message.data["chat_id"]}");
      log("${message.data["chat_id"] is String}");

      showNotification(message);

      if (message.data['type'] == 'chat') {
        log("Get message From Notif Service");
        final chatId = message.data["chat_id"];

        log("id in notif ${message.data["chat_id"]}");
        // _chatsCubit?.getMessages(chatId: chatId, isInitial: true,showLoader: false);
      }

    // TODO GET NOTIFICATION 
      // final notification = GetLatestNotificationDatumEntities(
      //   id: DateTime.now().millisecondsSinceEpoch,
      //   title: message.notification?.title ?? '',
      //   message: message.notification?.body ?? '',
      //   read: false,
      //   type: message.data['type'] ?? 'info',
      // );

      // _notificationCubit?.addRealTimeNotification(notification);
    });

    // background message
    FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessage);

    // opened app
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleBackgroundMessage(initialMessage);
    }
  }

  void _handleBackgroundMessage(RemoteMessage message) {
    if (message.data['type'] == 'chat') {
      // open chat screen
      final String chatId = message.data['chat_id'];
      // log(chatId)
      log("navigating");
      navKey.currentState?.pushNamed(
        RoutePaths.dmViewPath,
        arguments: {
          "chatId": chatId,
        },
      );
    }
  }
}
