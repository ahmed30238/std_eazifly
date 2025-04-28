import 'package:eazifly_student/core/component/texted_container.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/dummy_data.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LectureStats extends StatelessWidget {
  final double? horizontalPadding;
  final String? titleText;
  final LectureStatesEnum state;
  final Widget? downSideWidget;
  const LectureStats({
    super.key,
    this.horizontalPadding,
    required this.state,
    this.titleText,
    this.downSideWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3,
          (index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: index == 1 ? 8.w : 0),
            child: Container(
              height: 80.h,
              width: 109.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: MainColors.veryLightGrayFormField,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    titleText ?? lectureStatsTitle[index],
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.grayTextColors,
                    ),
                  ),
                  index == 2
                      ? lectureStates(state)
                      : Text(
                          lectureStatsSubTitles[index],
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 14,
                            color: MainColors.blackText,
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum LectureStatesEnum {
  finished,
  ongoing,
  dated,
}

Widget lectureStates(LectureStatesEnum state) {
  switch (state) {
    case LectureStatesEnum.ongoing:
      return TextedContainer(
        text: "منذ 3 دقائق",
        height: 28.h,
        width: 83.w,
        fontSize: 12,
        radius: 16.r,
        containerColor: MainColors.lightRed,
        textColor: MainColors.red,
      );
    case LectureStatesEnum.dated:
      return TextedContainer(
        text: "بعد 2 يوم",
        height: 28.h,
        width: 83.w,
        fontSize: 12,
        radius: 16.r,
        containerColor: MainColors.lightRed,
        textColor: MainColors.red,
      );
    case LectureStatesEnum.finished:
      return TextedContainer(
        text: "انتهت",
        height: 28.h,
        width: 83.w,
        fontSize: 12,
        radius: 16.r,
        containerColor: MainColors.lightRed,
        textColor: MainColors.red,
      );
    default:
      return const Text("Error");
  }
}
