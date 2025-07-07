import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/lecture_history_view/widgets/lecture_report_modal_sheet.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class LectureHistoryDetails extends StatelessWidget {
  const LectureHistoryDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      constraints: BoxConstraints(
        minHeight: 149.h,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: 16.cr,
        color: MainColors.white,
      ),
      child: Column(
        children: [
          16.ph,
          Row(
            children: [
              Column(
                children: [
                  Text(
                    "إسم المحاضرة",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 11,
                      color: MainColors.grayTextColors,
                    ),
                  ),
                  8.ph,
                  Text(
                    "تعليم أصول الفقة",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.blackText,
                    ),
                  ),
                ],
              ),
              50.pw,
              Column(
                children: [
                  Text(
                    "حالة المحاضرة",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 11,
                      color: MainColors.grayTextColors,
                    ),
                  ),
                  4.ph,
                  TextedContainer(
                    height: 26.h,
                    radius: 32.r,
                    width: 60.w,
                    text: "قادمة",
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () => lectureReportModelSheet(context),
                child: SvgPicture.asset(
                  Assets.iconsHorizontalDots,
                ),
              ),
            ],
          ),
          const CustomHorizontalDivider(),
          const ItemDetailsCard(
            values: [
              "12/5",
              "12:30",
              "30  ق"
            ],
            titles: [
              "تاريخ المحاضرة",
              "وقت المحاضرة",
              "مدة المحاضرة",
            ],
          ),
        ],
      ),
    );
  }


}