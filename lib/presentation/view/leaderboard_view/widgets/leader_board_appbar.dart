import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LeaderBoardAppbar extends StatelessWidget implements PreferredSizeWidget {
  const LeaderBoardAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;

    return CustomAppBar(
      context,
      mainTitle: lang.goals,
      leadingText: lang.back,
      isCenterTitle: true,
      customAction: [
        InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SvgPicture.asset(Assets.iconsVerticalDots),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
