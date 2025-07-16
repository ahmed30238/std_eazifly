import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class GoalsPercentContainer extends StatelessWidget {
  final String percent;
  final VoidCallback onTap;
  const GoalsPercentContainer({
    super.key,
    required this.percent,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        height: 82.h,
        decoration: BoxDecoration(
          color: MainColors.veryLightGrayFormField,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            12.ph,
            SizedBox(
              height: 20.h,
              child: Text(
                "أهداف البرنامج",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 12,
                  color: MainColors.grayTextColors,
                ),
              ),
            ),
            8.ph,
            SizedBox(
              height: 20.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "نسبة الإنجاز",
                    style: MainTextStyle.boldTextStyle(fontSize: 11),
                  ),
                  Text(
                    "$percent %",
                    style: MainTextStyle.boldTextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            4.ph,
            CustomLinearPercentIndicator(
              percent: (double.tryParse(percent) ?? 0.0) / 100,
              width: 310.w,
            ),
            4.ph,
          ],
        ),
      ),
    );
  }
}