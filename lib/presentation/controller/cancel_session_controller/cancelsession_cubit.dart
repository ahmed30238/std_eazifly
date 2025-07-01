import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/data/models/sessions/cancel_session_tojson.dart';
import 'package:eazifly_student/data/models/sessions/change_session_date_tojson.dart';
import 'package:eazifly_student/domain/entities/sessions/cancel_session_entity.dart';
import 'package:eazifly_student/domain/entities/sessions/change_session_date_entity.dart';
import 'package:eazifly_student/domain/entities/sessions/get_cancel_session_reason_entity.dart';
import 'package:eazifly_student/domain/entities/sessions/get_instructor_availabilities_entity.dart';
import 'package:eazifly_student/domain/use_cases/cancel_session_usecase.dart';
import 'package:eazifly_student/domain/use_cases/change_session_date_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_cancel_session_reasons_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_instructor_availabilities_usecase.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/widgets/choose_proper_lecturer.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/widgets/specify_new_dates_body.dart';
import 'package:eazifly_student/presentation/view/lecture/cancel_session_view/widgets/cancel_sessions_reasons_body.dart';
import 'package:eazifly_student/presentation/view/lecture/cancel_session_view/widgets/choose_new_dates_options_body.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

part 'cancelsession_state.dart';

class CancelSessionCubit extends Cubit<CancelSessionState> {
  CancelSessionCubit({
    required this.getInstructorAvailabilitiesUsecase,
    required this.getCancelSessionReasonsUsecase,
    required this.cancelSessionUsecase,
    required this.changeSessionDateUsecase,
  }) : super(CancelsessionInitial());
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

  bool getCancelReasonsLoader = false;
  GetCancelSessionReasonEntity? getCancelReasonsEntity;
  GetCancelSessionReasonsUsecase getCancelSessionReasonsUsecase;
  Future<void> getCancelReasons() async {
    getCancelReasonsLoader = true;
    emit(GetCancelReasonsLoadingState());
    final result = await getCancelSessionReasonsUsecase.call(
      parameter: NoParameter(),
    );
    result.fold(
      (failure) {
        getCancelReasonsLoader = false;
        emit(GetCancelReasonsErrorState(failure.message));
      },
      (data) {
        getCancelReasonsLoader = false;
        getCancelReasonsEntity = data;
        emit(GetCancelReasonsSuccessState());
      },
    );
  }

  bool getInstructorAvailabilitiesLoader = false;
  GetInstructorAvailabilitiesEntity? getInstructorAvailabilitiesEntity;
  GetInstructorAvailabilitiesUsecase getInstructorAvailabilitiesUsecase;
  Future<void> getInstructorAvailabilities({
    required int instructorId,
    required int duration,
  }) async {
    getInstructorAvailabilitiesLoader = true;
    emit(GetInstructorAvailabilitiesLoadingState());
    final result = await getInstructorAvailabilitiesUsecase.call(
      parameter: GetInstructorAvailabilitiesParameters(
        instructorId: instructorId,
        duration: duration,
      ),
    );
    result.fold(
      (failure) {
        getInstructorAvailabilitiesLoader = false;
        emit(GetInstructorAvailabilitiesErrorState(failure.message));
      },
      (data) {
        getInstructorAvailabilitiesLoader = false;
        getInstructorAvailabilitiesEntity = data;
        emit(GetInstructorAvailabilitiesSuccessState());
      },
    );
  }

  bool changeSessionDateLoader = false;
  ChangeSessionDateEntity? changeSessionDateEntity;
  ChangeSessionDateUsecase changeSessionDateUsecase;
  Future<void> changeSessionDate({
    required ChangeSessionDateTojson data,
    required int sessionId,
  }) async {
    changeSessionDateLoader = true;
    emit(ChangeSessionDateLoadingState());
    final result = await changeSessionDateUsecase.call(
      parameter: ChangeSessionDateParameters(
        data: data,
        sessionId: sessionId,
      ),
    );
    result.fold(
      (failure) {
        changeSessionDateLoader = false;
        emit(ChangeSessionDateErrorState(failure.message));
      },
      (data) {
        changeSessionDateLoader = false;
        changeSessionDateEntity = data;
        emit(ChangeSessionDateSuccessState());
      },
    );
  }

  bool postCancelSessionLoader = false;
  CancelSessionEntity? postCancelSessionEntity;
  CancelSessionUsecase cancelSessionUsecase;
  Future<void> postCancelSession() async {
    postCancelSessionLoader = true;
    emit(PostCancelSessionLoadingState());
    final result = await cancelSessionUsecase.call(
      parameter: CancelSessionParameters(
        data: CancelSessionTojson(
          reasonsIds: [1, 2],
          sessionId: 1,
        ),
      ),
    );
    result.fold(
      (failure) {
        postCancelSessionLoader = false;
        emit(PostCancelSessionErrorState(failure.message));
      },
      (data) {
        postCancelSessionLoader = false;
        postCancelSessionEntity = data;
        emit(PostCancelSessionSuccessState());
      },
    );
  }
}
