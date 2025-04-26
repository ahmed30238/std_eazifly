import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/controller/my_account_controllers/subscriptionmanagement_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_account_controllers/subscriptionmanagement_state.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscriptionManagmentView extends StatefulWidget {
  const SubscriptionManagmentView({super.key});

  @override
  State<SubscriptionManagmentView> createState() =>
      _SubscriptionManagmentViewState();
}

class _SubscriptionManagmentViewState extends State<SubscriptionManagmentView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    SubscriptionmanagementCubit.get(context).initTabBarController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    final cubit = SubscriptionmanagementCubit.get(context);
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: lang.subscriptionManagement,
        leadingText: lang.settings,
        isCenterTitle: true,
      ),
      body: ListView(
        children: [
          16.ph,
          BlocBuilder<SubscriptionmanagementCubit, SubscriptionmanagementState>(
            builder: (context, state) {
              return CustomFilledTabBar(
                  controller: cubit.controller,
                  onTap: (value) {
                    cubit.controller.animateTo(value);
                    cubit.changeTapbarIndex(value);
                  },
                  tabs: List.generate(
                    cubit.tabs.length,
                    (index) {
                      return Text(
                        cubit.tabs[index],
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 15,
                          color: cubit.controller.index == index
                              ? MainColors.white
                              : MainColors.blackText,
                        ),
                      );
                    },
                  ));
            },
          ),
          16.ph,
          BlocBuilder<SubscriptionmanagementCubit, SubscriptionmanagementState>(
            builder: (context, state) {
              return cubit.body[cubit.tapbarIndex];
            },
          ),
        ],
      ),
    );
  }
}
