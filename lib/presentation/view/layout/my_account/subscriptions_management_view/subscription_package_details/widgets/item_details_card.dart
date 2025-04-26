import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/subscription_package_details/subscription_package_details.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ItemDetailsCard extends StatelessWidget {
  const ItemDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: MainColors.black,
      height: 72.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          3,
          (index) => Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  subscriptionDetails[index],
                  style: MainTextStyle.mediumTextStyle(
                    fontSize: 12,
                    color: MainColors.grayTextColors,
                  ),
                ),
                8.ph,
                Text(
                  "الباقة الإفتراضية",
                  style: MainTextStyle.mediumTextStyle(
                    fontSize: 14,
                    color: MainColors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ).center(),
    );
  }
}