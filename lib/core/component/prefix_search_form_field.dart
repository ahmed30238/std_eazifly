import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PrefixSearchFormField extends StatelessWidget {
  const PrefixSearchFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 12.w,
        left: 8.w,
        top: 12.h,
        bottom: 12.h,
      ),
      child: SvgPicture.asset(
        Assets.iconsSearchNormal,
        colorFilter: const ColorFilter.mode(
          MainColors.formFieldgrayTextColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
