import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/component/custom_elevated_btn.dart';
import 'package:eazifly_student/core/component/home_appbar.dart';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/view/goals_view/widgets/goals_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeline_tile/timeline_tile.dart';
// import 'package:timelines_plus/timelines_plus.dart';
// import 'package:timelines_plus/timelines_plus.dart' hide TimelineTile;

class GoalsView extends StatelessWidget {
  const GoalsView({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        isCenterTitle: true,
        mainTitle: lang.goals,
        leadingText: lang.back,
        // onLeadinTap: () => back(context),
        customAction: const [AppbarIconWidget()],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => 10.ph,
              padding: EdgeInsets.only(right: 8.w),
              itemBuilder: (context, index) => TimelineTile(
                isLast: index == 6,
                alignment: TimelineAlign.start,
                lineXY: 0.05,
                isFirst: index == 0,
                hasIndicator: true,
                indicatorStyle: IndicatorStyle(
                    indicator: Checkbox(
                  shape: const CircleBorder(
                      side: BorderSide(color: MainColors.red)),
                  value: false,
                  onChanged: (value) {},
                )),
                endChild: const GoalsItem(),
                beforeLineStyle: LineStyle(thickness: 1),
              ),
              itemCount: 7,
            ),
          ),
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
              Navigator.pushNamed(context, RoutePaths.leaderBoardView,);
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
