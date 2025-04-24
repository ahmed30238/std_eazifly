import 'package:eazifly_student/core/component/custom_elevated_btn.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/view/goals_view/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeline_tile/timeline_tile.dart';
// import 'package:timelines_plus/timelines_plus.dart';
// import 'package:timelines_plus/timelines_plus.dart' hide TimelineTile;

class GoalsView extends StatelessWidget {
  const GoalsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GoalsViewAppbar(),
      body: Column(
        children: [
          20.ph,
          TimelineTile(),
          8.ph,
          CustomElevatedButton(
            text: "قائمة المتصدرين",
            // textSize: 16,
            textStyle: MainTextStyle.mediumTextStyle(
              fontSize: 16,
              color: MainColors.white,
            ),
            
            color: MainColors.blueTextColor,
            width: 147.w,
            height: 40.h,
            radius: 12.r,
            onPressed: () {
              Navigator.pushNamed(
                context,
                RoutePaths.leaderBoardView,
              );
            },
          ),
          32.ph,
        ],
      ),
    );
  }
}

class CustomBadge extends StatelessWidget {
  const CustomBadge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: MainColors.red,
        borderRadius: 48.cr,
      ),
    );
  }
}
