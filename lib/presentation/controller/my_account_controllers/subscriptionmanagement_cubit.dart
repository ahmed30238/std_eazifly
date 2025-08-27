// Updated subscriptionmanagement_cubit.dart
import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/component/custom_dialog.dart';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/check_copoun_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/filter_plan_tojson.dart';
import 'package:eazifly_student/data/models/subscription_management/renew_subscription_tojson.dart';
import 'package:eazifly_student/domain/entities/check_copoun_entities.dart';
import 'package:eazifly_student/domain/entities/filter_plan_entities.dart';
import 'package:eazifly_student/domain/entities/get_payment_method_details_entities.dart';
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

  List<String> tabs(BuildContext context) {
    var lang = context.loc!;
    return [
      lang.all,
      lang.programs,
      lang.library,
    ];
  }

  // int programId = -1;
  // void initProgramId(int programId) {
  //   this.programId = programId;
  // }
  bool getPaymentMethodDetailsLoader = false;
  GetPaymentMethodDetailsEntity? getPaymentMethodDetailsEntity;
  GetPaymentMethodDetailsUsecase getPaymentMethodDetailsUsecase;

  Future<void> getPamyentMethodDetails({required int methodId}) async {
    getPaymentMethodDetailsLoader = true;
    emit(GetProgramPaymentMethodDetailsLoadingState());
    final result = await getPaymentMethodDetailsUsecase.call(
      parameter: GetPaymentMethodDetailsParameters(
          methodId: methodId, programId: programId),
    );
    result.fold(
      (l) {
        getPaymentMethodDetailsLoader = false;
        emit(GetProgramPaymentMethodDetailsErrorState(errorMessage: l.message));
      },
      (r) {
        getPaymentMethodDetailsLoader = false;
        getPaymentMethodDetailsEntity = r;
        emit(GetProgramPaymentMethodDetailsSuccessState());
      },
    );
  }

  int studentNumber = -1;

  void fillProgramStudentNumber(int studentNumber) {
    log("Started");
    this.studentNumber = studentNumber;
    log("filled student number: ${this.studentNumber}");
  }

  void initTabBarController(TickerProvider vsync,BuildContext context) {
    controller = TabController(length: tabs(context).length, vsync: vsync);
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

  // Future<void> getLibrarySubscription({
  //   required int userId,
  // }) async {
  //   getLibrarySubscriptionLoader = true;
  //   emit(GetLibrarySubscriptionLoadingState());

  //   final result =
  //       await getLibrarySubscriptionUsecase.call(parameter: NoParameter());

  //   result.fold(
  //     (failure) {
  //       getLibrarySubscriptionLoader = false;
  //       emit(GetLibrarySubscriptionErrorState(errorMessage: failure.message));
  //     },
  //     (data) {
  //       getLibrarySubscriptionLoader = false;
  //       getLibrarySubscriptionEntity = data;
  //       emit(GetLibrarySubscriptionSuccessState());
  //     },
  //   );
  // }

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
    if (planDetailsEntity?.data?.id == null ||
        planDetailsEntity!.data!.id! <= 0) {
      log("planDetailsEntity is null");
      emit(RenewSubscriptionErrorState(
          errorMessage: "خطأ: معرف الخطة غير صحيح"));
      return;
    }

    if (programId <= 0) {
      log("programId is invalid: $programId");

      emit(RenewSubscriptionErrorState(
          errorMessage: "خطأ: معرف البرنامج غير صحيح"));
      return;
    }

    if (studentNumber <= 0) {
      log("studentNumber is invalid: $studentNumber");

      emit(RenewSubscriptionErrorState(
          errorMessage: "خطأ: رقم الطالب غير صحيح"));
      return;
    }

    renewSubscriptionLoader = true;
    emit(RenewSubscriptionLoadingState());

    try {
      String? imagePath;
      if (renewOrderImage != null) {
        final File file = renewOrderImage!;
        if (!await file.exists()) {
          throw Exception('ملف الصورة غير موجود');
        }
        imagePath = file.path;
      }

      final renewData = RenewSubscriptionTojson(
        code: codeController.text,
        image: imagePath,
        planId: [planDetailsEntity!.data!.id!],
        // استخدام القيمة الصحيحة
        // startDate: [DateTime.now().toString()],
        programId: [programId],
        studentNumber: [studentNumber],
      );

      final result = await renewSubscriptionUsecase.call(
        parameter: RenewSubscriptionDataParameters(data: renewData),
      );

      result.fold(
        (failure) {
          renewSubscriptionLoader = false;
          emit(RenewSubscriptionErrorState(errorMessage: failure.message));
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

  Future<void> upgradeOrder({
    required int programId,
    required BuildContext context,
  }) async {
    if (planDetailsEntity?.data?.id == null ||
        planDetailsEntity!.data!.id! <= 0) {
      emit(UpgradeOrderErrorState(errorMessage: "خطأ: معرف الخطة غير صحيح"));
      return;
    }

    if (programId <= 0) {
      emit(UpgradeOrderErrorState(errorMessage: "خطأ: معرف البرنامج غير صحيح"));
      return;
    }

    final studentNum = int.tryParse(studentNumberController.text);
    if (studentNum == null || studentNum <= 0) {
      emit(UpgradeOrderErrorState(errorMessage: "خطأ: رقم الطالب غير صحيح"));
      return;
    }

    upgradeOrderLoader = true;
    emit(UpgradeOrderLoadingState());

    try {
      String? imagePath;
      if (upgradeOrderImage != null) {
        final File file = upgradeOrderImage!;
        if (!await file.exists()) {
          throw Exception('ملف الصورة غير موجود');
        }
        imagePath = file.path;
      }

      final result = await upgradeOrderUsecase.call(
        parameter: UpgradeOrderParameters(
          data: RenewSubscriptionTojson(
            code: codeController.text,
            image: imagePath,
            // startDate: [getFormattedDateForAPI()],
            planId: [planDetailsEntity!.data!.id!],
            programId: [programId],
            studentNumber: [studentNum],
          ),
        ),
      );

      result.fold(
        (failure) {
          upgradeOrderLoader = false;
          emit(UpgradeOrderErrorState(errorMessage: failure.message));
        },
        (data) {
          upgradeOrderLoader = false;
          upgradeOrderEntity = data;
          upgradeOrderImage = null; // Reset image after successful upgrade,
          emit(UpgradeOrderSuccessState());

          showAdaptiveDialog(
            context: context,
            builder: (context) => const CustomDialog(
              title: "جاري مراجعة طلب التحويل",
              subTitle: "سيتم ارسال اشعار التاكيد في اقرب وقت",
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
      log("Error in upgradeOrder: $e");
      emit(UpgradeOrderErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> getLibrarySubscription({required int userId}) async {
    if (userId <= 0) {
      emit(GetLibrarySubscriptionErrorState(
          errorMessage: "خطأ: معرف المستخدم غير صحيح"));
      return;
    }

    getLibrarySubscriptionLoader = true;
    emit(GetLibrarySubscriptionLoadingState());

    final result = await getLibrarySubscriptionUsecase.call(
      parameter: NoParameter(),
    );

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

// 4. تحسين loadAllSubscriptions
  void loadAllSubscriptions() {
    final userId = loginData?.id;
    if (userId == null || userId <= 0) {
      emit(GetLibrarySubscriptionErrorState(
          errorMessage: "خطأ: المستخدم غير مسجل الدخول"));
      return;
    }

    getProgramSubscription();
    getLibrarySubscription(userId: userId);
  }

// 5. تحسين changeTapbarIndex
  void changeTapbarIndex(int index) {
    tapbarIndex = index;

    switch (index) {
      case 0: // الكل
        loadAllSubscriptions();
        break;
      case 1: // البرامج
        getProgramSubscription();
        break;
      case 2: // الاشتراكات
        final userId = loginData?.id;
        if (userId == null || userId <= 0) {
          emit(GetLibrarySubscriptionErrorState(
              errorMessage: "خطأ: المستخدم غير مسجل الدخول"));
          return;
        }
        getLibrarySubscription(userId: userId);
        break;
    }

    emit(ChangeTapBarIndexState());
  }

  bool validateUserData() {
    if (loginData?.id == null || loginData!.id! <= 0) {
      log("خطأ: بيانات المستخدم غير صحيحة");
      return false;
    }
    return true;
  }

// 7. إضافة دالة للتحقق من صحة خطة الاشتراك
  bool validatePlanData() {
    if (planDetailsEntity?.data?.id == null ||
        planDetailsEntity!.data!.id! <= 0) {
      log("خطأ: بيانات الخطة غير صحيحة");
      return false;
    }
    return true;
  }

// 8. تحسين filterPlans للتأكد من وجود البيانات
  @override
  Future<void> filterPlans({
    required int programId,
    required BuildContext context,
    required String numberOfSessionsPerWeek,
  }) async {
    if (programId <= 0) {
      emit(FilterPlansErrorState(errorMessage: "خطأ: معرف البرنامج غير صحيح"));
      return;
    }

    if (getPlansEntity?.data == null) {
      emit(
          FilterPlansErrorState(errorMessage: "خطأ: لا توجد بيانات خطط متاحة"));
      return;
    }

    final plan = getPlansEntity!.data!;

    // التحقق من وجود البيانات المطلوبة
    if (plan.duration == null ||
        plan.duration!.isEmpty ||
        plan.numberOfSessionPerWeek == null ||
        plan.numberOfSessionPerWeek!.isEmpty ||
        plan.subscripeDays == null ||
        plan.subscripeDays!.isEmpty) {
      emit(FilterPlansErrorState(errorMessage: "خطأ: بيانات الخطة غير مكتملة"));
      return;
    }

    filterPlansLoader = true;
    emit(FilterPlansLoadingState());

    final result = await filterPlansUsecase.call(
      parameter: FilterPlansParameters(
        data: FilterPlansTojson(
          duration: plan.duration![lessonDurationIndex],
          numberOfSessionPerWeek: numberOfSessionsPerWeek,
          programId: programId.toString(),
          subscribeDays: plan.subscripeDays![planSubscribeDaysIndex],
        ),
      ),
    );

    result.fold(
      (failure) {
        filterPlansLoader = false;
        emit(FilterPlansErrorState(errorMessage: failure.message));
      },
      (data) {
        filterPlansLoader = false;
        filterPlansEntity = data;
        delightfulToast(message: data.message ?? "", context: context);
        emit(FilterPlansSuccessState());
      },
    );
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
    log("programid filled $programId");
  }

  DateTime? selectedStartDate;

  // String getFormattedDateForAPI() {
  //   if (selectedStartDate == null) return "";
  //   return "${selectedStartDate!.year}-${selectedStartDate!.month.toString().padLeft(2, '0')}-${selectedStartDate!.day.toString().padLeft(2, '0')}";
  // }

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

  // GetPaymentMethodDetailsUsecase getPaymentMethodDetailsUsecase;
  bool getPlanSubscriptionLoader = false; // لتحميل فترات الاشتراك
// bool getPlansLoader = false; // لتحميل الخطط
  bool getPlansWithDetailsLoader = false; // لتحميل الخطط مع التفاصيل
  bool filterPlansLoader = false; // لتحميل الخطط المفلترة
  bool checkCopounLoader = false; // لتحميل التحقق من الكوبون
  bool createOrderLoader = false; // لتحميل إنشاء الطلب
  // bool getPaymentMethodDetailsLoader = false; // لتحميل تفاصيل طريقة الدفع
  CheckCopounEntity? checkCopounEntity;
  FilterPlansEntity? filterPlansEntity;

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
