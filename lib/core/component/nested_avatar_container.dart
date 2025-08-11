import 'package:eazifly_student/core/component/nested_avatar_item.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NestedAvatarContainer extends StatelessWidget {
  final String number;
  final double? areaWidth;
  final double? avatarWidth;
  final double? areaHeigt;
  final double? avatarHeigt;
  final double? avatar1Padding;
  final double? avatar2Padding;
  final double? textPadding;
  final Color? textColors;
  final int? noOfItems;
  final MainAxisAlignment? alignment;
  final List<String> image;
  const NestedAvatarContainer({
    this.areaHeigt,
    this.areaWidth,
    this.avatarHeigt,
    this.avatarWidth,
    this.textColors,
    this.avatar1Padding,
    this.avatar2Padding,
    this.textPadding,
    this.alignment,
    this.noOfItems,
    required this.number,
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment ?? MainAxisAlignment.start,
      children: [
        SizedBox(
          width: areaWidth ?? 50.w,
          height: areaHeigt ?? 24.h,
          child: Stack(
            children: List.generate(
              noOfItems ?? 3,
              (index) => PositionedItem(
                width: avatarWidth ?? 32.w,
                height: avatarHeigt ?? 32.w,
                padding: index * 15.w,
                image: image[index],
              ),
            ),
          ),
        ),
        textPadding != null
            ? SizedBox(
                width: textPadding,
              )
            : 3.pw,
        Text(
          number,
          style: MainTextStyle.boldTextStyle(
            fontSize: 16,
            color: textColors ?? MainColors.primary,
          ),
        ),
      ],
    );
  }
}
