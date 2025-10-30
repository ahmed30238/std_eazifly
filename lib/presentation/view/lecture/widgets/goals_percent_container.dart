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
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            height: 82.h,
            decoration: BoxDecoration(color: MainColors.inputFill),
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
                      color: MainColors.onSurfaceSecondary,
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

          // temporarily
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              borderRadius: 8.cr,
              color: MainColors.onPrimary.withValues(alpha: .4),
            ),
            height: 82.h,
            width: double.infinity,
            child: Center(
              child: Text(
                "قريبا",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 20,
                  color: MainColors.background,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
