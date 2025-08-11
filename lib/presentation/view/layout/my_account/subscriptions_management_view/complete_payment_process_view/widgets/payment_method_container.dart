import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class PaymentMethodContainer extends StatelessWidget {
  final String? icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const PaymentMethodContainer({
    super.key,
    required this.icon,
    required this.onTap,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Widget? iconWidget;
    if (icon != null && icon!.isNotEmpty) {
      iconWidget = AvatarImage(
        height: 32.h,
        width: 32.w,
        imageUrl: icon,
      );
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        height: 119.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: 16.cr,
          border: Border.all(color: MainColors.surfaceVariant),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (iconWidget != null) iconWidget,
            if (iconWidget != null) 12.pw,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: MainTextStyle.boldTextStyle(fontSize: 15),
                  ),
                  4.ph,
                  Text(
                    description,
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.onSurfaceSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}