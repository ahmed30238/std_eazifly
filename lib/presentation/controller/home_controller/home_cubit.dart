import 'dart:convert';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/enums/storage_enum.dart';
import 'package:eazifly_student/data/models/auth/login_model.dart';
import 'package:eazifly_student/domain/entities/home/get_home_closest_sessions_entity.dart';
import 'package:eazifly_student/domain/entities/home/get_home_current_session_entity.dart';
import 'package:eazifly_student/domain/entities/home/get_home_library_entity.dart';
import 'package:eazifly_student/domain/use_cases/get_home_closest_sessions_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_home_current_session_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_home_library_usecase.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:get_storage/get_storage.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.getHomeLibraryUsecase,
    required this.getHomeCurrentSessionUsecase,
    required this.getHomeClosestSessionsUsecase,
  }) : super(HomeInitial()) {
    userId = DataModel.fromJson(
          jsonDecode(GetStorage().read(StorageEnum.loginModel.name)),
        ).id ??
        0;
  }
  static HomeCubit get(context) => BlocProvider.of(context);
  CarouselSliderController carouselSliderController =
      CarouselSliderController();

  bool getHomeCurrentSessionLoader = false;
  GetHomeCurrentSessionEntity? getHomeCurrentSessionEntity;
  GetHomeCurrentSessionUsecase getHomeCurrentSessionUsecase;

  int userId = -1;
  Future<void> getHomeCurrentSession() async {
    getHomeCurrentSessionLoader = true;
    emit(GetHomeCurrentSessionLoadingState());
    final result = await getHomeCurrentSessionUsecase.call(
      parameter: GetHomeCurrentSessionParameters(
          userId: userId), // تأكد من وجود userId في الكلاس
    );
    result.fold(
      (l) {
        getHomeCurrentSessionLoader = false;
        emit(GetHomeCurrentSessionErrorState(errorMessage: l.message));
      },
      (r) {
        getHomeCurrentSessionLoader = false;
        getHomeCurrentSessionEntity = r;
        emit(GetHomeCurrentSessionSuccessState());
      },
    );
  }

  bool getHomeLibraryLoader = false;
  GetHomeLibraryEntity? getHomeLibraryEntity;
  GetHomeLibraryUsecase getHomeLibraryUsecase;

  Future<void> getHomeLibrary() async {
    getHomeLibraryLoader = true;
    emit(GetHomeLibraryLoadingState());
    final result = await getHomeLibraryUsecase.call(
      parameter: NoParameter(),
    );
    result.fold(
      (l) {
        getHomeLibraryLoader = false;
        emit(GetHomeLibraryErrorState(errorMessage: l.message));
      },
      (r) {
        getHomeLibraryLoader = false;
        getHomeLibraryEntity = r;
        emit(GetHomeLibrarySuccessState());
      },
    );
  }

  bool getHomeClosestSessionsLoader = false;
  GetHomeClosestSessionsEntity? getHomeClosestSessionsEntity;
  GetHomeClosestSessionsUsecase getHomeClosestSessionsUsecase;

  Future<void> getHomeClosestSessions() async {
    getHomeClosestSessionsLoader = true;
    emit(GetHomeClosestSessionsLoadingState());
    final result = await getHomeClosestSessionsUsecase.call(
      parameter: GetHomeClosestSessionsParameters(
          userId: userId), // تأكد من وجود userId في الكلاس
    );
    result.fold(
      (l) {
        getHomeClosestSessionsLoader = false;
        emit(GetHomeClosestSessionsErrorState(errorMessage: l.message));
      },
      (r) {
        getHomeClosestSessionsLoader = false;
        getHomeClosestSessionsEntity = r;
        emit(GetHomeClosestSessionsSuccessState());
      },
    );
  }
}
