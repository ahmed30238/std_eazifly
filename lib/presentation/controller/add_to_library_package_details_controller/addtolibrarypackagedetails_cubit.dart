import 'dart:io';

import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/domain/entities/get_library_plans_entity.dart';
import 'package:eazifly_student/domain/entities/get_plan_subscription_period_entity.dart';
import 'package:eazifly_student/domain/use_cases/get_library_plans_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_plan_subscription_period_usecase.dart';
import 'package:eazifly_student/presentation/controller/add_to_library_package_details_controller/addtolibrarypackagedetails_state.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart'
    hide TypeControllerIndexState
    hide InitTabBarControllerState;

class AddtolibrarypackagedetailsCubit
    extends Cubit<AddtolibrarypackagedetailsState> {
  AddtolibrarypackagedetailsCubit({
    required this.getPlanSubscriptionUsecase,
    required this.getLibraryPlansUsecase,
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

                // Get library plans for selected period
                final selectedPeriod =
                    getPlanSubscriptionPeriodEntity?.data?[controller!.index];
                int days = int.tryParse(selectedPeriod?.days ?? "0") ?? -1;
                if (selectedPeriod != null) {
                  getLibraryPlans(
                    days: days,
                  );
                }

                emit(TypeControllerIndexState());
              }
            });
    }
  }

  int packageIndex = 0;
  changePackageIndex(int index) {
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
        emit(GetPlanSubscriptionErrorState(errorMessage: failure.message));
      },
      (success) {
        getPlanSubscriptionPeriodEntity = success;
        getPlanSubscriptionLoader = false;

        // Clear and populate tabs
        subscriptionTypeTabs.clear();
        final titles = success.data?.map((e) => e.title ?? "").toList() ?? [];
        subscriptionTypeTabs.addAll(titles);

        // Create tab controller after getting data
        _createTabController();

        // Load plans for first tab (default)
        if (success.data?.isNotEmpty == true) {
          int days = int.tryParse(success.data?.first.days ?? "0") ?? -1;
          getLibraryPlans(days: days);
          //
        }

        emit(GetPlanSubscriptionSuccessState());
      },
    );
  }

  bool getLibraryPlansLoader = false;
  GetLibraryPlansEntity? getLibraryPlansEntity;
  GetLibraryPlansUsecase getLibraryPlansUsecase;

  Future<void> getLibraryPlans({required int days}) async {
    getLibraryPlansLoader = true;
    emit(GetLibraryPlansLoadingState());

    final result = await getLibraryPlansUsecase.call(
      parameter: GetLibraryPlansParameters(days: days),
    );

    result.fold(
      (failure) {
        getLibraryPlansLoader = false;
        emit(GetLibraryPlansErrorState(errorMessage: failure.message));
      },
      (success) {
        getLibraryPlansEntity = success;
        getLibraryPlansLoader = false;
        emit(GetLibraryPlansSuccessState());
      },
    );
  }

  File? favListImage;
  Future<void> pickFavImageImageFroGallery() async {
    final response = await pickImageFromGallery();
    if (response != null) {
      favListImage = File(response.path);
    }
    emit(PickImageFromGallerySuccessState());
  }

  Future<void> libraryOrderAndSubscription() async {
    emit(LibraryOrderAndSubscriptionLoadingState());
    String? imagePath;
    if (favListImage != null) {
      final File file = favListImage!;

      if (!await file.exists()) {
        throw Exception('Fav image file does not exist');
      }

      imagePath = file.path;
    }
    
  }

  @override
  Future<void> close() {
    controller?.dispose();
    return super.close();
  }
}
