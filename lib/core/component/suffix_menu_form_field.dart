import 'package:eazifly_student/core/images/my_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SuffixMenuFormField extends StatelessWidget {
  const SuffixMenuFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      child: SvgPicture.asset(
        fit: BoxFit.scaleDown,
        MyImages.iconsFrame
      ),
    );
  }
}