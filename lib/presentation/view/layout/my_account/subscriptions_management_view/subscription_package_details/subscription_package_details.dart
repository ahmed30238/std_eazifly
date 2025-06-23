import 'package:eazifly_student/presentation/controller/my_account_controllers/subscriptionmanagement_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/subscription_package_details/widgets/cancel_subscription_dialog.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/subscription_package_details/widgets/renew_subscription_button.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:flutter_html/flutter_html.dart';

class SubscriptiopnPackageDetails extends StatefulWidget {
  final int mainId;
  final int planId;
  const SubscriptiopnPackageDetails({
    super.key,
    required this.mainId,
    required this.planId,
  });

  @override
  State<SubscriptiopnPackageDetails> createState() =>
      _SubscriptiopnPackageDetailsState();
}

class _SubscriptiopnPackageDetailsState
    extends State<SubscriptiopnPackageDetails> {
  late SubscriptionmanagementCubit cubit;
  @override
  void initState() {
    cubit = context.read<SubscriptionmanagementCubit>();
    super.initState();
    cubit.showPlan(planId: widget.planId);
  }

  @override
  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<SubscriptionmanagementCubit>();
    var lang = context.loc!;
    final planData = cubit.planDetailsEntity?.data;

    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: lang.subscriptionManagement,
        leadingText: lang.settings,
        isCenterTitle: true,
      ),
      body: planData == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "تفاصيل الاشتراك",
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 12,
                          color: MainColors.checkBoxBorderGray,
                        ),
                      ),
                      8.ph,
                      ItemDetailsCard(
                        titles: subscriptionDetails,
                        values: [
                          planData.title ?? '-',
                          '${planData.price ?? '-'} ${planData.currency}',
                          planData.label ?? '-',
                        ],
                      ),
                      24.ph,
                      Text(
                        "مميزات الباقة",
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 12,
                          color: MainColors.checkBoxBorderGray,
                        ),
                      ),
                      8.ph,
                      Html(data: planData.description ?? ""),
                    ].itemPadding(leftPadding: 16.w, rightPadding: 16.w),
                  ),
                ),
                RenewSubscriptionButton(),
                24.ph,
                SizedBox(
                  height: 21.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          RoutePaths.programSubscriptionPlan,
                          arguments: {
                            "programId": 1,
                            "programTitle": planData.title ?? '',
                            "programDescription": planData.description ?? '',
                            "programImage": "",
                          },
                        ),
                        child: Text(
                          "تغير الباقة",
                          style: MainTextStyle.boldTextStyle(fontSize: 14),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showCancelSubscriptionDialog(
                            context,
                            cubit: cubit,
                            mainId: widget.mainId,
                          );
                        },
                        child: Text(
                          "إلغاء الإشتراك",
                          style: MainTextStyle.boldTextStyle(fontSize: 14),
                        ),
                      ),
                    ].itemPadding(rightPadding: 20.w, leftPadding: 20.w),
                  ),
                ),
                24.ph,
              ],
            ),
    );
  }
}

var subscriptionDetails = [
  "إسم الباقة",
  "سعر الباقة",
  "تاريخ الانتهاء",
];
