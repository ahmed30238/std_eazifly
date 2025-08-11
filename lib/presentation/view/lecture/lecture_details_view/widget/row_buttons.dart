import 'package:eazifly_student/core/component/custom_elevated_btn.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowButtons extends StatelessWidget {
  const RowButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        16.pw,
        Expanded(
          child: CustomElevatedButton(
            height: 48.h,
            text: "أعادة دخول المحاضرة",
            textSize: 15,
            onPressed: () => Navigator.pushNamed(
              context,
              RoutePaths.joinedLectureScreen,
            ),
            color: MainColors.tertiary,
            radius: 16.r,
          ),
        ),
        16.pw,
        Expanded(
          child: CustomElevatedButton(
            text: "إنتهاء المحاضرة",
            textSize: 16,
            textColor: MainColors.primary,
            borderColor: MainColors.primary,
            onPressed: () => Navigator.pushNamed(
              context,
              RoutePaths.lectureView,
              arguments: {
                "programId": 1, // TODO
              },
            ),
            color: MainColors.background,
            radius: 16.r,
          ),
        ),
        16.pw,
      ],
    );
  }
}
