import 'package:eazifly_student/presentation/controller/change_lecturer_controller/changelecturer_state.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/widgets/change_lecturer_reason_body.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/widgets/choose_dates_type_body.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/widgets/choose_proper_lecturer.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/widgets/specify_new_dates_body.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ChangelecturerCubit extends Cubit<ChangelecturerState> {
  ChangelecturerCubit() : super(ChangelecturerInitial());

  static ChangelecturerCubit get(context) => BlocProvider.of(context);

  List<bool> changeLecturerReason = [];
  bool noChosenReason() {
    bool allFalse = changeLecturerReason.every((element) => element == false);
    return allFalse;
  }

  bool noDateTypeChosen() {
    if (newDates || sameDates) {
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
      if (sameDates) {
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
      if (sameDates) {
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

  bool sameDates = false;
  bool newDates = false;
  void toggleSameDates() {
    sameDates = !sameDates;
    newDates = false;
    emit(ToggleTimeTypeState());
  }

  void toggleNewDates() {
    newDates = !newDates;
    sameDates = false;
    emit(ToggleTimeTypeState());
  }

  List<Widget> bodies = [
    const ChangeLecturerReasonBody(),
    const ChooseDatesTypeBody(),
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
}
