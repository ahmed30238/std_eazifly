import 'package:eazifly_student/presentation/controller/my_account_controllers/subscriptionmanagement_state.dart';
import 'package:eazifly_student/presentation/view/my_account/subscriptions_management_view/widgets/all_sub_body.dart';
import 'package:eazifly_student/presentation/view/my_account/subscriptions_management_view/widgets/sub_programs_body.dart';
import 'package:eazifly_student/presentation/view/my_account/subscriptions_management_view/widgets/subscriptions_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscriptionmanagementCubit extends Cubit<SubscriptionmanagementState> {
  SubscriptionmanagementCubit() : super(SubscriptionmanagementInitial());

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
}
