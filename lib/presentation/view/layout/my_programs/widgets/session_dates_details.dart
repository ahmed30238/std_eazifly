import 'package:eazifly_student/core/component/custom_elevated_btn.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/extensions/widgets_extensions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SessionDatesDetails extends StatelessWidget {
  final String firstTitle;
  final String firstSubTitle;
  final String secondTitle;
  final String secondSubTitle;
  final String thirdTitle;
  final String thirdSubTitle;
  final SizedBox? fixedSpace;
  final double? fixedFontSize;
  final bool isBtn;
  const SessionDatesDetails({
    super.key,
    required this.firstTitle,
    required this.firstSubTitle,
    required this.secondTitle,
    required this.secondSubTitle,
    required this.thirdTitle,
    required this.thirdSubTitle,
    this.fixedSpace,
    this.isBtn = true,
    this.fixedFontSize,
  });

  @override
  Widget build(BuildContext context) {
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
                  firstTitle,
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 11,
                    color: MainColors.grayTextColors,
                  ),
                ),
                fixedSpace ?? 12.ph,
                Text(
                  firstSubTitle,
                  style: MainTextStyle.boldTextStyle(
                    fontSize: fixedFontSize ?? 14,
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
                  secondTitle,
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 11,
                    color: MainColors.grayTextColors,
                  ),
                ),
                fixedSpace ?? 12.ph,
                Text(
                  secondSubTitle,
                  style: MainTextStyle.boldTextStyle(
                    fontSize: fixedFontSize ?? 14,
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
                  thirdTitle,
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 11,
                    color: MainColors.grayTextColors,
                  ),
                ),
                fixedSpace ?? 10.ph,
                if (isBtn) ...{
                  CustomLowSizeButton(
                    onTap: () {},
                    text: "اعادة دخول",
                  ),
                } else ...{
                  Text(
                    secondSubTitle,
                    style: MainTextStyle.boldTextStyle(
                      fontSize: fixedFontSize ?? 14,
                      color: MainColors.black,
                    ),
                  ),
                }
              ],
            ),
          ),
        ],
      ).center(),
    );
  }
}
