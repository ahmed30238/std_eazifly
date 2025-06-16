import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/widgets/divider.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ProgramItem extends StatelessWidget {
  final VoidCallback onTap;
  final String image;
  final String title;
  final String desc;
  final String nextLec;
  final String duration;

  const ProgramItem({
    super.key,
    required this.onTap,
    required this.image,
    required this.title,
    required this.desc,
    required this.nextLec,
    required this.duration,
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
          color: MainColors.veryLightGrayFormField,
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
                color: MainColors.black,
              ),
            ),
            4.ph,
            Text(
              desc,
              style: MainTextStyle.boldTextStyle(
                fontSize: 12,
                color: MainColors.grayTextColors,
              ),
            ),
            4.ph,
            const WavyDivider(),
            4.ph,
            SessionDatesDetails(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              firstTitle: lang.nextLecture,
              firstSubTitle: nextLec,
              secondTitle: lang.sessionDuration,
              secondSubTitle: duration,
              thirdSubTitle: "",
              thirdTitle: lang.sessionState,
            ),
            8.ph,
          ],
        ),
      ),
    );
  }
}
