import 'package:eazifly_student/core/component/home_appbar.dart';
import 'package:eazifly_student/core/component/image_conainer.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/presentation/view/lecture/joined_lecture_screen/widgets/custom_appbar_leading.dart';
import 'package:eazifly_student/presentation/view/lecture/joined_lecture_screen/widgets/custom_lecture_appbar_title.dart';
import 'package:eazifly_student/presentation/view/lecture/joined_lecture_screen/widgets/downside_icons_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JoinedLectureScreen extends StatelessWidget {
  const JoinedLectureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        appTitlesize: 17.36,
        appIconHeight: 19.h,
        appIconWidth: 22.w,
        rightNoification: false,
        leadingCustomWidth: 75.w,
        customLeading: const CustomAppbarLeading(),
        titleWidget: const CustomLectureAppbarTitle(),
        isCentered: true,
      ),
      body: Column(
        children: [
          4.ph,
          ImageContainer(
            containerHeight: 308.h,
            containerWidth: double.infinity,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.all(7.r),
                height: 27.h,
                width: 27.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.r),
                    color: MainColors.black.withOpacity(.5)),
                child: SvgPicture.asset(
                  Assets.iconsVerticalDots,
                  fit: BoxFit.scaleDown,
                  colorFilter: const ColorFilter.mode(
                    MainColors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          7.ph,
          ImageContainer(
            containerHeight: 308.h,
            containerWidth: double.infinity,
          ),
          19.ph,
          const DownSideIconsRow(),
        ],
      ),
    );
  }
}






