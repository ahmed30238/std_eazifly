import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/view/meeting_data_view/widgets/dummy_stud_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentStats extends StatelessWidget {
  final double? horizontalPadding;
  final List<String>? titleText;
  final List<String>? descText;
  final Widget? downSideWidget;
  final VoidCallback? onFirstItemTap;
  final VoidCallback? onSecondItemTap;
  final VoidCallback? onThirdItemTap;
  const StudentStats({
    super.key,
    this.horizontalPadding,
    this.titleText,
    this.descText,
    this.downSideWidget,
    this.onFirstItemTap,
    this.onSecondItemTap,
    this.onThirdItemTap,
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
            child: InkWell(
              onTap: index == 0
                  ? onFirstItemTap
                  : index == 1
                      ? onSecondItemTap
                      : onThirdItemTap,
              child: Container(
                height: 78.h,
                width: 109.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: MainColors.veryLightGrayFormField,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      titleText?[index] ?? dataList(context)[index].evaluationTitle,
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 12,
                        color: MainColors.grayTextColors,
                      ),
                    ),
                    downSideWidget ??
                        Text(
                         descText?[index]?? dataList(context)[index].percentage,
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 12,
                            color: MainColors.blackText,
                          ),
                        ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
