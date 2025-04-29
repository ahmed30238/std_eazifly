import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/reports_and_complaints_view/widgets/report_state_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class ImagePart extends StatelessWidget {
  final String state;
  const ImagePart({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            color: MainColors.lightblue,
            borderRadius: 12.cr,
          ),
          child: SvgPicture.asset(
            Assets.iconsSetting,
            fit: BoxFit.scaleDown,
          ),
        ),
        4.ph,
        ProblemState(state: state)
      ],
    );
  }
}