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
    _initializeUser();
  }
  
  static HomeCubit get(context) => BlocProvider.of(context);
  CarouselSliderController carouselSliderController = CarouselSliderController();

  int userId = -1;
  bool isGuest = true;

  void _initializeUser() {
    try {
      final loginData = DataModel.fromJson(
        jsonDecode(GetStorage().read(StorageEnum.loginModel.name)),
      );
      userId = loginData.id ?? 0;
      isGuest = loginData.isGuest ?? true;
    } catch (e) {
      userId = 0;
      isGuest = true;
    }
  }

  // Initialize all data
  Future<void> initializeHomeData() async {
    // Always load library
    await getHomeLibrary();
    
    // Only load user-specific data if not guest
    if (!isGuest && userId > 0) {
      await Future.wait([
        getHomeCurrentSession(),
        getHomeClosestSessions(),
      ]);
    }
  }

  // Current Session
  bool getHomeCurrentSessionLoader = false;
  GetHomeCurrentSessionEntity? getHomeCurrentSessionEntity;
  GetHomeCurrentSessionUsecase getHomeCurrentSessionUsecase;

  Future<void> getHomeCurrentSession() async {
    if (isGuest) return;
    
    getHomeCurrentSessionLoader = true;
    emit(GetHomeCurrentSessionLoadingState());
    
    final result = await getHomeCurrentSessionUsecase.call(
      parameter: GetHomeCurrentSessionParameters(userId: userId),
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

  // Home Library
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

  // Closest Sessions
  bool getHomeClosestSessionsLoader = false;
  GetHomeClosestSessionsEntity? getHomeClosestSessionsEntity;
  GetHomeClosestSessionsUsecase getHomeClosestSessionsUsecase;

  Future<void> getHomeClosestSessions() async {
    if (isGuest) return;
    
    getHomeClosestSessionsLoader = true;
    emit(GetHomeClosestSessionsLoadingState());
    
    final result = await getHomeClosestSessionsUsecase.call(
      parameter: GetHomeClosestSessionsParameters(userId: userId),
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

  // Refresh all data
  Future<void> refreshAllData() async {
    await initializeHomeData();
  }

  // Reset cubit state
  void resetState() {
    getHomeCurrentSessionLoader = false;
    getHomeCurrentSessionEntity = null;
    
    getHomeLibraryLoader = false;
    getHomeLibraryEntity = null;
    
    getHomeClosestSessionsLoader = false;
    getHomeClosestSessionsEntity = null;
    
    emit(HomeInitial());
  }
}