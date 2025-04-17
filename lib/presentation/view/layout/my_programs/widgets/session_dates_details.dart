import 'package:eazifly_student/core/component/custom_elevated_btn.dart';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/extensions/widgets_extensions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SessionDatesDetails extends StatelessWidget {
  const SessionDatesDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  "المحاضرة القادمة",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 11,
                    color: MainColors.grayTextColors,
                  ),
                ),
                12.ph,
                Text(
                  "12:45 PM",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 14,
                    color: MainColors.black,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  lang.sessionDuration,
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 11,
                    color: MainColors.grayTextColors,
                  ),
                ),
                12.ph,
                Text(
                  "30 دقيقة",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 14,
                    color: MainColors.black,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  lang.sessionState,
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 11,
                    color: MainColors.grayTextColors,
                  ),
                ),
                10.ph,
                CustomLowSizeButton(
                  onTap: () {},
                  text: "اعادة دخول",
                ),
              ],
            ),
          ),
        ],
      ).center(),
    );
  }
}
