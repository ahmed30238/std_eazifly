import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/widgets/divider.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:flutter_html/flutter_html.dart';

class ProgramItem extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback onRejoinTap;
  final String image;
  final String title;
  final String desc;
  final String nextLec;
  final String duration;
  final String status;
  final String? timeDiff;
  final bool isRejoin;

  const ProgramItem({
    super.key,
    required this.onTap,
    required this.onRejoinTap,
    required this.image,
    required this.title,
    required this.desc,
    required this.nextLec,
    required this.duration,
    this.timeDiff,
    required this.status,
    required this.isRejoin,
  });

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return InkWell(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: 16.cr,
          color: MainColors.inputFill,
        ),
        constraints: BoxConstraints(
          minHeight: 300.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AvatarImage(
              width: 343.w,
              height: 163.h,
              radius: 16.r,
              imageUrl: image,
            ),
            8.ph,
            Text(
              title,
              style: MainTextStyle.boldTextStyle(
                fontSize: 14,
                color: MainColors.onPrimary,
              ),
            ),
            4.ph,
            Html(data: desc),
            // Text(
            //   desc,
            //   style: MainTextStyle.boldTextStyle(
            //     fontSize: 12,
            //     color: MainColors.grayTextColors,
            //   ),
            // ),
            if (status == "started") ...{
              4.ph,
              const WavyDivider(),
            },
            4.ph,
            SessionDatesDetails(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              firstTitle: lang.nextLecture,
              firstSubTitle: nextLec,
              secondTitle: lang.sessionDuration,
              secondSubTitle: duration,
              isBtn: isRejoin,
              thirdSubTitle: timeDiff ?? "",
              onRejoinTap: onRejoinTap,
              thirdTitle: lang.sessionState,
            ),
            8.ph,
          ],
        ),
      ),
    );
  }
}
