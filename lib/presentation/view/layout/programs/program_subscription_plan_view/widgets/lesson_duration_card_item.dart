import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class LessonDurationCardItem extends StatelessWidget {
  final String icons;
  final bool isSelected;
  final VoidCallback onTap;
  final String duration;
  const LessonDurationCardItem({
    super.key,
    required this.isSelected,
    required this.icons,
    required this.onTap,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? MainColors.lightblue : MainColors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        height: 69.h,
        width: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$duration",
              style: MainTextStyle.boldTextStyle(
                fontSize: 12,
                color: isSelected ? MainColors.blueTextColor : MainColors.black,
              ),
            ),
            4.ph,
            Text(
              "دقيقة",
              style: MainTextStyle.boldTextStyle(
                fontSize: 12,
                color: isSelected ? MainColors.blueTextColor : MainColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}