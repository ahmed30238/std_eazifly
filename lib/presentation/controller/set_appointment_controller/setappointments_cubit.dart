import 'package:eazifly_student/presentation/controller/set_appointment_controller/setappointments_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetappointmentsCubit extends Cubit<SetappointmentsState> {
  SetappointmentsCubit() : super(SetappointmentsInitial());
  static SetappointmentsCubit get(BuildContext context) =>
      BlocProvider.of<SetappointmentsCubit>(context);

  final List<Widget> body = [
    Text(
      "data",
    ),
    Column(
      children: [
        Text("الأيام"),
      ],
    )
  ];
  int selectedLecturerIndex = 0;
  changeLecturerIndex(int index) {
    selectedLecturerIndex = index;
    emit(ChangeLecturerIndexState());
  }

  late TabController controller;

  final List<String> tabs = [
    "مواعيد ثابتة",
    'مواعيد مرنة',
  ];

  void initTabBarController(TickerProvider vsync) {
    controller = TabController(length: tabs.length, vsync: vsync);
    controller.addListener(() {
      if (controller.indexIsChanging) {
        controller.animateTo(
          controller.index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
      emit(InitTabBarControllerState());
    });
  }

  int tapbarIndex = 0;

  void changeTapbarIndex(int index) {
    tapbarIndex = index;
    emit(ChangeTapBarIndexState());
  }

  List<bool> chosenDays = [];
  int limit = 3;
  void changeChosenDays(int index) {
    // while (chosenDays.length <= limit) {
    chosenDays[index] = !chosenDays[index];
    // }
    // chosenDays[index] = true;
    emit(ChangeChosenDaysState());
  }

  var days = [
    'السبت',
    'الأحد',
    'الإثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
    'الجمعة',
  ];
}
