import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/component/custom_elevated_btn.dart';
import 'package:eazifly_student/core/component/custom_rich_text.dart';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/routes/paths.dart';
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
        context,
        mainTitle: "بينات اللقاء",
        leadingText: lang.back,
        onLeadinTap: () => back(context),
        isCenterTitle: true,
      ),
      body: Column(
        children: [
          45.ph,
          SvgPicture.asset(
            Assets.iconsAboutAppIcon, // todo replace with its icon
          ),
          45.ph,
          const StudentStats(),
          8.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      useSafeArea: true,
                      builder: (context) => Dialog(
                        insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
                        backgroundColor: MainColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: 8.cr,
                        ),
                        child: Container(
                          // margin: EdgeInsets.symmetric(horizontal: 16.w),
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          height: 168.h,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              24.ph,
                              SizedBox(
                                height: 21.h,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "موعد التجديد القادم",
                                      style: MainTextStyle.boldTextStyle(
                                          fontSize: 14),
                                    ),
                                    InkWell(
                                      onTap: () => back(context),
                                      child: Icon(
                                        Icons.close,
                                        size: 20.r,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              12.ph,
                              SizedBox(
                                height: 34.h,
                                child: CustomRichText(
                                  text1: "بعد 2 يوم",
                                  text1Style: MainTextStyle.boldTextStyle(
                                    fontSize: 14,
                                    color: MainColors.red,
                                  ),
                                  spaceText: "  :  ",
                                  spaceStyle:
                                      MainTextStyle.boldTextStyle(fontSize: 12),
                                  text2: "14 ساعة",
                                  text2Style: MainTextStyle.boldTextStyle(
                                    fontSize: 14,
                                    color: MainColors.red,
                                  ),
                                ),
                              ),
                              16.ph,
                              CustomElevatedButton(
                                width: 123.w,
                                height: 37.h,
                                text: lang.renewNow,
                                onPressed: () {
                                  Navigator.pushNamed(
                                    arguments: false,
                                    context,
                                    RoutePaths.lectureView,
                                  );
                                },
                                textColor: MainColors.white,
                                radius: 12.r,
                                color: MainColors.blueTextColor,
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    );
                  }, // todo show dialog
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
