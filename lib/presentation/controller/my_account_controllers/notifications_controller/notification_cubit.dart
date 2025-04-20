import 'package:eazifly_student/presentation/controller/my_account_controllers/notifications_controller/notification_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());
  static NotificationCubit get(context) => BlocProvider.of(context);

  bool turnedOn = false;
  final controller00 = ValueNotifier<bool>(false);
  initController() {
    controller00.addListener(() {});
    emit(ChangeNotificationSwitchState());
  }

  void changeSwitchState() {
    //  controller = ValueNotifier<turnedOn>;
    turnedOn = !turnedOn;

    emit(ChangeNotificationSwitchState());
  }
}
