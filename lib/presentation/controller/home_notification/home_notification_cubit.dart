import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/domain/entities/notification/get_latest_notifications_entities.dart';
import 'package:eazifly_student/domain/entities/notification/read_notification_entities.dart';
import 'package:eazifly_student/domain/use_cases/get_latest_notification_usecase.dart';
import 'package:eazifly_student/domain/use_cases/read_notification_usecase.dart';
import 'package:eazifly_student/presentation/controller/home_notification/home_notification_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeNotificationCubit extends Cubit<HomeNotificationState> {
  HomeNotificationCubit({
    required this.getLatestNotificationsUsecase,
    required this.readNotificationUsecase,
  }) : super(HomeNotificationInitial());

  static HomeNotificationCubit get(context) => BlocProvider.of(context);

  final ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  scrollControllerMethod() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100) {
        fetchNotifications();
      }
    });
  }

  final GetLatestNotificationUsecase getLatestNotificationsUsecase;
  GetLatestNotificationsEntities? latestNotificationEntities;

  final List<GetLatestNotificationDatumEntities> _notifications = [];
  List<GetLatestNotificationDatumEntities> get notifications => _notifications;

  final List<bool> _isRead = [];
  List<bool> get isRead => _isRead;

  int _offset = 0;
  final int _limit = 10;
  bool _isFetching = false;
  bool hasMore = true;
  bool getNotificationsLoader = false;

  // ✅ إضافة إشعار في الوقت الحقيقي وتحديث isRead
  void addRealTimeNotification(
      GetLatestNotificationDatumEntities notification) {
    _notifications.insert(0, notification);
    _isRead.insert(0, notification.read ?? false);
    emit(NotificationSuccess());
  }

  Future<void> fetchNotifications({
    bool isInitial = false,
    String type = 'user',
  }) async {
    if (_isFetching || !hasMore) return;

    _isFetching = true;

    if (isInitial) {
      getNotificationsLoader = true;
      emit(NotificationLoading());
      _notifications.clear();
      _isRead.clear();
      _offset = 0;
      hasMore = true;
    } else {
      emit(NotificationLoadingMore());
    }

    try {
      final result = await getLatestNotificationsUsecase.call(
        parameter: GetLatestNotificationParameters(
          offset: _offset,
          type: type,
        ),
      );

      result.fold(
        (failure) {
          getNotificationsLoader = false;
          emit(NotificationError());
        },
        (entities) {
          final newItems = entities.data;
          if (newItems != null && newItems.isNotEmpty) {
            _notifications.addAll(newItems);
            _isRead.addAll(newItems.map((e) => e.read ?? false));
            _offset += newItems.length;
            hasMore = newItems.length >= _limit;
          } else {
            hasMore = false;
          }
          getNotificationsLoader = false;
          emit(NotificationSuccess());
        },
      );
    } catch (e) {
      getNotificationsLoader = false;
      emit(NotificationError());
    } finally {
      _isFetching = false;
    }
  }

  ReadNotificationEntities? readNotificationEntities;
  ReadNotificationUsecase readNotificationUsecase;

  Future<void> readNotification(int index, BuildContext context) async {
    if (_isRead[index] == false) {
      _isRead[index] = true;
      emit(ReadNotificationLoadingState());
    }

    final result = await readNotificationUsecase.call(
      parameter: ReadNotificationParameters(
        notificationId: notifications[index].id ?? -1,
      ),
    );

    result.fold(
      (l) {
        _isRead[index] = false;
        delightfulToast(
          message: "حدث خطأ",
          context: context,
        );
        emit(ReadNotificationErrorState(errorMessage: l.message));
      },
      (r) {
        readNotificationEntities = r;
        emit(ReadNotificationSuccessState());
        emit(NotificationSuccess()); // ✅ إعادة بناء الواجهة لتحديث Badge
      },
    );
  }

  // ✅ تحديث واجهة العرض بعد الرجوع من صفحة الإشعارات
  void refreshReadStatus() {
    emit(NotificationSuccess());
  }

  void reset() {
    _notifications.clear();
    _isRead.clear();
    _offset = 0;
    hasMore = true;
    emit(NotificationInitial());
  }

  @override
  Future<void> close() {
    _scrollController.dispose();
    return super.close();
  }
}
