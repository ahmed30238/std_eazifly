import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class NextLectureItem extends StatelessWidget {
  final String title;
  final String sessionDuration;
  final String sessionTime;
  final VoidCallback onTap;
  final VoidCallback onRejoinTap;
  final bool isRejoin;
  final String sessionState;
  final bool oneItem;

  const NextLectureItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.sessionDuration,
    required this.sessionTime,
    required this.onRejoinTap,
    required this.isRejoin,
    required this.sessionState,
    required this.oneItem,
  });

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        height: 127.h,
        width: oneItem ? 315.w : 297.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: MainColors.inputFill,
          border: Border.all(
            color: MainColors.outline,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.ph,
            Text(
              title,
              style: MainTextStyle.boldTextStyle(
                fontSize: 14,
              ),
            ),
            10.ph,
            const CustomHorizontalDivider(),
            SessionDatesDetails(
              fixedSpace: 8.ph,
              firstTitle: "وقت المحاضرة",
              onRejoinTap: onRejoinTap,
              isBtn: isRejoin,
              firstSubTitle: sessionTime,
              secondTitle: lang.sessionDuration,
              secondSubTitle: sessionDuration,
              thirdSubTitle: sessionState,
              thirdTitle: sessionState == "started"
                  ? lang.sessionState
                  : "تاريخ المحاضرة",
            )
          ],
        ),
      ),
    );
  }
}
