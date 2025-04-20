import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CodeDetails extends StatelessWidget {
  const CodeDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Material(
        elevation: 1,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.h),
          width: double.infinity,
          height: 68.h,
          decoration: BoxDecoration(
            color: MainColors.veryLightGrayFormField,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lang.code,
                    style: MainTextStyle.boldTextStyle(fontSize: 12),
                  ),
                  4.ph,
                  InkWell(
                    onTap: () {
                      Clipboard.setData(
                        const ClipboardData(text: "AMS 123D"),
                      ).then(
                        (value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("copied"),
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      "AMS 123D",
                      style: MainTextStyle.mediumTextStyle(
                          fontSize: 14, color: MainColors.blueTextColor),
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(MyImages.iconsSend2)
            ],
          ),
        ),
      ),
    );
  }
}
