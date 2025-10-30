import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class AllBodyListItemWidget extends StatelessWidget {
  final bool inProgress;
  final String noOfStudents;
  final String subscriptionPrice;
  final VoidCallback onRenewTap;
  final String daysLeft;
  final String expireDate;
  final double progressPercent;
  final String currency;
  final VoidCallback onTap;

  const AllBodyListItemWidget({
    super.key,
    required this.courseTitle,
    required this.inProgress,
    required this.noOfStudents,
    required this.subscriptionPrice,
    required this.onRenewTap,
    required this.daysLeft,
    required this.expireDate,
    required this.progressPercent,
    required this.onTap,
    required this.currency,
  });

  final String courseTitle;

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        height: 154.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: MainColors.inputFill,
          borderRadius: 10.cr,
        ),
        child: Column(
          children: [
            Container(
              height: 36.h,
              width: double.infinity,
              color: MainColors.primary,
              child: Center(
                child: Text(
                  courseTitle,
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 14,
                    color: MainColors.background,
                  ),
                ),
              ),
            ),
            16.ph,
            Padding(
              padding: EdgeInsets.only(
                right: AppLanguageCubit.isArabic(context) ? 16.w : 8.w,
                left: AppLanguageCubit.isArabic(context) ? 8.w : 16.w,
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
                            fontSize: 12,
                            color: MainColors.onSurfaceSecondary,
                          ),
                        ),
                        4.ph,
                        Text(
                          "$noOfStudents ${lang.students}",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 14,
                            color: MainColors.onSecondary,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lang.coursePrice,
                          style: MainTextStyle.mediumTextStyle(
                            fontSize: 12,
                            color: MainColors.onSurfaceSecondary,
                          ),
                        ),
                        4.ph,
                        Text(
                          "$subscriptionPrice $currency",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 14,
                            color: MainColors.onSecondary,
                          ),
                        ),
                      ],
                    ),
                    CustomElevatedButton(
                      textSize: 11,
                      width: 90.w,
                      height: 29.h,
                      radius: 8.r,
                      text: lang.renewNow,
                      onPressed: onRenewTap,
                      color: MainColors.primary,
                    ),
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
                    "${lang.remain} $daysLeft ${lang.days}",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 10,
                      color: MainColors.onSurfaceSecondary,
                    ),
                  ),
                  Text(
                    expireDate,
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 10,
                      color: MainColors.onSurfaceSecondary,
                    ),
                  ),
                ],
              ),
            ),
            8.ph,
            CustomLinearPercentIndicator(percent: progressPercent),
          ],
        ),
      ),
    );
  }
}
