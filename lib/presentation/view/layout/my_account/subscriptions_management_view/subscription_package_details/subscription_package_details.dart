import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/subscription_package_details/widgets/item_details_card.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/subscription_package_details/widgets/package_feature_list.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/subscription_package_details/widgets/renew_subscription_button.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class SubscriptiopnPackageDetails extends StatelessWidget {
  const SubscriptiopnPackageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: lang.subscriptionManagement,
        leadingText: lang.settings,
        isCenterTitle: true,
      ),
      body: Column(
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
                const ItemDetailsCard(),
                24.ph,
                Text(
                  "مميزات الباقة",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 12,
                    color: MainColors.checkBoxBorderGray,
                  ),
                ),
                8.ph,
                const PackageFeatureList(),
              ].itemPadding(leftPadding: 16.w, rightPadding: 16.w),
            ),
          ),
          const RenewSubscriptionButton(),
          24.ph,
          SizedBox(
            height: 21.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "تغير الباقة",
                  style: MainTextStyle.boldTextStyle(fontSize: 14),
                ),
                Text(
                  "إلغاء الإشتراك",
                  style: MainTextStyle.boldTextStyle(fontSize: 14),
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
