// all_sub_body.dart - Updated to fetch all subscriptions
import 'package:eazifly_student/presentation/controller/my_account_controllers/subscriptionmanagement_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/widgets/all_body_list_item_widget.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class AllSubBody extends StatelessWidget {
  const AllSubBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = SubscriptionmanagementCubit.get(context);

    return BlocBuilder(
      bloc: cubit,
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
            List.generate(
              cubit.getProgramSubscriptionEntity!.data!.length,
              (index) {
                final subscription =
                    cubit.getProgramSubscriptionEntity!.data![index];
                return AllBodyListItemWidget(
                  onTap: () {
                    cubit.fillProgramStudentNumber(
                        int.tryParse(subscription.studentNumber ?? "-1") ?? -1);
                    cubit.fillProgramId(subscription.programId ?? -1);
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
                  currency: "ج.م",
                  courseTitle: subscription.program ?? "اشتراك البرنامج",
                  inProgress: false,
                  daysLeft: subscription.daysToExpire?.toString() ?? "0",
                  expireDate:
                      subscription.expireDate.toString().substring(0, 10),
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
                  progressPercent: ((subscription.completedSessions ?? 0) +
                          (subscription.missedSessions ?? 0))
                      .toDouble(),
                  subscriptionPrice: subscription.price?.toString() ?? "0",
                );
              },
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
                    "planId": 1,
                    "mainId": -1,
                  },
                  context,
                  RoutePaths.subscriptionPackageDetails,
                );
              },
              currency: "ج.م",
              courseTitle: librarySubscription.plan?.title ?? "اشتراك المكتبة",
              inProgress: false,
              daysLeft: librarySubscription.expireDate != null
                  ? librarySubscription.expireDate!
                      .difference(DateTime.now())
                      .inDays
                      .toString()
                  : "0",
              expireDate:
                  formatDate(librarySubscription.expireDate ?? DateTime.now())
                      .substring(0, 10),
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
