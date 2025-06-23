// subscriptions_body.dart
import 'package:eazifly_student/presentation/controller/my_account_controllers/subscriptionmanagement_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_account_controllers/subscriptionmanagement_state.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/widgets/all_body_list_item_widget.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class SubscriptionsBody extends StatelessWidget {
  const SubscriptionsBody({super.key});

  // Calculate days left from dates
  int calculateDaysLeft(String? fromDate, String? expireDate) {
    if (fromDate == null || expireDate == null) return 0;

    try {
      final now = DateTime.now();
      final expire = DateTime.parse(expireDate);
      final difference = expire.difference(now).inDays;
      return difference > 0 ? difference : 0;
    } catch (e) {
      return 0;
    }
  }

  // Calculate progress percentage based on subscription period
  double calculateProgress(String? fromDate, String? expireDate) {
    if (fromDate == null || expireDate == null) return 0.0;

    try {
      final now = DateTime.now();
      final start = DateTime.parse(fromDate);
      final expire = DateTime.parse(expireDate);

      final totalDays = expire.difference(start).inDays;
      final passedDays = now.difference(start).inDays;

      if (totalDays <= 0) return 1.0;
      final progress = passedDays / totalDays;
      return progress.clamp(0.0, 1.0);
    } catch (e) {
      return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = SubscriptionmanagementCubit.get(context);

    return BlocBuilder<SubscriptionmanagementCubit,
        SubscriptionmanagementState>(
      builder: (context, state) {
        if (cubit.getLibrarySubscriptionLoader) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (cubit.getLibrarySubscriptionEntity?.data == null) {
          return const Center(
            child: Text("لا توجد اشتراكات مكتبة"),
          );
        }

        final subscription = cubit.getLibrarySubscriptionEntity!.data!;
        final daysLeft = calculateDaysLeft(subscription.fromDate.toString(),
            subscription.expireDate.toString());
        final isActive = daysLeft > 0;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: AllBodyListItemWidget(
            onTap: () {
              Navigator.pushNamed(
                arguments: {
                  "cubit": cubit,
                  "subscription": subscription,
                  "planId": subscription.plan?.id,
                  "type": "library",
                },
                context,
                RoutePaths.subscriptionPackageDetails,
              );
            },
            currency: "usd",
            courseTitle: subscription.plan?.title ?? "اشتراك المكتبة",
            inProgress: isActive,
            daysLeft: daysLeft.toString(),
            expireDate: formatDate(subscription.expireDate ?? DateTime.now())
                .substring(0, 10),
            noOfStudents: "كل",
            onRenewTap: () {
              // Handle renew action
            },
            progressPercent: calculateProgress(subscription.fromDate.toString(),
                subscription.expireDate.toString()),
            subscriptionPrice: subscription.plan?.price?.toString() ?? "0",
          ),
        );
      },
    );
  }
}
