import 'dart:async';
import 'dart:developer';

import 'package:eazifly_student/core/enums/storage_enum.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/core/routes/router.dart';
import 'package:eazifly_student/domain/entities/notification/get_latest_notifications_entities.dart';
import 'package:eazifly_student/firebase_options.dart';
import 'package:eazifly_student/presentation/controller/chats/chats_cubit.dart';
import 'package:eazifly_student/presentation/controller/home_notification/home_notification_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_storage/get_storage.dart';

// Constants
class NotificationConstants {
  static const String highImportanceChannelId = 'high_importance_channel';
  static const String highImportanceChannelName =
      'High Importance Notifications';
  static const String highImportanceChannelDescription =
      'This channel is used for important notifications.';
  static const String androidIcon = '@mipmap/ic_launcher';
  static const String chatNotificationType = 'chat';
  static const String chatIdKey = 'chat_id';
  static const String typeKey = 'type';
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await NotificationService.instance.setupFlutterNotifications();
  await NotificationService.instance.showNotification(message);
}

class NotificationService {
  NotificationService._();

  static final NotificationService instance = NotificationService._();

  // Private fields
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();
  bool _isFlutterLocalNotificationsInitialized = false;
  late FirebaseMessaging _messaging;

  // Commented out cubits (keeping as requested)
  HomeNotificationCubit? _notificationCubit;

  void setCubit(HomeNotificationCubit cubit) {
    _notificationCubit = cubit;
  }

  ChatsCubit? _chatsCubit;

  void setChatsCubit(ChatsCubit cubit) {
    _chatsCubit = cubit;
  }

  /// Initialize Firebase and get messaging instance
  Future<void> initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    _messaging = FirebaseMessaging.instance;
  }

  /// Get FCM token and save it to storage
  Future<String?> getFcmToken() async {
    String? token = '';
    try {
      token = await _messaging.getToken();
      await _saveFcmTokenToStorage(token);
    } catch (error) {
      log(error.toString());
    }
    return token;
  }

  /// Main initialization method
  Future<void> initialize() async {
    await initializeFirebase();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    final permissionSettings = await _requestNotificationPermission();

    // Only proceed if permissions are granted
    if (_areNotificationsEnabled(permissionSettings)) {
      await _setupMessageHandlers();
      await getFcmToken();
    } else {
      log('Notification permissions not granted - skipping setup');
    }
  }

  /// Request notification permissions from user
  Future<NotificationSettings> _requestNotificationPermission() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
      announcement: false,
      carPlay: false,
      criticalAlert: false,
    );

    // Log permission status for debugging
    log('Notification permission status: ${settings.authorizationStatus}');

    // Handle different permission states
    switch (settings.authorizationStatus) {
      case AuthorizationStatus.authorized:
        log('User granted notification permissions');
        break;
      case AuthorizationStatus.denied:
        log('User denied notification permissions');
        break;
      case AuthorizationStatus.notDetermined:
        log('User has not determined notification permissions');
        break;
      case AuthorizationStatus.provisional:
        log('User granted provisional notification permissions');
        break;
    }

    return settings;
  }

  /// Setup Flutter local notifications
  Future<void> setupFlutterNotifications() async {
    if (_isFlutterLocalNotificationsInitialized) {
      return;
    }

    await _createAndroidNotificationChannel();
    await _initializeLocalNotifications();
    _isFlutterLocalNotificationsInitialized = true;
  }

  /// Display notification to user
  Future<void> showNotification(RemoteMessage message) async {
    final notification = message.notification;
    final android = message.notification?.android;

    if (_shouldShowNotification(notification, android)) {
      await _displayLocalNotification(notification!, message);
    }
  }

  /// Setup message handlers for different app states
  Future<void> _setupMessageHandlers() async {
    // Foreground message handler
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    // Background message handler
    FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessage);

    // Handle initial message when app is opened from terminated state
    await _handleInitialMessage();
  }

  /// Handle messages when app is in foreground
  void _handleForegroundMessage(RemoteMessage message) {
    _logNotificationData(message);
    showNotification(message);
    _processChatNotification(message);
    _processGeneralNotification(message);
  }

  /// Handle messages when app is opened from background
  void _handleBackgroundMessage(RemoteMessage message) {
    if (_isChatNotification(message)) {
      _navigateToChatScreen(message);
    }
  }

  // Private helper methods

  /// Save FCM token to local storage
  Future<void> _saveFcmTokenToStorage(String? token) async {
    await GetStorage().write(StorageEnum.fcmToken.name, token);
  }

  /// Create Android notification channel
  Future<void> _createAndroidNotificationChannel() async {
    const channel = AndroidNotificationChannel(
      NotificationConstants.highImportanceChannelId,
      NotificationConstants.highImportanceChannelName,
      description: NotificationConstants.highImportanceChannelDescription,
      importance: Importance.high,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);
  }

  /// Initialize local notifications with platform-specific settings
  Future<void> _initializeLocalNotifications() async {
    const initializationSettingsAndroid = AndroidInitializationSettings(
      NotificationConstants.androidIcon,
    );

    // ignore: prefer_const_constructors
    final initializationSettingsDarwin = DarwinInitializationSettings();

    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    await _localNotifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {},
    );
  }

  /// Check if notification should be displayed
  bool _shouldShowNotification(
    RemoteNotification? notification,
    AndroidNotification? android,
  ) {
    return notification != null && android != null;
  }

  /// Display local notification
  Future<void> _displayLocalNotification(
    RemoteNotification notification,
    RemoteMessage message,
  ) async {
    await _localNotifications.show(
      notification.hashCode,
      notification.title,
      notification.body,
      _buildNotificationDetails(),
      payload: message.data.toString(),
    );
  }

  /// Build notification details for both platforms
  NotificationDetails _buildNotificationDetails() {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        NotificationConstants.highImportanceChannelId,
        NotificationConstants.highImportanceChannelName,
        channelDescription:
            NotificationConstants.highImportanceChannelDescription,
        importance: Importance.high,
        priority: Priority.high,
        icon: NotificationConstants.androidIcon,
        showWhen: true,
        when: DateTime.now().millisecondsSinceEpoch,
        autoCancel: true,
        ongoing: false,
        usesChronometer: false,
        showProgress: false,

        // شكل الإشعار البسيط
        styleInformation: const DefaultStyleInformation(true, true),
        category: AndroidNotificationCategory.message,
        visibility: NotificationVisibility.public,
      ),
      iOS: const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
        threadIdentifier: 'default',
      ),
    );
  }

  /// Handle initial message when app is opened from terminated state
  Future<void> _handleInitialMessage() async {
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleBackgroundMessage(initialMessage);
    }
  }

  /// Log notification data for debugging
  void _logNotificationData(RemoteMessage message) {
    log("this is notification${message.data.toString()}");
    log("${message.data[NotificationConstants.typeKey]}");
    log("${message.data[NotificationConstants.chatIdKey]}");
    log("${message.data[NotificationConstants.chatIdKey] is String}");
  }

  /// Process chat-specific notifications
  void _processChatNotification(RemoteMessage message) {
    if (_isChatNotification(message)) {
      log("Get message From Notif Service");
      final chatId = message.data[NotificationConstants.chatIdKey];
      log("id in notif ${message.data[NotificationConstants.chatIdKey]}");
      _chatsCubit?.hasMore = true;
      _chatsCubit?.getMessages(
        chatId: chatId,
        isInitial: true,
        showLoader: false,
      );
    }
  }

  /// Process general notifications
  void _processGeneralNotification(RemoteMessage message) {
    final notification = GetLatestNotificationDatumEntities(
      id: DateTime.now().millisecondsSinceEpoch,
      title: message.notification?.title ?? '',
      message: message.notification?.body ?? '',
      read: false,
      type: message.data['type'] ?? 'info',
    );

    _notificationCubit?.addRealTimeNotification(notification);
  }

  /// Check if notification is a chat notification
  bool _isChatNotification(RemoteMessage message) {
    return message.data[NotificationConstants.typeKey] ==
        NotificationConstants.chatNotificationType;
  }

  /// Navigate to chat screen
  void _navigateToChatScreen(RemoteMessage message) {
    final String chatId = message.data[NotificationConstants.chatIdKey];
    // log(chatId)
    log("navigating");
    navKey.currentState?.pushNamed(
      RoutePaths.dmViewPath,
      arguments: {NotificationConstants.chatIdKey: chatId},
    );
  }

  /// Check if notifications are enabled
  bool _areNotificationsEnabled(NotificationSettings settings) {
    return settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional;
  }
}
