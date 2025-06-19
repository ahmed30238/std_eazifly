import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/view/goals_view/goals_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class GoalsItem extends StatelessWidget {
  final String title;
  final String points;
  final String description;
  final VoidCallback onTap;

  const GoalsItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.points,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 16.w, bottom: 16.h),
        height: 96.h,
        // Remove fixed width - let it expand to available space
        decoration: BoxDecoration(
          color: MainColors.veryLightGrayFormField,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: MainColors.grayBorderColor, width: 2.w),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomBadge(),
            12.pw,
            // Wrap the column in Expanded to take remaining space
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 21.h,
                    // Remove fixed width here too
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Wrap title in Flexible to handle overflow
                        Flexible(
                          child: Text(
                            title,
                            style: MainTextStyle.boldTextStyle(fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        8.pw, // Small spacing instead of Spacer
                        const Spacer(),
                        SvgPicture.asset(Assets.iconsCoin),
                        // 4.pw, // Small spacing
                        Text(
                          points,
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 11,
                            color: MainColors.grayTextColors,
                          ),
                        ),
                      ],
                    ),
                  ),
                  8.ph,
                  // Wrap Html in Flexible to prevent overflow
                  Flexible(
                    child: Html(
                      data: description,
                      // Add these properties to control Html widget behavior
                      // style: {
                      //   "body": Style(
                      //     // margin: EdgeInsets.zero,
                      //     // padding: EdgeInsets.zero,
                      //   ),
                      // },
                    ),
                  ),
                ],
              ),
            ),
            // Add some right padding
            8.pw,
          ],
        ),
      ),
    );
  }
}
