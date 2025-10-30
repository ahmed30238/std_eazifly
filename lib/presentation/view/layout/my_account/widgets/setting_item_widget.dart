import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/widgets/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingItemWidget extends StatelessWidget {
  final SettingItemModel model;

  const SettingItemWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: SizedBox(
        height: 56.h,
        child: Row(
          children: [
            SvgPicture.asset(model.icon),
            8.pw,
            Text(
              model.label,
              style: MainTextStyle.mediumTextStyle(
                fontSize: 14,
                color: MainColors.onSecondary,
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 15),
          ],
        ),
      ),
    );
  }
}
