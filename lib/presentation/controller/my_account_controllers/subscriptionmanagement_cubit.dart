import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/domain/entities/subscription_management/get_library_subscription_entity.dart';
import 'package:eazifly_student/domain/entities/subscription_management/get_program_subscription_entity.dart';
import 'package:eazifly_student/domain/use_cases/get_library_subscription_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_program_subscriptions_usecase.dart';
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
  }

  int tapbarIndex = 0;

  void changeTapbarIndex(int index) {
    tapbarIndex = index;
    emit(ChangeTapBarIndexState());
  }

  //! ################# API ####################
  bool getProgramSubscriptionLoader = false;
  GetProgramSubscriptionEntity? getProgramSubscriptionEntity;
  GetProgramSubscriptionsUsecase getProgramSubscriptionUsecase;

  Future<void> getProgramSubscription({
    required int programId,
    required int userId,
  }) async {
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
}
