import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'edit_session_date_area.dart';

class ScheduleItem extends StatelessWidget {
  final String day;
  final String date;
  final String from;
  final String to;
  final int sessionId;
  final String state;
  final String statusLabel;
  final int index;
  final BuildContext mainContext;

  const ScheduleItem({
    super.key,
    required this.date,
    required this.day,
    required this.from,
    required this.to,
    required this.sessionId,
    required this.state,
    required this.statusLabel,
    required this.index,
    required this.mainContext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      height: 74.h,
      width: double.infinity,
      decoration: BoxDecoration(color: MainColors.inputFill),
      child: SizedBox(
        height: 74.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    "تاريخ المحاضرة",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 11,
                      color: MainColors.onSurfaceSecondary,
                    ),
                  ),
                  8.ph,
                  Text(
                    "$day  $date",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    "وقت المحاضرة",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 11,
                      color: MainColors.onSurfaceSecondary,
                    ),
                  ),
                  8.ph,
                  Expanded(
                    child: Text(
                      "$from الي $to ",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 12,
                        color: MainColors.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            27.pw,
            state != "pending"
                ? Text(
                    statusLabel,
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.error,
                    ),
                  )
                : EditSessionDateArea(
                    sessionId: sessionId,
                    index: index,
                    mainContext: mainContext,
                  ),
          ],
        ),
      ),
    );
  }
}
