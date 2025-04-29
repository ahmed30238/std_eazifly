import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class StudentsChangeItem extends StatelessWidget {
  final MainAxisAlignment? alignment;
  final Color? containerColor;
  final double? height;

  const StudentsChangeItem({
    super.key,
    this.containerColor,
    this.alignment,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        width: double.infinity,
        height: height ?? 60.h,
        decoration: BoxDecoration(
          color: containerColor ?? MainColors.veryLightGrayFormField,
        ),
        child: Row(
          mainAxisAlignment: alignment ?? MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                Assets.iconsArrowRight,
              ),
            ),
            20.pw,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "اسم الطالب",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 11,
                    color: MainColors.grayTextColors,
                  ),
                ),
                Text(
                  "أحمد ياسر",
                  style: MainTextStyle.boldTextStyle(fontSize: 12),
                ),
              ],
            ),
            20.pw,
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                Assets.iconsArrowLeft,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
