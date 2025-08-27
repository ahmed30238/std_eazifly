import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/extensions/widgets_extensions.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/presentation/controller/my_account_controllers/subscriptionmanagement_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/widgets/all_body_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubProgramsBody extends StatelessWidget {
  const SubProgramsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = SubscriptionmanagementCubit.get(context);
    final lang = context.loc!;
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        if (cubit.getProgramSubscriptionLoader) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }

        if (cubit.getProgramSubscriptionEntity?.data?.isEmpty ?? true) {
          return Padding(
            padding: EdgeInsets.only(top: 300.h),
            child: Text(lang.noProgramSubscription).center(),
          );
        }

        return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final subscription =
                cubit.getProgramSubscriptionEntity!.data![index];

            var daysToExpire = subscription.expireDate
                    ?.difference(DateTime.now())
                    .inDays
                    .toString() ??
                "0";

            // الحصول على إجمالي أيام الباقة
            var totalDays =
                int.tryParse(subscription.plan?.subscripeDays ?? "0") ?? 0;
            var remainingDays = int.tryParse(daysToExpire) ?? 0;

            // حساب نسبة الأيام المستهلكة (للـ progress indicator)
            double progressPercent = 0.0;
            if (totalDays > 0) {
              var consumedDays = totalDays - remainingDays;
              progressPercent = (consumedDays / totalDays).clamp(0.0, 1.0);
            }
            return AllBodyListItemWidget(
              onTap: () {
                cubit.fillProgramStudentNumber(
                    int.tryParse(subscription.studentNumber ?? "-1") ?? -1);
                cubit.fillProgramId(subscription.programId ?? -1);
                Future.delayed(
                  const Duration(milliseconds: 100),
                  () {
                    Navigator.pushNamed(
                      context,
                      RoutePaths.subscriptionPackageDetails,
                      arguments: {
                        "cubit": cubit,
                        "planId": subscription.plan?.id,
                        "mainId": subscription.mainSubscriptionId,
                      },
                    );
                  },
                );
              },
              currency: subscription.plan?.currency ?? "ج.م",
              courseTitle: subscription.program ?? "اشتراك البرنامج",
              inProgress: true,
              daysLeft: remainingDays.toString(),
              expireDate: subscription.expireDate.toString().substring(0, 10),
              noOfStudents: subscription.studentNumber?.toString() ?? "0",
              onRenewTap: () {
                Navigator.pushNamed(
                  context,
                  RoutePaths.subscriptionPackageDetails,
                  arguments: {
                    "cubit": cubit,
                    "planId": subscription.plan?.id,
                    "mainId": subscription.mainSubscriptionId,
                  },
                );
              },
              // استخدام نسبة الأيام المستهلكة للـ progress indicator
              progressPercent: progressPercent,
              subscriptionPrice: subscription.plan?.price?.toString() ?? "0",
            );
          },
          separatorBuilder: (context, index) => 10.ph,
          itemCount: cubit.getProgramSubscriptionEntity!.data!.length,
        );
      },
    );
  }
}
