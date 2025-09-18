import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:eazifly_student/core/component/custom_dialog.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/check_copoun_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/create_order_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/filter_plan_tojson.dart';
import 'package:eazifly_student/domain/entities/check_copoun_entities.dart';
import 'package:eazifly_student/domain/entities/create_order_entities.dart';
import 'package:eazifly_student/domain/entities/filter_plan_entities.dart';
import 'package:eazifly_student/domain/entities/get_payment_method_details_entities.dart';
import 'package:eazifly_student/domain/entities/get_plan_with_details_entities.dart';
import 'package:eazifly_student/domain/entities/get_plans_entities.dart';
import 'package:eazifly_student/domain/use_cases/check_copoun_usecase.dart';
import 'package:eazifly_student/domain/use_cases/create_order_usecase.dart';
import 'package:eazifly_student/domain/use_cases/filter_plans_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_payment_method_details_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_plan_with_details_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_plans_usecase.dart';
import 'package:eazifly_student/presentation/controller/program_subscription_plan/programsubscriptionplan_state.dart';
import 'package:eazifly_student/presentation/view/layout/programs/program_subscription_plan_view/program_subscription_plan_view.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart'
    hide InitTabBarControllerState, TypeControllerIndexState;

import '../../../data/models/order_and_subscribe/get_plan_with_details_model.dart';

class ProgramSubscriptionPlanCubit extends SubscriptionPlanCubit {
  ProgramSubscriptionPlanCubit({
    required this.getPlansUsecase,
    required this.filterPlansUsecase,
    required this.createOrderUsecase,
    required this.checkCopounUsecase,
    required this.getPlansWithDetailsUsecase,
    // required this.getProgramPaymentMethodsUsecase,
    required this.getPaymentMethodDetailsUsecase,
    // required this.getPlanSubscriptionUsecase,
  }) : super(ProgramsubscriptionplanInitial());

  static ProgramSubscriptionPlanCubit get(context) => BlocProvider.of(context);
  @override
  final TextEditingController studentNumberController = TextEditingController();
  @override
  final TextEditingController couponController = TextEditingController();
  @override
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TabController? controller;

  TickerProvider? _vsync;

  // final List<String> subscriptionTypeTabs = [];

  // void initTabBarControllers(TickerProvider vsync) {
  //   controller = TabController(length: staticMadeTabs.keys.length, vsync: vsync)
  //     ..addListener(() {
  //       if (controller!.indexIsChanging) {
  //         controller!.animateTo(
  //           controller!.index,
  //           duration: const Duration(milliseconds: 300),
  //           curve: Curves.easeIn,
  //         );
  //         packageIndex = 0;
  //         final selectedPeriod = staticMadeTabs.keys
  //             .toList()[controller!.index];
  //         int days = int.tryParse(selectedPeriod) ?? -1;
  //         if (days > 0) {
  //           getPlansWithDetails(programId: programId, days: days);
  //         }
  //
  //         emit(TypeControllerIndexState());
  //       }
  //     });
  //   // emit(InitTabBarControllerState());
  // }

  @override
  final TextEditingController startDate = TextEditingController();

  DateTime? selectedStartDate;

  @override
  void updateStartDate(DateTime date) {
    selectedStartDate = date;
    startDate.text = "${date.year}-${date.month}-${date.day}";
    emit(UpdateStartDateState());
  }

  String getFormattedDateForAPI() {
    if (selectedStartDate == null) return "";
    return "${selectedStartDate!.year}-${selectedStartDate!.month.toString().padLeft(2, '0')}-${selectedStartDate!.day.toString().padLeft(2, '0')}";
  }

  Map<String, List<PlanDetailsModel>> staticMadeTabs = {};

  void fillStaticMadeTabs(List<PlanDetailsModel>? list) {
    log("Started");

    if (list == null || list.isEmpty) {
      log("List is null or empty");
      return;
    }

    staticMadeTabs.clear();

    for (var item in list) {
      final key = (item.subscripeDays ?? "").toString();

      if (staticMadeTabs.containsKey(key)) {
        staticMadeTabs[key]!.add(item);
      } else {
        staticMadeTabs[key] = [item];
      }
    }

    log("Map created with ${staticMadeTabs.length} entries");
    staticMadeTabs.forEach((key, value) {
      log("Key: $key, First Value: ${value.first.subscriptionPlan}");
    });
  }

  void initTabBarControllers(TickerProvider vsync) {
    _vsync = vsync;

    if (staticMadeTabs.isEmpty) {
      return;
    }

    _createTabController();
  }

  void _createTabController() {
    if (_vsync != null && staticMadeTabs.isNotEmpty) {
      controller = TabController(length: staticMadeTabs.length, vsync: _vsync!)
        ..addListener(() {
          if (controller!.indexIsChanging) {
            controller!.animateTo(
              controller!.index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
            packageIndex = 0;
            final selectedPeriod = staticMadeTabs.keys
                .toList()[controller!.index];
            int days = int.tryParse(selectedPeriod) ?? -1;

            if (days > 0) {
              fillViewList(days.toString());
            }

            emit(TypeControllerIndexState());
          }
        });

      // إرسال state للتحديث
      emit(InitTabBarControllerState());
    }
  }

  List<PlanDetailsModel> viewList = [];

  void fillViewList(String days) {
    viewList.clear();

    final items = staticMadeTabs[days]
        ?.where((element) => element.subscripeDays == int.tryParse(days))
        .toList();

    if (items != null) {
      viewList.addAll(items);
    }
    emit(FilledViewListState());
  }

  int packageIndex = 0;

  changePackageIndex(int index) {
    log("DEBUG: Changing packageIndex from $packageIndex to $index");
    packageIndex = index;
    emit(ChangePackageIndexState());
  }

  int planId = -1;

  void fillPlanId(int value) {
    log("DEBUG: Before fillPlanId - planId was: $planId");
    log("DEBUG: Setting planId to: $value");
    planId = value;
    log("DEBUG: After fillPlanId - planId is now: $planId");
    emit(ChangePlanIdState());
  }

  //! ################### APIS #################
  // bool getPlanSubscriptionLoader = false;
  // GetPlanSubscriptionPeriodEntity? getPlanSubscriptionPeriodEntity;
  // GetPlanSubscriptionPeriodUsecase getPlanSubscriptionUsecase;
  //
  // Future<void> getPlanSubscriptionPeriod() async {
  //   getPlanSubscriptionLoader = true;
  //   emit(GetPlanSubscriptionLoadingState());
  //
  //   final result = await getPlanSubscriptionUsecase.call(
  //     parameter: NoParameter(),
  //   );
  //
  //   result.fold(
  //     (failure) {
  //       getPlanSubscriptionLoader = false;
  //       log("ERROR: Getting plan subscription failed: ${failure.message}");
  //       emit(GetPlanSubscriptionErrorState(errorMessage: failure.message));
  //     },
  //     (success) {
  //       getPlanSubscriptionPeriodEntity = success;
  //       getPlanSubscriptionLoader = false;
  //
  //       subscriptionTypeTabs.clear();
  //       final titles = success.data?.map((e) => e.title ?? "").toList() ?? [];
  //       subscriptionTypeTabs.addAll(titles);
  //       log("DEBUG: Subscription tabs: $subscriptionTypeTabs");
  //       _createTabController();
  //       if (success.data?.isNotEmpty == true) {
  //         int days = int.tryParse(success.data?.first.days ?? "0") ?? -1;
  //         if (days > 0) {
  //           getplansWithDetails(days: days, programId: programId);
  //         } else {
  //           log("ERROR: Invalid days value: ${success.data?.first.days}");
  //         }
  //       }
  //
  //       emit(GetPlanSubscriptionSuccessState());
  //     },
  //   );
  // }

  @override
  int planSubscribeDaysIndex = 0;

  @override
  void changePlanIndex(int index) {
    planSubscribeDaysIndex = index;
    emit(ChangePlanIndexState());
  }

  @override
  int lessonDurationIndex = 0;

  @override
  void changeLessonDurationIndex(int index) {
    lessonDurationIndex = index;
    emit(ChangeLessonDurationIndexState());
  }

  int programId = -1;

  void fillProgramId(int value) {
    programId = value;
  }

  //! #################### API ####################
  @override
  bool getPlansLoader = false;
  @override
  GetPlansEntity? getPlansEntity;
  GetPlansUsecase getPlansUsecase;

  @override
  Future<void> getPlans({required int programId}) async {
    getPlansLoader = true;
    emit(GetPlansLoadingState());
    final result = await getPlansUsecase.call(
      parameter: GetPlansParameters(programId: programId),
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

  bool getPlansWithDetailsLoader = false;
  GetPlansWithDetailsEntity? getPlansWithDetailsEntity;
  GetPlanWithDetailsUsecase getPlansWithDetailsUsecase;

  Future<void> getPlansWithDetails({required int programId, int? days}) async {
    if (days != null && days <= 0) {
      log("ERROR: Invalid days parameter: $days");
      emit(
        GetPlansWithDetailsErrorState(errorMessage: "Invalid days parameter"),
      );
      return;
    }

    getPlansWithDetailsLoader = true;
    emit(GetPlansWithDetailsLoadingState());

    final result = await getPlansWithDetailsUsecase.call(
      parameter: GetPlansWithDetailsParameters(
        days: days,
        programId: programId,
      ),
    );

    result.fold(
      (failure) {
        getPlansWithDetailsLoader = false;
        log("ERROR: Getting library plans failed: ${failure.message}");
        emit(GetPlansWithDetailsErrorState(errorMessage: failure.message));
      },
      (success) {
        fillStaticMadeTabs(success.data);
        if (controller != null) {
          controller!.dispose();
        }
        // إعادة إنشاء TabController مع العدد الصحيح
        _createTabController();
        fillViewList(staticMadeTabs.keys.first);

        getPlansWithDetailsEntity = success;
        getPlansWithDetailsLoader = false;

        // Debug API response
        log(
          "DEBUG: API Response - Number of plans: ${success.data?.length ?? 0}",
        );
        if (success.data?.isNotEmpty == true) {
          for (int i = 0; i < success.data!.length; i++) {
            final plan = success.data![i];
            log(
              "DEBUG: Plan $i - ID: ${plan.id}, Title: ${plan.title}, Price: ${plan.price}",
            );
          }

          // Auto-select first plan if planId is still -1 and we have valid data
          if (planId == -1) {
            final firstPlan = success.data!.first;
            if (firstPlan.id != null && firstPlan.id! > 0) {
              log("DEBUG: Auto-selecting first plan with ID: ${firstPlan.id}");
              fillPlanId(firstPlan.id!);
            } else {
              log("WARNING: First plan has invalid ID: ${firstPlan.id}");
            }
          }
        } else {
          log("WARNING: No plans returned from API");
        }

        emit(GetPlansWithDetailsSuccessState());
      },
    );
  }

  FilterPlansEntity? filterPlansEntity;
  FilterPlansUsecase filterPlansUsecase;
  bool filterPlansLoader = false;

  @override
  Future<void> filterPlans({
    required int programId,
    required BuildContext context,
    required String numberOfSessionsPerWeek,
  }) async {
    filterPlansLoader = true;
    emit(FilterPlansLoadingState());
    var plan = getPlansEntity?.data;
    final result = await filterPlansUsecase.call(
      parameter: FilterPlansParameters(
        data: FilterPlansTojson(
          duration: plan?.duration?[lessonDurationIndex] ?? "",
          numberOfSessionPerWeek: numberOfSessionsPerWeek,
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
        emit(FilterPlansSuccessState());
      },
    );
  }

  CheckCopounEntity? checkCopounEntity;
  CheckCopounUsecase checkCopounUsecase;
  bool checkCopounLoader = false;

  @override
  Future<void> checkCopouns({required BuildContext context}) async {
    checkCopounLoader = true;
    emit(CheckCopounLoadingState());
    final result = await checkCopounUsecase.call(
      parameter: CheckCopounDataParameters(
        data: CheckCopounTojson(code: couponController.text),
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

  CreateOrderEntity? createOrderEntity;
  CreateOrderUsecase createOrderUsecase;
  bool createOrderLoader = false;
  List<File> images = [];

  Future<void> pickImages() async {
    final response = await pickMultiImageFromGallery();
    if (response != null) {
      images = List.from(response.map((e) => File(e.path)));
    }
    emit(GetGalleryImagesState());
  }

  Future<void> createOrder({
    required int programId,
    required BuildContext context,
  }) async {
    createOrderLoader = true;
    emit(CreateOrderLoadingState());

    try {
      String? imagePath;
      // إذا كان في صورة جديدة
      if (images.isNotEmpty) {
        final File file = images[0];

        if (!await file.exists()) {
          throw Exception('Profile image file does not exist');
        }

        imagePath = file.path;
      }
      log("image path is $imagePath");

      final result = await createOrderUsecase.call(
        parameter: CreateOrderParameters(
          data: CreateOrderTojson(
            code: couponController.text,
            image: imagePath!,
            startDate: [getFormattedDateForAPI()],
            planId: [filterPlansEntity?.data?.id ?? planId],
            programId: [programId],
            studentNumber: studentNumberController.text.isEmpty
                ? [studentCount]
                : [int.tryParse(studentNumberController.text) ?? 0],
          ),
        ),
      );

      result.fold(
        (l) {
          createOrderLoader = false;
          emit(CreateOrderErrorState(errorMessage: l.message));
        },
        (r) {
          createOrderLoader = false;
          createOrderEntity = r;
          emit(CreateOrderSuccessState());

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
      createOrderLoader = false;
      log("Error in createOrder: $e");
      emit(CreateOrderErrorState(errorMessage: e.toString()));
    }
  }

  bool getPaymentMethodDetailsLoader = false;
  GetPaymentMethodDetailsEntity? getPaymentMethodDetailsEntity;
  GetPaymentMethodDetailsUsecase getPaymentMethodDetailsUsecase;

  Future<void> getPaymentMethodDetails({required int methodId}) async {
    getPaymentMethodDetailsLoader = true;
    emit(GetProgramPaymentMethodDetailsLoadingState());
    final result = await getPaymentMethodDetailsUsecase.call(
      parameter: GetPaymentMethodDetailsParameters(
        methodId: methodId,
        programId: programId,
      ),
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

  int studentCount = 1;

  void incrementCount() {
    studentCount++;
    emit(IncrementStudentCountState());
  }

  void decrementCount() {
    if (studentCount > 1) {
      studentCount--;
    }
    emit(DecrementStudentCountState());
  }

  @override
  Future<void> close() {
    controller?.dispose();
    return super.close();
  }
}
