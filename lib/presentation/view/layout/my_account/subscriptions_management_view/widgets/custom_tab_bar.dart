import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/controller/my_account_controllers/subscriptionmanagement_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionCustomTabBar extends StatelessWidget {
  const SubscriptionCustomTabBar({
    super.key,
    required this.cubit,
  });

  final SubscriptionmanagementCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          color: MainColors.lightblue,
          borderRadius: BorderRadius.circular(25.r)),
      height: 44.h,
      width: 343.w,
      child: TabBar(
          controller: cubit.controller,
          onTap: (value) {
            cubit.controller.animateTo(value);
            cubit.changeTapbarIndex(value);
          },
          dividerColor: Colors.transparent,
          unselectedLabelStyle: const TextStyle(color: Colors.black),
          labelColor: Colors.white,
          isScrollable: false,
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
          indicatorColor: Colors.red,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: const Color(0xff2563EB),
            borderRadius: BorderRadius.circular(25.r),
          ),
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
          )
          // [
          //   Text(
          //     "الاختبارات",
          //     style: MainTextStyle.boldTextStyle(
          //       fontSize: 15,
          //       color: cubit.controller.index == 0
          //           ? MainColors.white
          //           : MainColors.blackText,
          //     ),
          //   ),
          //   Text(
          //     "التسليمات",
          //     style: MainTextStyle.boldTextStyle(
          //       fontSize: 15,
          //       color: cubit.controller.index == 1
          //           ? MainColors.white
          //           : MainColors.blackText,
          //     ),
          //   ),
          // ],
          ),
    );
  }
}
