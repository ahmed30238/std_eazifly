// Updated subscriptionmanagement_cubit.dart
import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/component/custom_dialog.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/check_copoun_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/create_order_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/filter_plan_tojson.dart';
import 'package:eazifly_student/data/models/subscription_management/renew_subscription_tojson.dart';
import 'package:eazifly_student/domain/entities/check_copoun_entities.dart';
import 'package:eazifly_student/domain/entities/filter_plan_entities.dart';
import 'package:eazifly_student/domain/entities/get_plans_entities.dart';
import 'package:eazifly_student/domain/entities/subscription_management/cancel_subscription_entity.dart';
import 'package:eazifly_student/domain/entities/subscription_management/get_library_subscription_entity.dart';
import 'package:eazifly_student/domain/entities/subscription_management/get_program_subscription_entity.dart';
import 'package:eazifly_student/domain/entities/subscription_management/renew_subscription_entity.dart';
import 'package:eazifly_student/domain/entities/subscription_management/show_plan_entity.dart';
import 'package:eazifly_student/domain/entities/subscription_management/upgrade_order_entity.dart';
import 'package:eazifly_student/domain/use_cases/cancel_subscription_usecase.dart';
import 'package:eazifly_student/domain/use_cases/check_copoun_usecase.dart';
import 'package:eazifly_student/domain/use_cases/create_order_usecase.dart';
import 'package:eazifly_student/domain/use_cases/filter_plans_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_library_subscription_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_payment_method_details_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_plan_subscription_period_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_plan_with_details_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_plans_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_program_subscriptions_usecase.dart';
import 'package:eazifly_student/domain/use_cases/renew_subscription_usecase.dart';
import 'package:eazifly_student/domain/use_cases/show_plan_usecase.dart';
import 'package:eazifly_student/domain/use_cases/upgrade_order_usecase.dart';
import 'package:eazifly_student/presentation/controller/my_account_controllers/subscriptionmanagement_state.dart';
import 'package:eazifly_student/presentation/view/layout/home_page/home_page.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/widgets/all_sub_body.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/widgets/sub_programs_body.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/widgets/subscriptions_body.dart';
import 'package:eazifly_student/presentation/view/layout/programs/program_subscription_plan_view/program_subscription_plan_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscriptionmanagementCubit extends SubscriptionPlanCubit {
  SubscriptionmanagementCubit({
    required this.getProgramSubscriptionUsecase,
    required this.getLibrarySubscriptionUsecase,
    required this.cancelSubscriptionUsecase,
    required this.renewSubscriptionUsecase,
    required this.showPlanUsecase,
    required this.upgradeOrderUsecase,
    required this.getPlanSubscriptionUsecase,
    required this.getPlansUsecase,
    required this.getPlansWithDetailsUsecase,
    required this.filterPlansUsecase,
    required this.checkCopounUsecase,
    required this.createOrderUsecase,
    required this.getPaymentMethodDetailsUsecase,
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
    'المكتبة',
  ];
  // int programId = -1;
  // void initProgramId(int programId) {
  //   this.programId = programId;
  // }

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
        getLibrarySubscription(
            userId: loginData?.id ?? 0); // Replace with actual user ID
        break;
    }

    emit(ChangeTapBarIndexState());
  }

  void loadAllSubscriptions() {
    getProgramSubscription(); // Replace with actual IDs
    getLibrarySubscription(
        userId: loginData?.id ?? 0); // Replace with actual user ID
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
          throw Exception('Fav image file does not exist');
        }

        imagePath = file.path;
      }
      final renewData = RenewSubscriptionTojson(
        code: codeController.text,
        image: imagePath,
        planId: [planDetailsEntity?.data?.id ?? -1],
        startDate: [DateTime.now().toString()],
        programId: [programId],
        studentNumber: [studentNumber],
      );
      final result = await renewSubscriptionUsecase.call(
        parameter: RenewSubscriptionDataParameters(data: renewData),
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
      log("Error in renew subscription: $e");
      emit(RenewSubscriptionErrorState(errorMessage: e.toString()));
    }
  }

  UpgradeOrderEntity? upgradeOrderEntity;
  UpgradeOrderUsecase upgradeOrderUsecase;
  bool upgradeOrderLoader = false;
  @override
  final TextEditingController studentNumberController = TextEditingController();
  File? upgradeOrderImage;
  Future<void> pickupgradeOrderImageFroGallery() async {
    final response = await pickImageFromGallery();
    if (response != null) {
      upgradeOrderImage = File(response.path);
    }
    emit(PickImageFromGallerySuccessState());
  }

  Future<void> upgradeOrder({ //! تجديد الاشتراك
    required int programId,
    required BuildContext context,
  }) async {
    upgradeOrderLoader = true;
    emit(UpgradeOrderLoadingState());

    try {
      String? imagePath;

      if (upgradeOrderImage != null) {
        final File file = upgradeOrderImage!;

        if (!await file.exists()) {
          throw Exception('Profile image file does not exist');
        }

        imagePath = file.path;
      }

      final result = await upgradeOrderUsecase.call(
        parameter: UpgradeOrderParameters(
          data: CreateOrderTojson(
            code: codeController.text,
            image: imagePath, // استخدم property جديد
            startDate: [getFormattedDateForAPI()],
            planId: [planDetailsEntity?.data?.id ?? -1],
            programId: [programId],
            studentNumber: [int.tryParse(studentNumberController.text) ?? 0],
          ),
        ),
      );

      result.fold(
        (l) {
          upgradeOrderLoader = false;
          emit(UpgradeOrderErrorState(errorMessage: l.message));
        },
        (r) {
          upgradeOrderLoader = false;
          upgradeOrderEntity = r;
          emit(UpgradeOrderSuccessState());

          showAdaptiveDialog(
            context: context,
            builder: (context) => const CustomDialog(
              title: "جاري مراجعة طلب التحويل",
              subTitle: "سيتم ارسال اشعار التاكيد في اقرب وقت ",
              loader: true,
            ),
          );
          Timer(
            const Duration(seconds: 2),
            () => Navigator.pushReplacementNamed(
              context,
              RoutePaths.programsUnderReviewView,
            ),
          );
        },
      );
    } catch (e) {
      upgradeOrderLoader = false;
      log("Error in createOrder: $e");
      emit(UpgradeOrderErrorState(errorMessage: e.toString()));
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

  @override
  final TextEditingController copounController = TextEditingController();

  @override
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  final TextEditingController startDate = TextEditingController();

// Properties
  @override
  int planSubscribeDaysIndex = 0;

  @override
  int lessonDurationIndex = 0;

  @override
  bool getPlansLoader = false;

  @override
  GetPlansEntity? getPlansEntity;

// Methods
  @override
  void changePlanIndex(int index) {
    planSubscribeDaysIndex = index;
    emit(ChangePlanIndexState());
  }

  @override
  void changelessonDurationIndex(int index) {
    lessonDurationIndex = index;
    emit(ChangeLessonDurationIndexState());
  }

  int programId = -1;
  void fillProgramId(int value) {
    programId = value;
  }

  DateTime? selectedStartDate;

  String getFormattedDateForAPI() {
    if (selectedStartDate == null) return "";
    return "${selectedStartDate!.year}-${selectedStartDate!.month.toString().padLeft(2, '0')}-${selectedStartDate!.day.toString().padLeft(2, '0')}";
  }

  @override
  void updateStartDate(DateTime date) {
    selectedStartDate = date;
    startDate.text = "${date.year}-${date.month}-${date.day}";
    emit(UpdateStartDateState());
  }

  @override
  Future<void> getPlans({required int programId}) async {
    getPlansLoader = true;
    emit(GetPlansLoadingState());
    final result = await getPlansUsecase.call(
      parameter: GetPlansParameters(
        programId: programId,
      ),
    );
    result.fold(
      (l) {
        getPlansLoader = false;
        emit(GetPlansErrorState(errorMessage: l.message));
      },
      (r) {
        getPlansEntity = r;
        getPlansLoader = false;
        fillProgramId(programId);
        emit(GetPlansSuccessState());
      },
    );
  }

  GetPlanSubscriptionPeriodUsecase getPlanSubscriptionUsecase;

  GetPlansUsecase getPlansUsecase;

  GetPlanWithDetailsUsecase getPlansWithDetailsUsecase;

  FilterPlansUsecase filterPlansUsecase;

  CheckCopounUsecase checkCopounUsecase;

  CreateOrderUsecase createOrderUsecase;

  GetPaymentMethodDetailsUsecase getPaymentMethodDetailsUsecase;
  bool getPlanSubscriptionLoader = false; // لتحميل فترات الاشتراك
// bool getPlansLoader = false; // لتحميل الخطط
  bool getPlansWithDetailsLoader = false; // لتحميل الخطط مع التفاصيل
  bool filterPlansLoader = false; // لتحميل الخطط المفلترة
  bool checkCopounLoader = false; // لتحميل التحقق من الكوبون
  bool createOrderLoader = false; // لتحميل إنشاء الطلب
  bool getPaymentMethodDetailsLoader = false; // لتحميل تفاصيل طريقة الدفع
  CheckCopounEntity? checkCopounEntity;
  FilterPlansEntity? filterPlansEntity;

  @override
  Future<void> filterPlans(
      {required int programId, required BuildContext context}) async {
    filterPlansLoader = true;
    emit(FilterPlansLoadingState());
    var plan = getPlansEntity?.data;
    log("dur ${plan?.duration?[lessonDurationIndex]}");
    log("sess ${plan?.numberOfSessionPerWeek?.first}");
    log("sub days ${plan?.subscripeDays?[planSubscribeDaysIndex]}");
    final result = await filterPlansUsecase.call(
      parameter: FilterPlansParameters(
        data: FilterPlansTojson(
          duration: plan?.duration?[lessonDurationIndex] ?? "",
          numberOfSessionPerWeek: plan?.numberOfSessionPerWeek?.first ?? "",
          programId: programId.toString(),
          subscribeDays: plan?.subscripeDays?[planSubscribeDaysIndex] ?? "",
        ),
      ),
    );
    result.fold(
      (l) {
        filterPlansLoader = false;
        emit(FilterPlansErrorState(errorMessage: l.message));
      },
      (r) {
        filterPlansLoader = false;
        filterPlansEntity = r;
        delightfulToast(message: r.message ?? "", context: context);
        emit(FilterPlansSuccessState());
      },
    );
  }

  @override
  Future<void> checkCopouns({required BuildContext context}) async {
    checkCopounLoader = true;
    emit(CheckCopounLoadingState());
    final result = await checkCopounUsecase.call(
      parameter: CheckCopounDataParameters(
        data: CheckCopounTojson(
          code: copounController.text,
        ),
      ),
    );
    result.fold(
      (l) {
        checkCopounLoader = false;
        delightfulToast(message: l.message, context: context);
        emit(CheckCopounErrorState(errorMessage: l.message));
      },
      (r) {
        checkCopounLoader = false;
        checkCopounEntity = r;
        delightfulToast(message: r.message ?? "", context: context);
        emit(CheckCopounSuccessState());
      },
    );
  }
}
