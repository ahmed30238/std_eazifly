import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/component/custom_dialog.dart';
import 'package:eazifly_student/data/models/library/library_order_and_subscribe_tojson.dart';
import 'package:eazifly_student/domain/entities/get_library_plans_entity.dart';
import 'package:eazifly_student/domain/entities/get_payment_method_details_entities.dart';
import 'package:eazifly_student/domain/entities/get_plan_subscription_period_entity.dart';
import 'package:eazifly_student/domain/entities/library_order_and_subscription_entity.dart';
import 'package:eazifly_student/domain/use_cases/get_library_plans_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_payment_method_details_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_plan_subscription_period_usecase.dart';
import 'package:eazifly_student/domain/use_cases/library_order_and_subscription_usecase.dart';
import 'package:eazifly_student/presentation/controller/add_to_library_package_details_controller/addtolibrarypackagedetails_state.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart'
    hide TypeControllerIndexState
    hide InitTabBarControllerState;

class AddtolibrarypackagedetailsCubit
    extends Cubit<AddtolibrarypackagedetailsState> {
  AddtolibrarypackagedetailsCubit({
    required this.getPlanSubscriptionUsecase,
    required this.getLibraryPlansUsecase,
    required this.libraryOrderAndSubscriptionUsecase,
    required this.getPaymentMethodDetailsUsecase,
  }) : super(AddtolibrarypackagedetailsInitial());

  static AddtolibrarypackagedetailsCubit get(context) =>
      BlocProvider.of(context);

  TabController? controller;
  TickerProvider? _vsync;

  final List<String> subscriptionTypeTabs = [];

  void initTabBarControllers(TickerProvider vsync) {
    _vsync = vsync;
    emit(InitTabBarControllerState());
  }

  void _createTabController() {
    if (_vsync != null && subscriptionTypeTabs.isNotEmpty) {
      controller?.dispose(); // Dispose old controller if exists
      controller =
          TabController(length: subscriptionTypeTabs.length, vsync: _vsync!)
            ..addListener(() {
              if (controller!.indexIsChanging) {
                controller!.animateTo(
                  controller!.index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
                packageIndex = 0; // Reset package index on tab change

                // Get library plans for selected period
                final selectedPeriod =
                    getPlanSubscriptionPeriodEntity?.data?[controller!.index];
                int days = int.tryParse(selectedPeriod?.days ?? "0") ?? -1;
                if (selectedPeriod != null && days > 0) {
                  getLibraryPlans(
                    days: days,
                  );
                }

                emit(TypeControllerIndexState());
              }
            });
    }
  }

  int planId = -1;
  void fillPlanId(int value) {
    log("DEBUG: Before fillPlanId - planId was: $planId");
    log("DEBUG: Setting planId to: $value");
    planId = value;
    log("DEBUG: After fillPlanId - planId is now: $planId");
    emit(ChangePlanIdState());
  }

  int packageIndex = 0;
  changePackageIndex(int index) {
    log("DEBUG: Changing packageIndex from $packageIndex to $index");
    packageIndex = index;
    emit(ChangePackageIndexState());
  }

  //! ################### APIS #################
  bool getPlanSubscriptionLoader = false;
  GetPlanSubscriptionPeriodEntity? getPlanSubscriptionPeriodEntity;
  GetPlanSubscriptionPeriodUsecase getPlanSubscriptionUsecase;

  Future<void> getPlanSubsriptionPeriod() async {
    getPlanSubscriptionLoader = true;
    emit(GetPlanSubscriptionLoadingState());

    final result =
        await getPlanSubscriptionUsecase.call(parameter: NoParameter());

    result.fold(
      (failure) {
        getPlanSubscriptionLoader = false;
        log("ERROR: Getting plan subscription failed: ${failure.message}");
        emit(GetPlanSubscriptionErrorState(errorMessage: failure.message));
      },
      (success) {
        getPlanSubscriptionPeriodEntity = success;
        getPlanSubscriptionLoader = false;

        // Clear and populate tabs
        subscriptionTypeTabs.clear();
        final titles = success.data?.map((e) => e.title ?? "").toList() ?? [];
        subscriptionTypeTabs.addAll(titles);
        log("DEBUG: Subscription tabs: $subscriptionTypeTabs");

        // Create tab controller after getting data
        _createTabController();

        // Load plans for first tab (default)
        if (success.data?.isNotEmpty == true) {
          int days = int.tryParse(success.data?.first.days ?? "0") ?? -1;
          if (days > 0) {
            getLibraryPlans(days: days);
          } else {
            log("ERROR: Invalid days value: ${success.data?.first.days}");
          }
        }

        emit(GetPlanSubscriptionSuccessState());
      },
    );
  }

  bool getLibraryPlansLoader = false;
  GetLibraryPlansEntity? getLibraryPlansEntity;
  GetLibraryPlansUsecase getLibraryPlansUsecase;

  Future<void> getLibraryPlans({required int days}) async {
    if (days <= 0) {
      log("ERROR: Invalid days parameter: $days");
      emit(GetLibraryPlansErrorState(errorMessage: "Invalid days parameter"));
      return;
    }

    getLibraryPlansLoader = true;
    emit(GetLibraryPlansLoadingState());

    final result = await getLibraryPlansUsecase.call(
      parameter: GetLibraryPlansParameters(days: days),
    );

    result.fold(
      (failure) {
        getLibraryPlansLoader = false;
        log("ERROR: Getting library plans failed: ${failure.message}");
        emit(GetLibraryPlansErrorState(errorMessage: failure.message));
      },
      (success) {
        getLibraryPlansEntity = success;
        getLibraryPlansLoader = false;

        // Debug API response
        log("DEBUG: API Response - Number of plans: ${success.data?.length ?? 0}");
        if (success.data?.isNotEmpty == true) {
          for (int i = 0; i < success.data!.length; i++) {
            final plan = success.data![i];
            log("DEBUG: Plan $i - ID: ${plan.id}, Title: ${plan.title}, Price: ${plan.price}");
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

        emit(GetLibraryPlansSuccessState());
      },
    );
  }

  File? libraryOrderImage;
  Future<void> pickOrderImageFromGallery() async {
    final response = await pickImageFromGallery();
    if (response != null) {
      libraryOrderImage = File(response.path);
      log("DEBUG: Image selected: ${libraryOrderImage?.path}");
    }
    emit(PickImageFromGallerySuccessState());
  }

  LibraryOrderAndSubscriptionEntity? libraryOrderAndSubscriptionEntity;
  bool libraryOrderAndSubscriptionLoader = false;
  LibraryOrderAndSubscriptionUsecase libraryOrderAndSubscriptionUsecase;

  Future<void> libraryOrderAndSubscription({required BuildContext context}) async {
    libraryOrderAndSubscriptionLoader = true;

    log("DEBUG: Starting subscription with planId: $planId");
    emit(LibraryOrderAndSubscriptionLoadingState());

    String? imagePath;
    if (libraryOrderImage != null) {
      final File file = libraryOrderImage!;

      if (!await file.exists()) {
        throw Exception('Image file does not exist');
      }

      imagePath = file.path;
    }

    final result = await libraryOrderAndSubscriptionUsecase.call(
      parameter: LibraryOrderAndSubscriptionParameters(
        data: LibraryOrderAndSubscribeTojson(
          image: imagePath,
          libraryPlanId: planId.toString(),
        ),
      ),
    );

    result.fold(
      (failure) {
        libraryOrderAndSubscriptionLoader = false;
        log("ERROR: Library order subscription failed: ${failure.message}");
        emit(LibraryOrderAndSubscriptionErrorState(
            errorMessage: failure.message));
      },
      (success) {
        libraryOrderAndSubscriptionEntity = success;
        libraryOrderAndSubscriptionLoader = false;
        log("SUCCESS: Library order subscription completed");
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
        emit(LibraryOrderAndSubscriptionSuccessState());
      },
    );
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
        programId: 1,
      ),
    );

    result.fold(
      (failure) {
        getPaymentMethodDetailsLoader = false;
        log("ERROR: Getting payment method details failed: ${failure.message}");
        emit(GetProgramPaymentMethodDetailsErrorState(
            errorMessage: failure.message));
      },
      (success) {
        getPaymentMethodDetailsLoader = false;
        getPaymentMethodDetailsEntity = success;
        log("SUCCESS: Payment method details loaded");
        emit(GetProgramPaymentMethodDetailsSuccessState());
      },
    );
  }

  // Debug method to check current state
  void debugCurrentState() {
    log("=== DEBUG STATE ===");
    log("planId: $planId");
    log("packageIndex: $packageIndex");
    log("Number of plans: ${getLibraryPlansEntity?.data?.length ?? 0}");
    log("Selected plan ID: ${getLibraryPlansEntity?.data?[packageIndex].id}");
    log("=================");
  }

  @override
  Future<void> close() {
    controller?.dispose();
    libraryOrderImage = null; // Clear file reference
    return super.close();
  }
}
