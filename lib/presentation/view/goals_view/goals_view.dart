import 'package:eazifly_student/core/component/custom_elevated_btn.dart';
import 'package:eazifly_student/core/component/hexagon.dart';
import 'package:eazifly_student/core/component/timeline_item.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/view/goals_view/widgets/app_bar.dart';
import 'package:eazifly_student/presentation/view/goals_view/widgets/goals_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoalsView extends StatelessWidget {
  const GoalsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GoalsViewAppbar(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                20.ph,
                ...List.generate(
                  7,
                  (index) => TimlineItem(
                    padding: EdgeInsets.symmetric(vertical: .5.h),
                    lineXY: .01,
                    indicatorXY: .4.h,
                    indicator: Checkbox.adaptive(
                      activeColor: MainColors.blueTextColor,
                      value: index == 0,
                      onChanged: (p) {},
                      shape: const CircleBorder(),
                    ),
                    isFirst: index == 0,
                    isLast: index == 6,
                    child: GoalsItem(
                      onTap: () {},
                      title: "المنافقين من 17 الى 20",
                      points: "20",
                      description1: "تقييم على ماتم حفظه من 1 الى 20",
                      description2: "إختبار تطبيقي على الغنة والقلقلة",
                    ),
                  ),
                ),
              ],
            ),
          ),
          8.ph,
          CustomElevatedButton(
            text: "قائمة المتصدرين",
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
    return ClipPath(
      clipper: HexaGon(),
      child: Container(
        width: 80.w,
        height: 80.h,
        decoration: BoxDecoration(
          // color: MainColors.white
          color: MainColors.red,
          // borderRadius: 48.cr,
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              Assets.imagesPersona,
            ),
          ),
        ),
      ),
    );
  }
}
