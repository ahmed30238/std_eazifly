import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'subscriptiondetails_state.dart';

class SubscriptiondetailsCubit extends Cubit<SubscriptiondetailsState> {
  SubscriptiondetailsCubit() : super(SubscriptiondetailsInitial());
  static SubscriptiondetailsCubit get(BuildContext context) =>
      BlocProvider.of<SubscriptiondetailsCubit>(context);

  late TabController subscriptionTypeController;
  late TabController subscriptionDurationController;

  final List<String> subscriptionTypeTabs = [
    "فردي",
    'عائلي',
  ];
  final List<String> subscriptionDurationTabs = [
    "شهري",
    '6 اشهر',
    'سنوي',
  ];

  void initTabBarControllers(TickerProvider vsync) {
    subscriptionTypeController =
        TabController(length: subscriptionTypeTabs.length, vsync: vsync)
          ..addListener(
            () {
              if (subscriptionTypeController.indexIsChanging) {
                subscriptionTypeController.animateTo(
                  subscriptionTypeController.index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
                emit(TypeControllerIndexState());
              }
            },
          );
    subscriptionDurationController =
        TabController(length: subscriptionDurationTabs.length, vsync: vsync)
          ..addListener(
            () {
              if (subscriptionDurationController.indexIsChanging) {
                subscriptionDurationController.animateTo(
                  subscriptionDurationController.index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
                emit(DurationControllerIndexState());
              }
            },
          );
    emit(InitTabBarControllerState());
  }

  int noOfChildrenIndex = 0;
  changeNoOfChildrenIndex(int index) {
    noOfChildrenIndex = index;
    emit(ChangeNoOfChildrenIndexState());
  }

  int selectedPackageIndex = 1;
  changeselectedPackageIndex(int index) {
    selectedPackageIndex = index;
    emit(ChangeSelectedPackageIndexState());
  }
}
