import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class StudentsChangeItem extends StatelessWidget {
  final MainAxisAlignment? alignment;
  final Color? containerColor;
  final double? height;
  final String studentName;
  final VoidCallback onNextTap;
  final VoidCallback onBackTap;

  const StudentsChangeItem({
    super.key,
    this.containerColor,
    this.alignment,
    this.height,
    required this.studentName,
    required this.onNextTap,
    required this.onBackTap,
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
          color: containerColor ?? MainColors.inputFill,
        ),
        child: Row(
          mainAxisAlignment: alignment ?? MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: onNextTap,
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
                    color: MainColors.onSurfaceSecondary,
                  ),
                ),
                Text(
                  studentName,
                  style: MainTextStyle.boldTextStyle(fontSize: 12),
                ),
              ],
            ),
            20.pw,
            InkWell(
              onTap: onBackTap,
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
