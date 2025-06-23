// Updated subscriptionmanagement_cubit.dart
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/data/models/subscription_management/renew_subscription_tojson.dart';
import 'package:eazifly_student/domain/entities/subscription_management/cancel_subscription_entity.dart';
import 'package:eazifly_student/domain/entities/subscription_management/get_library_subscription_entity.dart';
import 'package:eazifly_student/domain/entities/subscription_management/get_program_subscription_entity.dart';
import 'package:eazifly_student/domain/entities/subscription_management/renew_subscription_entity.dart';
import 'package:eazifly_student/domain/entities/subscription_management/show_plan_entity.dart';
import 'package:eazifly_student/domain/use_cases/cancel_subscription_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_library_subscription_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_program_subscriptions_usecase.dart';
import 'package:eazifly_student/domain/use_cases/renew_subscription_usecase.dart';
import 'package:eazifly_student/domain/use_cases/show_plan_usecase.dart';
import 'package:eazifly_student/presentation/controller/my_account_controllers/subscriptionmanagement_state.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/widgets/all_sub_body.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/widgets/sub_programs_body.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/widgets/subscriptions_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscriptionmanagementCubit extends Cubit<SubscriptionmanagementState> {
  SubscriptionmanagementCubit({
    required this.getProgramSubscriptionUsecase,
    required this.getLibrarySubscriptionUsecase,
    required this.cancelSubscriptionUsecase,
    required this.renewSubscriptionUsecase,
    required this.showPlanUsecase,
  }) : super(SubscriptionmanagementInitial());

  static SubscriptionmanagementCubit get(BuildContext context) =>
      BlocProvider.of<SubscriptionmanagementCubit>(context);

  final List<Widget> body = [
    const AllSubBody(),
    const SubProgramsBody(),
    const SubscriptionsBody(),
  ];

  late TabController controller;

  final List<String> tabs = [
    "الكل",
    'البرامج',
    'الاشتراكات',
  ];
  int programId = -1;
  void initProgramId(int programId) {
    this.programId = programId;
  }

  int studentNumber = -1;
  fillProgramStudentNumber(
    int studentNumber,
  ) {
    this.studentNumber = studentNumber;
  }

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

    // Load initial data for "الكل" tab
    loadAllSubscriptions();
  }

  int tapbarIndex = 0;

  void changeTapbarIndex(int index) {
    tapbarIndex = index;

    // Load data based on selected tab
    switch (index) {
      case 0: // الكل
        loadAllSubscriptions();
        break;
      case 1: // البرامج
        getProgramSubscription(); // Replace with actual IDs
        break;
      case 2: // الاشتراكات
        getLibrarySubscription(userId: 1); // Replace with actual user ID
        break;
    }

    emit(ChangeTapBarIndexState());
  }

  // Load all subscriptions (both program and library)
  void loadAllSubscriptions() {
    getProgramSubscription(); // Replace with actual IDs
    getLibrarySubscription(userId: 1); // Replace with actual user ID
  }

  //! ################# API ####################
  bool getProgramSubscriptionLoader = false;
  GetProgramSubscriptionEntity? getProgramSubscriptionEntity;
  GetProgramSubscriptionsUsecase getProgramSubscriptionUsecase;

  Future<void> getProgramSubscription() async {
    getProgramSubscriptionLoader = true;
    emit(GetProgramSubscriptionLoadingState());

    final result =
        await getProgramSubscriptionUsecase.call(parameter: NoParameter());

    result.fold(
      (failure) {
        getProgramSubscriptionLoader = false;
        emit(GetProgramSubscriptionErrorState(errorMessage: failure.message));
      },
      (data) {
        getProgramSubscriptionLoader = false;
        getProgramSubscriptionEntity = data;
        emit(GetProgramSubscriptionSuccessState());
      },
    );
  }

  bool getLibrarySubscriptionLoader = false;
  GetLibrarySubscriptionEntity? getLibrarySubscriptionEntity;
  GetLibrarySubscriptionUsecase getLibrarySubscriptionUsecase;

  Future<void> getLibrarySubscription({
    required int userId,
  }) async {
    getLibrarySubscriptionLoader = true;
    emit(GetLibrarySubscriptionLoadingState());

    final result =
        await getLibrarySubscriptionUsecase.call(parameter: NoParameter());

    result.fold(
      (failure) {
        getLibrarySubscriptionLoader = false;
        emit(GetLibrarySubscriptionErrorState(errorMessage: failure.message));
      },
      (data) {
        getLibrarySubscriptionLoader = false;
        getLibrarySubscriptionEntity = data;
        emit(GetLibrarySubscriptionSuccessState());
      },
    );
  }

  bool cancelSubscriptionLoader = false;
  CancelSubscriptionEntity? cancelSubscriptionEntity;
  CancelSubscriptionUsecase cancelSubscriptionUsecase;

  Future<void> cancelSubscription({
    required int mainId,
  }) async {
    cancelSubscriptionLoader = true;
    emit(CancelSubscriptionLoadingState());

    final result = await cancelSubscriptionUsecase.call(
      parameter: CancelSubscriptionParameters(mainId: mainId),
    );

    result.fold(
      (failure) {
        cancelSubscriptionLoader = false;
        emit(CancelSubscriptionErrorState(errorMessage: failure.message));
      },
      (data) {
        cancelSubscriptionLoader = false;
        cancelSubscriptionEntity = data;
        emit(CancelSubscriptionSuccessState());
      },
    );
  }

  File? renewOrderImage;
  Future<void> pickOrderImageFromGallery() async {
    final response = await pickImageFromGallery();
    if (response != null) {
      renewOrderImage = File(response.path);
      log("DEBUG: Image selected: ${renewOrderImage?.path}");
    }
    emit(PickImageFromGallerySuccessState());
  }

  bool renewSubscriptionLoader = false;
  RenewSubscriptionEntity? renewSubscriptionEntity;
  RenewSubscriptionUsecase renewSubscriptionUsecase;

  Future<void> renewSubscription({required int programId}) async {
    renewSubscriptionLoader = true;
    emit(RenewSubscriptionLoadingState());

    try {
      String? imagePath;
      if (renewOrderImage != null) {
        final File file = renewOrderImage!;

        if (!await file.exists()) {
          throw Exception('Image file does not exist');
        }

        imagePath = file.path;
      }
      final renewData = RenewSubscriptionTojson(
        code: codeController.text,
        image: imagePath, // استخدم property جديد
        planId: [planDetailsEntity?.data?.id ?? -1],
        startDate: [DateTime.now().toString()],
        programId: [programId],
        studentNumber: [studentNumber],
      );
      final result = await renewSubscriptionUsecase.call(
        parameter: RenewSubscriptionDataParameters(
          data: renewData, // Pass the object as is
        ),
      );

      result.fold(
        (failure) {
          renewSubscriptionLoader = false;
          emit(RenewSubscriptionErrorState(
            errorMessage: failure.message,
          ));
        },
        (data) {
          renewSubscriptionLoader = false;
          renewSubscriptionEntity = data;
          emit(RenewSubscriptionSuccessState());
        },
      );
    } catch (e) {
      renewSubscriptionLoader = false;
      log("Error in createOrder: $e");
      emit(RenewSubscriptionErrorState(errorMessage: e.toString()));
    }
  }

  bool showPlanLoader = false;
  ShowPlanEntity? planDetailsEntity;
  ShowPlanUsecase showPlanUsecase;

  TextEditingController codeController = TextEditingController();

  Future<void> showPlan({
    required int planId,
  }) async {
    showPlanLoader = true;
    emit(ShowPlanLoadingState());

    final result = await showPlanUsecase.call(
      parameter: ShowPlanParameters(
        planId: planId,
      ),
    );

    result.fold(
      (failure) {
        showPlanLoader = false;
        emit(ShowPlanErrorState(
          errorMessage: failure.message,
        ));
      },
      (data) {
        showPlanLoader = false;
        planDetailsEntity = data;
        emit(ShowPlanSuccessState());
      },
    );
  }
}
