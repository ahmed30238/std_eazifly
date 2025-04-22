import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/view/meeting_data_view/widgets/student_stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MeetingDataView extends StatelessWidget {
  const MeetingDataView({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        mainTitle: "بينات اللقاء",
        leadingText: lang.back,
        onLeadinTap: () => back(context),
        isCenterTitle: true,
      ),
      body: Column(
        children: [
          45.ph,
          SvgPicture.asset(
            MyImages.iconsAboutAppIcon, // todo replace with its icon
          ),
          45.ph,
          const StudentStats(),
          8.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                InkWell(
                  onTap: () {print("tapped");}, // todo show dialog
                  child: Container(
                    height: 72.h,
                    width: 109.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: MainColors.veryLightGrayFormField,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "بيانات المحاضرة",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 12,
                            color: MainColors.grayTextColors,
                          ),
                        ),
                        Text(
                          "عبر تطبيق زوم",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 12,
                            color: MainColors.blackText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                8.pw,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  height: 72.h,
                  width: 226.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: MainColors.veryLightGrayFormField,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "الرابط",
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 12,
                          color: MainColors.grayTextColors,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "zoom link",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 12,
                            color: MainColors.blueTextColor,
                          ).copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
