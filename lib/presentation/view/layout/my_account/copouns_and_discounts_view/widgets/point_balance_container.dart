import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/controller/copoun_history/copounhistory_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/copouns_and_discounts_view/widgets/points_balance_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PointsBalanceContainer extends StatelessWidget {
  final CopounHistoryCubit cubit;
  const PointsBalanceContainer({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 227.h,
      width: double.infinity,
      decoration: BoxDecoration(color: MainColors.inputFill),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            lang.pointsBalance,
            style: MainTextStyle.boldTextStyle(fontSize: 14),
          ),
          8.ph,
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              if (cubit.copounHistoryLoader) {
                return const Expanded(
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              var copounsHistory = cubit.copounHistoryEntity?.data;

              if (copounsHistory == null || copounsHistory.isEmpty) {
                return Expanded(
                  child: Center(
                    child: Text(
                      "لا يوجد سجلات متاحة",
                      style: MainTextStyle.boldTextStyle(fontSize: 14),
                    ),
                  ),
                );
              }

              return Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    var item = copounsHistory[index];
                    bool isIn = item.type == "in";
                    return PointsBalanceDetailsContainer(
                      date: item.createdAt.toString().substring(0, 10),
                      points: "+${item.bonus} نقطة",
                      pointsDetails: isIn ? "تسجيل حساب جديد" : "استبدال نقاط",
                      icon: isIn ? Assets.iconsPointsIn : Assets.iconsPointsOut,
                      pointsTextColor: isIn
                          ? MainColors.success
                          : MainColors.primary,
                    );
                  },
                  separatorBuilder: (context, index) => 12.ph,
                  itemCount: copounsHistory.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
