
import 'package:eazifly_student/presentation/view/layout/my_programs/widgets/session_dates_details.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class NextLectureItem extends StatelessWidget {
  const NextLectureItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 127.h,
      width: 297.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: MainColors.veryLightGrayFormField,
        border: Border.all(
          color: MainColors.grayBorderColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.ph,
          Text(
            "إسم المحاضرة",
            style: MainTextStyle.boldTextStyle(
              fontSize: 14,
            ),
          ),
          10.ph,
          const CustomHorizontalDivider(),
          SessionDatesDetails(
            fixedSpace: 8.ph,
            firstTitle: "وقت المحاضرة",
            firstSubTitle: "12:45 PM",
            secondTitle: lang.sessionDuration,
            secondSubTitle: "30 دقيقة",
            thirdSubTitle: "",
            thirdTitle: lang.sessionState,
          )
        ],
      ),
    );
  }
}