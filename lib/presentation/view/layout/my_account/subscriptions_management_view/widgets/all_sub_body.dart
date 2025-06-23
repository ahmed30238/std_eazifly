// all_sub_body.dart - Updated to fetch all subscriptions
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/presentation/controller/my_account_controllers/subscriptionmanagement_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_account_controllers/subscriptionmanagement_state.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/widgets/all_body_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllSubBody extends StatelessWidget {
  const AllSubBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = SubscriptionmanagementCubit.get(context);

    return BlocBuilder<SubscriptionmanagementCubit,
        SubscriptionmanagementState>(
      builder: (context, state) {
        if (cubit.getProgramSubscriptionLoader ||
            cubit.getLibrarySubscriptionLoader) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // Combine both program and library subscriptions
        List<Widget> allSubscriptions = [];

        // Add program subscriptions
        if (cubit.getProgramSubscriptionEntity?.data?.isNotEmpty ?? false) {
          allSubscriptions.addAll(
            cubit.getProgramSubscriptionEntity!.data!.map(
              (subscription) => AllBodyListItemWidget(
                onTap: () {
                  Navigator.pushNamed(
                    arguments: {
                      "cubit": cubit,
                      "subscription": subscription,
                      "type": "program",
                    },
                    context,
                    RoutePaths.subscriptionPackageDetails,
                  );
                },
                courseTitle: subscription.program ?? "اشتراك البرنامج",
                inProgress: false,
                daysLeft: subscription.daysToExpire?.toString() ?? "0",
                expireDate: subscription.expireDate.toString(),
                noOfStudents: subscription.studentNumber?.toString() ?? "0",
                onRenewTap: () {
                  // Handle renew action
                },
                progressPercent: ((subscription.completedSessions ?? 0) +
                        (subscription.missedSessions ?? 0))
                    .toDouble(),
                subscriptionPrice: subscription.price?.toString() ?? "0",
              ),
            ),
          );
        }

        // Add library subscription (single subscription)
        if (cubit.getLibrarySubscriptionEntity?.data != null) {
          final librarySubscription = cubit.getLibrarySubscriptionEntity!.data!;
          // final daysLeft = calculateDaysLeft(
          //     librarySubscription.fromDate, librarySubscription.expireDate);
          // final isActive = daysLeft > 0;

          allSubscriptions.add(
            AllBodyListItemWidget(
              onTap: () {
                Navigator.pushNamed(
                  arguments: {
                    "cubit": cubit,
                    "subscription": librarySubscription,
                    "type": "library",
                  },
                  context,
                  RoutePaths.subscriptionPackageDetails,
                );
              },
              courseTitle: librarySubscription.plan?.title ?? "اشتراك المكتبة",
              inProgress: false,
              daysLeft: librarySubscription.expireDate.toString(),
              expireDate: librarySubscription.expireDate?.toString() ?? "",
              noOfStudents: "جميع الطلاب",
              onRenewTap: () {
                // Handle renew action
              },
              progressPercent: .45,
              subscriptionPrice:
                  librarySubscription.plan?.price?.toString() ?? "0",
            ),
          );
        }

        if (allSubscriptions.isEmpty) {
          return const Center(
            child: Text("لا توجد اشتراكات"),
          );
        }

        return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => allSubscriptions[index],
          separatorBuilder: (context, index) => 10.ph,
          itemCount: allSubscriptions.length,
        );
      },
    );
  }
}
