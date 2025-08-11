import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class SubscriptionPlanCardItem extends StatelessWidget {
  final String icons;
  final bool isSelected;
  final VoidCallback onTap;
  final String day;
  const SubscriptionPlanCardItem({
    super.key,
    required this.isSelected,
    required this.icons,
    required this.day,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? MainColors.surface : MainColors.background,
          borderRadius: BorderRadius.circular(12.r),
        ),
        height: 69.h,
        width: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icons,
              colorFilter: ColorFilter.mode(
                isSelected ? MainColors.primary : MainColors.onPrimary,
                BlendMode.srcIn,
              ),
            ),
            4.ph,
            Text(
              day,
              style: MainTextStyle.boldTextStyle(
                fontSize: 12,
                color: isSelected ? MainColors.primary : MainColors.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
