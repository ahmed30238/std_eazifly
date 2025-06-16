import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/data/models/my_programs/join_session_tojson.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_assigned_children_to_program_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_my_programs_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_session_details_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/join_session_entity.dart';
import 'package:eazifly_student/domain/use_cases/get_assigned_children_to_program_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_my_programs_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_session_details_usecase.dart';
import 'package:eazifly_student/domain/use_cases/join_session_usecase.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_state.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class MyProgramsCubit extends Cubit<MyProgramsState> {
  MyProgramsCubit({
    required this.getMyProgramsUsecase,
    required this.getSessionDetailsUsecase,
    required this.joinSessionUsecase,
    required this.getAssignedChildrenToProgramUsecase,
  }) : super(MyprogramsInitial());
  bool getMyProgramsLoader = false;
  GetMyProgramsEntity? getMyProgramsEntity;
  GetMyProgramsUsecase getMyProgramsUsecase;
  Future<void> getMyPrograms() async {
    getMyProgramsLoader = true;
    emit(GetMyProgramsLoadingState());
    final result = await getMyProgramsUsecase.call(parameter: NoParameter());
    result.fold(
      (failure) {
        getMyProgramsLoader = false;
        emit(GetMyProgramsErrorState(failure.message));
      },
      (data) {
        getMyProgramsLoader = false;
        getMyProgramsEntity = data;
        emit(GetMyProgramsSuccessState());
      },
    );
  }

  bool getSessionDetailsLoader = false;
  GetSessionDetailsEntity? getSessionDetailsEntity;
  GetSessionDetailsUsecase getSessionDetailsUsecase;
  Future<void> getSessionDetails({
    required int sessionId,
  }) async {
    getSessionDetailsLoader = true;
    emit(GetMyProgramsLoadingState());
    final result = await getSessionDetailsUsecase.call(
      parameter: GetSessionDetailsParameters(
        sessionId: sessionId,
      ),
    );
    result.fold(
      (failure) {
        getSessionDetailsLoader = false;
        emit(GetMyProgramsErrorState(failure.message));
      },
      (data) {
        getSessionDetailsLoader = false;
        getSessionDetailsEntity = data;
        emit(GetMyProgramsSuccessState());
      },
    );
  }

  bool getAssignedChildrenLoader = false;
  GetAssignedChildrenToProgramEntity? getAssignedChildrenToProgramEntity;
  GetAssignedChildrenToProgramUsecase getAssignedChildrenToProgramUsecase;

  Future<void> getAssignedChildrenToProgram({
    required int programId,
  }) async {
    getAssignedChildrenLoader = true;
    emit(GetAssignedChildrenLoadingState());

    final result = await getAssignedChildrenToProgramUsecase.call(
      parameter: GetAssignedChildrenToProgramParameters(
        programId: programId,
      ),
    );

    result.fold(
      (failure) {
        getAssignedChildrenLoader = false;
        emit(GetAssignedChildrenErrorState(failure.message));
      },
      (data) {
        getAssignedChildrenLoader = false;
        getAssignedChildrenToProgramEntity = data;
        emit(GetAssignedChildrenSuccessState());
      },
    );
  }

  bool joinSessionLoader = false;
  JoinSessionEntity? joinSessionEntity;
  JoinSessionUsecase joinSessionUsecase;

  Future<void> joinSession({
    required int sessionId,
  }) async {
    joinSessionLoader = true;
    emit(JoinSessionLoadingState());

    final result = await joinSessionUsecase.call(
      parameter: JoinSessionParatmeters(
        data: JoinSessionTojson(
          meetingSessionId: sessionId,
          status: "started", // in this case status always status started
        ),
      ),
    );

    result.fold(
      (failure) {
        joinSessionLoader = false;
        emit(JoinSessionErrorState(failure.message));
      },
      (data) {
        joinSessionLoader = false;
        joinSessionEntity = data;
        emit(JoinSessionSuccessState());
      },
    );
  }
}
