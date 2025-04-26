import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class AllBodyListItemWidget extends StatelessWidget {
  final bool inProgress;

  const AllBodyListItemWidget({
    super.key,
    required this.courseTitle,
    required this.inProgress,
  });

  final String courseTitle;

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;

    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: 154.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: MainColors.veryLightGrayFormField,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Container(
            height: 36.h,
            width: double.infinity,
            color: MainColors.blueTextColor,
            child: Center(
              child: Text(
                courseTitle,
                style: MainTextStyle.boldTextStyle(
                  fontSize: 14,
                  color: MainColors.white,
                ),
              ),
            ),
          ),
          16.ph,
          Padding(
            padding: EdgeInsets.only(
              right: ApplanuageCubit.isArabic(context) ? 16.w : 8.w,
              left: ApplanuageCubit.isArabic(context) ? 8.w : 16.w,
            ),
            child: SizedBox(
              height: 46.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lang.studentNumberInCourse,
                        style: MainTextStyle.mediumTextStyle(
                            fontSize: 12, color: MainColors.grayTextColors),
                      ),
                      4.ph,
                      Text(
                        "4 طلاب",
                        style: MainTextStyle.boldTextStyle(
                            fontSize: 14, color: MainColors.blackText),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lang.coursePrice,
                        style: MainTextStyle.mediumTextStyle(
                            fontSize: 12, color: MainColors.grayTextColors),
                      ),
                      4.ph,
                      Text(
                        "1200 ج.م",
                        style: MainTextStyle.boldTextStyle(
                            fontSize: 14, color: MainColors.blackText),
                      ),
                    ],
                  ),
                  CustomElevatedButton(
                    textSize: 11,
                    width: 90.w,
                    height: 29.h,
                    radius: 8.r,
                    text: lang.renewNow,
                    onPressed: () {},
                    color: MainColors.blueTextColor,
                  )
                ],
              ),
            ),
          ),
          12.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "متبقي 12 يوم",
                  style: MainTextStyle.boldTextStyle(
                      fontSize: 10, color: MainColors.grayTextColors),
                ),
                Text(
                  "12-4-2025",
                  style: MainTextStyle.boldTextStyle(
                      fontSize: 10, color: MainColors.grayTextColors),
                ),
              ],
            ),
          ),
          8.ph,
          const CustomLinearPercentIndicator(
            percent: 0.45,
          ),
        ],
      ),
    );
  }
}
