import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/widgets/choose_proper_lecturer.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/widgets/specify_new_dates_body.dart';
import 'package:eazifly_student/presentation/view/lecture/cancel_session_view/widgets/cancel_sessions_reasons_body.dart';
import 'package:eazifly_student/presentation/view/lecture/cancel_session_view/widgets/choose_new_dates_options_body.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

part 'cancelsession_state.dart';

class CancelSessionCubit extends Cubit<CancelSessionState> {
  CancelSessionCubit() : super(CancelsessionInitial());
    List<bool> changeLecturerReason = [];
  bool noChosenReason() {
    bool allFalse = changeLecturerReason.every((element) => element == false);
    return allFalse;
  }

  bool noDateTypeChosen() {
    if (chooseNewDateOption || cancelSession) {
      return false;
    } else {
      return true;
    }
  }

  void chooseLecturerReasons(int index, bool value) {
    changeLecturerReason[index] = value;
    emit(ChooseChangeLecturerReasonState());
  }

  int bodyIndex = 0;
  double linearIndicatorPercent = .25;
  void incrementBodyIndex() {
    if (bodyIndex < bodies.length) {
      if (cancelSession) {
        bodyIndex += 2;
        linearIndicatorPercent += .5;
      } else {
        bodyIndex++;
        linearIndicatorPercent += .25;
      }
    }
    emit(IncrementBodyIndexState());
  }

  void decrementBodyIndex(BuildContext context) {
    if (bodyIndex > 0) {
      if (cancelSession) {
        bodyIndex -= 2;
        linearIndicatorPercent -= .5;
      } else {
        bodyIndex--;
        linearIndicatorPercent -= .25;
      }
    } else {
      back(context);
    }
    emit(DecrementBodyIndexState());
  }
  

  bool chooseNewDateOption = false;
  bool cancelSession = false;
  void toggleChooseNewDateOption() {
    chooseNewDateOption = !chooseNewDateOption;
    cancelSession = false;
    emit(ToggleTimeTypeState());
  }

  void toggleCancelSession() {
    cancelSession = !cancelSession;
    chooseNewDateOption = false;
    emit(ToggleTimeTypeState());
  }

  List<Widget> bodies = [
    const CacnelSessionsReasonsBody(),
    const ChooseNewDatesOptionsBody(),
    const SpecifyNewDatesBody(),
    const ChooseProperLecturerBody(),
  ];

  String specifiedDay = "";
  TextEditingController dayController = TextEditingController();
  changeSpecifiedDay(String day) {
    specifiedDay = day;
    dayController.text = day;
    emit(ChangeSpecifiedDayState());
  }

  int dateTypeIndex = 0;
  void changeDateTypeIndex(int index) {
    dateTypeIndex = index;
    emit(ChangeDateTypeIndexState());
  }
    TextEditingController timeController = TextEditingController();
  
  // متغير لحفظ الوقت المحدد
  TimeOfDay? selectedTime;
  
  // دالة لتحديد الوقت
  void changeSelectedTime(TimeOfDay time) {
    selectedTime = time;
    // تنسيق الوقت للعرض
    String formattedTime = _formatTime(time);
    timeController.text = formattedTime;
    emit(ChangeSelectedTimeState());
  }
  
  // دالة لتنسيق الوقت
  String _formatTime(TimeOfDay time) {
    String hour = time.hour.toString().padLeft(2, '0');
    String minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
