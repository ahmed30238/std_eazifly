import 'dart:developer';

import 'package:eazifly_student/data/models/change_instructor/change_instructor_tojson.dart';
import 'package:eazifly_student/domain/entities/change_instructor/change_instructor_entity.dart';
import 'package:eazifly_student/domain/entities/change_instructor/get_remaining_program_sessions_entity.dart';
import 'package:eazifly_student/domain/entities/change_instructor/get_user_subscription_data_entity.dart';
import 'package:eazifly_student/domain/use_cases/change_instructor_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_remaining_program_sessions_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_user_subscription_data_usecase.dart';
import 'package:eazifly_student/presentation/controller/change_lecturer_controller/changelecturer_state.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/widgets/change_lecturer_reason_body.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/widgets/choose_dates_type_body.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/widgets/choose_proper_lecturer.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/widgets/specify_new_dates_body.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ChangelecturerCubit extends Cubit<ChangelecturerState> {
  ChangelecturerCubit({
    required this.getRemainingProgramSessionsUsecase,
    required this.getUserSubscriptionDataUsecase,
    required this.changeInstructorUsecase,
  }) : super(ChangelecturerInitial());

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

  int selectedStudent = -1;

  void changeSelectedStudent(int val) {
    log("before $selectedStudent");
    selectedStudent = val;
    log("after $selectedStudent");
    emit(ChangeSelectedStdentState());
  }

  //! API
  //! API Variables
  bool changeInstructorLoader = false;
  ChangeInstructorEntity? changeInstructorEntity;
  ChangeInstructorUsecase changeInstructorUsecase;

  bool getUserSubscriptionDataLoader = false;
  GetUserSubscriptionDataEntity? getUserSubscriptionDataEntity;
  GetUserSubscriptionDataUsecase getUserSubscriptionDataUsecase;

  bool getRemainingProgramSessionsLoader = false;
  GetRemainingProgramSessionsEntity? getRemainingProgramSessionsEntity;
  GetRemainingProgramSessionsUsecase getRemainingProgramSessionsUsecase;

  //! API Methods
  Future<void> changeInstructor(
    BuildContext context,
  ) async {
    changeInstructorLoader = true;
    emit(ChangeInstructorLoadingState());
    LectureCubit lectureCubit = context.read<LectureCubit>();
    var oldInstructorId = int.tryParse(lectureCubit
            .showProgramDetailsEntity?.data?.nextSession?.instructorId ??
        "-1");
    final result = await changeInstructorUsecase.call(
      parameter: ChangeInstructorParameters(
        data: ChangeInstructorTojson(
          reasonToChangeInstructorIds: [1,2], // TODO
          instructorId: 3, // TODO
          programId: lectureCubit.currentProgramId,
          oldInstructorId: oldInstructorId ?? -1,
          userId: lectureCubit.userId,
          sessions: [],
        ),
      ),
    );

    result.fold(
      (failure) {
        changeInstructorLoader = false;
        emit(ChangeInstructorErrorState(
          errorMessage: failure.message,
        ));
      },
      (data) {
        changeInstructorLoader = false;
        changeInstructorEntity = data;
        emit(ChangeInstructorSuccessState());
      },
    );
  }

  Future<void> getUserSubscriptionData({
    required int programId,
    required int userId,
  }) async {
    getUserSubscriptionDataLoader = true;
    emit(GetUserSubscriptionDataLoadingState());

    final result = await getUserSubscriptionDataUsecase.call(
      parameter: GetUserSubscriptionDataParameters(
        programId: programId,
        userId: userId,
      ),
    );

    result.fold(
      (failure) {
        getUserSubscriptionDataLoader = false;
        emit(GetUserSubscriptionDataErrorState(
          errorMessage: failure.message,
        ));
      },
      (data) {
        getUserSubscriptionDataLoader = false;
        getUserSubscriptionDataEntity = data;
        emit(GetUserSubscriptionDataSuccessState());
      },
    );
  }

  Future<void> getRemainingProgramSessions({
    required int programId,
    required int userId,
  }) async {
    getRemainingProgramSessionsLoader = true;
    emit(GetRemainingProgramSessionsLoadingState());

    final result = await getRemainingProgramSessionsUsecase.call(
      parameter: GetRemainingProgramSessionsParameters(
        programId: programId,
        userId: userId,
      ),
    );

    result.fold(
      (failure) {
        getRemainingProgramSessionsLoader = false;
        emit(GetRemainingProgramSessionsErrorState(
          errorMessage: failure.message,
        ));
      },
      (data) {
        getRemainingProgramSessionsLoader = false;
        getRemainingProgramSessionsEntity = data;
        emit(GetRemainingProgramSessionsSuccessState());
      },
    );
  }
}
