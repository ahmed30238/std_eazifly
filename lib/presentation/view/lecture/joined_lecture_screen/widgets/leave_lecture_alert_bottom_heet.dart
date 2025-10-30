import 'package:eazifly_student/core/component/custom_elevated_btn.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LeaveLectureAlertBottomSheetDesign extends StatelessWidget {
  const LeaveLectureAlertBottomSheetDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            23.ph,
            Row(
              children: [
                SvgPicture.asset(Assets.iconsProfile),
                Text(
                  "إنهاء المحاضرة",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 18,
                    color: MainColors.onError,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close),
                ),
              ],
            ),
            8.ph,
            Text(
              "هل تريد إنهاء المحاضرة ؟",
              style: MainTextStyle.mediumTextStyle(fontSize: 14),
            ),
            23.ph,
            CustomElevatedButton(
              text: "إنهاء المحاضرة",
              width: double.infinity,
              radius: 16.r,
              height: 48.h,
              textColor: MainColors.background,
              color: MainColors.onError,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RoutePaths.lectureView,
                  arguments: {
                    "programId": 1, // TODO
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
