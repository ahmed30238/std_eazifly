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
  final String code;

  const CodeDetails({
    super.key,
    required this.code,
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
            color: MainColors.inputFill,
            borderRadius: 10.cr,
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
                        ClipboardData(text: code),
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
                      code,
                      style: MainTextStyle.mediumTextStyle(
                        fontSize: 14,
                        color: MainColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(
                Assets.iconsSend2,
                colorFilter: const ColorFilter.mode(
                  MainColors.primary,
                  BlendMode.srcIn,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
