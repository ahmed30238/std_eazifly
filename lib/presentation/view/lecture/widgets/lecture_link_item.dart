import 'package:eazifly_student/presentation/view/lecture/widgets/lecture_stats_row.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class LectureLink extends StatelessWidget {
  final MainAxisAlignment? linkAlignment;
  final double? width;
  final String host;
  final LectureStatesEnum? state;
  final VoidCallback onLinkTap;
  final int programId;
  const LectureLink({
    super.key,
    this.width,
    required this.host,
    this.linkAlignment,
    this.state = LectureStatesEnum.pending,
    required this.onLinkTap, required this.programId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      width: width ?? 127.w,
      height: 80.h,
      decoration: BoxDecoration(
          color: MainColors.inputFill,
          borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          12.ph,
          Text(
            "الرابط",
            style: MainTextStyle.boldTextStyle(
              fontSize: 12,
              color: MainColors.onSurfaceSecondary,
            ),
          ),
          8.ph,
          4.pw,
          Row(
            children: [
              InkWell(
                onTap: onLinkTap,
                child: Text(
                  "$host Link",
                  style: MainTextStyle.mediumTextStyle(
                    fontSize: 14,
                    color: state == LectureStatesEnum.finished
                        ? MainColors.onSurfaceSecondary
                        : MainColors.primary,
                  ).copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: state == LectureStatesEnum.finished
                        ? MainColors.onSurfaceSecondary
                        : MainColors.primary,
                  ),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutePaths.cancelSession,arguments: programId);
                },
                child: Text(
                  "الغاء المحاضرة",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 12,
                    // color: MainColors.blueTextColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
