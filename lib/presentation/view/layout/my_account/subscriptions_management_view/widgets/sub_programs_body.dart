// sub_programs_body.dart
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/presentation/controller/my_account_controllers/subscriptionmanagement_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_account_controllers/subscriptionmanagement_state.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/widgets/all_body_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubProgramsBody extends StatelessWidget {
  const SubProgramsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = SubscriptionmanagementCubit.get(context);
    
    return BlocBuilder<SubscriptionmanagementCubit, SubscriptionmanagementState>(
      builder: (context, state) {
        if (cubit.getProgramSubscriptionLoader) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (cubit.getProgramSubscriptionEntity?.data?.isEmpty ?? true) {
          return const Center(
            child: Text("لا توجد اشتراكات برامج"),
          );
        }

        return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final subscription = cubit.getProgramSubscriptionEntity!.data![index];
            return AllBodyListItemWidget(
              onTap: () {
                Navigator.pushNamed(
                  arguments: {
                    "cubit": cubit,
                    "planId": subscription.plan?.id,
                    "subscription": subscription,
                  },
                  context,
                  RoutePaths.subscriptionPackageDetails,
                );
              },
              currency: "ج.م",
              courseTitle: subscription.program ?? "اشتراك البرنامج",
              inProgress:  false,
              daysLeft: subscription.daysToExpire?.toString() ?? "0",
              expireDate: subscription.expireDate.toString().substring(0,10),
              noOfStudents: subscription.studentNumber?.toString() ?? "0",
              onRenewTap: () {
                // Handle renew action
              },
              progressPercent: ((subscription.completedSessions ?? 0) + (subscription.missedSessions ?? 0)).toDouble(),
              subscriptionPrice: subscription.price?.toString() ?? "0",
            );
          },
          separatorBuilder: (context, index) => 10.ph,
          itemCount: cubit.getProgramSubscriptionEntity!.data!.length,
        );
      },
    );
  }
}