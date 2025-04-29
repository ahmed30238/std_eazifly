import 'package:eazifly_student/core/component/nested_avatar_container.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/lecture_stats_row.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigateToLectureView extends StatelessWidget {
  const NavigateToLectureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "محاضرة رياضيات للصف السادس",
        leadingText: "المواعيد",
        isCenterTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              height: 78.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: 12.cr,
                color: MainColors.veryLightGrayFormField,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: SizedBox(
                  width: 216.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "إسم البرنامج",
                        style: MainTextStyle.boldTextStyle(
                            fontSize: 11, color: MainColors.grayTextColors),
                      ),
                      10.5.ph,
                      Text(
                        "محاضرة رياضيات للصف السادس",
                        style: MainTextStyle.boldTextStyle(
                            fontSize: 12, color: MainColors.blackText),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            8.ph,
            LectureStats(
              reJoin: true,
              state: LectureStatesEnum.finished,
              horizontalPadding: 0,
              onRejoinTap: () {},
              titleText: const [
                "موعد المحاضرة",
                "مدة المحاضرة",
                "حالة المحاضرة",
              ],
            ),
            8.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: index == 1 ? 8.w : 0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: index == 2 ? 12.w : 0,
                      ),
                      height: 78.h,
                      width: 109.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: MainColors.veryLightGrayFormField,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: index == 2
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.center,
                        children: [
                          Text(
                            stdTitleList[index],
                            style: MainTextStyle.boldTextStyle(
                              fontSize: 12,
                              color: MainColors.grayTextColors,
                            ),
                          ),
                          index == 0
                              ? NestedAvatarContainer(
                                  alignment: MainAxisAlignment.center,
                                  number: "9",
                                  textColors: MainColors.blackText,
                                  areaHeigt: 26.h,
                                  areaWidth: 52.w,
                                  avatarHeigt: 24.h,
                                  avatarWidth: 24.w,
                                )
                              : index == 1
                                  ? Text(
                                      "عبر تطبيق زوم",
                                      style: MainTextStyle.boldTextStyle(
                                        fontSize: 12,
                                        color: MainColors.blackText,
                                      ),
                                    )
                                  : Text(
                                      "Zoom Link",
                                      style: GoogleFonts.inter(
                                          color: MainColors.blueTextColor,
                                          decoration: TextDecoration.underline,
                                          decorationColor:
                                              MainColors.blueTextColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            24.ph,
            Row(
              children: [
                SvgPicture.asset(
                  height: 24.h,
                  width: 24.w,
                  Assets.iconsRejectRequest,
                  fit: BoxFit.scaleDown,
                ),
                4.pw,
                Expanded(
                  child: Text(
                    "انت متاخر  علي المحاضرة قم بالتوجة الي المحاضرة بالضغط علي الرابط المرفق",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.red,
                    ),
                  ),
                )
              ],
            ),
            const Spacer(),
            Row(
              children: [
                CustomElevatedButton(
                  height: 48.h,
                  width: 197.w,
                  color: MainColors.blueTextColor,
                  radius: 16.r,
                  text: "التوجهةة الي المحاضرة",
                  onPressed: () {},
                ),
                8.pw,
                CustomElevatedButton(
                  height: 45.h,
                  width: 138.w,
                  color: MainColors.white,
                  textColor: MainColors.blueTextColor,
                  borderColor: MainColors.blueTextColor,
                  radius: 16.r,
                  text: "تواصل مع المعلم",
                  textSize: 14,
                  onPressed: () {},
                ),
              ],
            ),
            32.ph,
          ],
        ),
      ),
    );
  }
}

var stdTitleList = ["الطلاب الاخرين", "بينات المحاضرة", "الرابط"];
