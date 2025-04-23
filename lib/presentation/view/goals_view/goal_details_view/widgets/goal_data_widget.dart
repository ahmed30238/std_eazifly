import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class GoalDataWidget extends StatelessWidget {
  const GoalDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              lang.goals,
              style: MainTextStyle.boldTextStyle(
                fontSize: 11,
                color: MainColors.grayTextColors,
              ),
            ),
            Text(
              lang.pointsBalance.substring(5, 11),
              style: MainTextStyle.boldTextStyle(
                fontSize: 11,
                color: MainColors.grayTextColors,
              ),
            ),
          ],
        ),
        4.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "أصناف الناس في العبادة",
              style: MainTextStyle.boldTextStyle(fontSize: 14),
            ),
            const Spacer(),
            SvgPicture.asset(
              MyImages.iconsCoin,
            ),
            Text(
              "20",
              style: MainTextStyle.boldTextStyle(fontSize: 15),
            ),
          ],
        ),
      ],
    );
  }
}