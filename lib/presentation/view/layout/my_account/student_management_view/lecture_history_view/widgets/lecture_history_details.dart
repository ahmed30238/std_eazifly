import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/lecture_history_view/widgets/lecture_report_modal_sheet.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class LectureHistoryDetails extends StatelessWidget {
  final String title;
  final String status;
  final String sessionDate;
  final String sessionTime;
  final String sessionDuration;
  final int index;

  const LectureHistoryDetails({
    super.key,
    required this.title,
    required this.status,
    required this.sessionDate,
    required this.sessionTime,
    required this.sessionDuration,
    required this.index,
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
              Expanded(
                child: Column(
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
                      title,
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 12,
                        color: MainColors.blackText,
                      ),
                    ),
                  ],
                ),
              ),
              // 50.pw,
              Expanded(
                child: Column(
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
                      text: status,
                    ),
                    // SessionStatusArea(
                    //   status: status,
                    // )
                  ],
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () => lectureReportModelSheet(context, index),
                child: SvgPicture.asset(
                  Assets.iconsHorizontalDots,
                ),
              ),
            ],
          ),
          const CustomHorizontalDivider(),
          ItemDetailsCard(
            values: [sessionDate, sessionTime, "$sessionDuration دقيقة"],
            titles: const [
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

// class SessionStatusArea extends StatelessWidget {
//   final String status;
//   const SessionStatusArea({super.key, required this.status});

//   @override
//   Widget build(BuildContext context) {
//     switch (status) {
//       case "pending":
//         return 
//       case "danger":
//         return TextedContainer(
//           height: 30.h,
//           radius: 32.r,
//           containerColor: MainColors.lightYellow,
//           textColor: MainColors.yellow,
//           width: 80.w,
//           text: label,
//         );

//       default:
//         return TextedContainer(text: "غير محدد");
//     }
//   }
// }
