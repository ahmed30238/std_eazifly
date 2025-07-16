import 'dart:math';

import 'package:eazifly_student/core/component/icons_container.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/presentation/view/lecture/joined_lecture_screen/widgets/leave_lecture_alert_bottom_heet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DownSideIconsRow extends StatelessWidget {
  const DownSideIconsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconsContainer(
          containerColor: MainColors.black,
          iconWidget: Icon(
            Icons.menu,
            color: MainColors.white,
          ),
          height: 38.h,
          width: 38.w,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: IconsContainer(
            containerColor: MainColors.black,
            iconWidget:  Icon(
              Icons.mic_off_outlined,
              color: MainColors.white,
            ),
            height: 38.h,
            width: 38.w,
          ),
        ),
        InkWell(
          onTap: () => showModalSheet(
            context,
            isFixedSize: true,
            minHeight: 175.h,
            maxHeight: 175.h,
            widget:  const LeaveLectureAlertBottomSheetDesign(),
          ),
          child: Transform.rotate(
            angle: pi,
            child: IconsContainer(
              containerColor: MainColors.red,
              iconWidget:  Icon(
                Icons.logout,
                color: MainColors.white,
              ),
              height: 38.h,
              width: 38.w,
            ),
          ),
        ),
      ],
    );
  }
}
