import 'package:eazifly_student/core/component/custom_tapbar.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:flutter/material.dart' hide Badge;

class LectureTabBar extends StatelessWidget {
  const LectureTabBar({super.key, required this.cubit, this.onTabTap});

  final LectureCubit cubit;
  final Function(int)? onTabTap;

  @override
  Widget build(BuildContext context) {
    return CustomTabBar(
      controller: cubit.controller,
      onTap: onTabTap,
      isScrollable: true,
      tabs: List.generate(cubit.tabs.length, (index) {
        bool isSelected = cubit.controller.index == index;
        return
        // index == 5
        //     ? Badge(
        //         showBadge: true,
        //         position: BadgePosition.topEnd(
        //           top: -10.h,
        //           end: -2.w,
        //         ),
        //         child: Text(
        //           cubit.tabs[index],
        //           style: MainTextStyle.boldTextStyle(
        //             fontSize: 12,
        //             color: isSelected
        //                 ? MainColors.blueTextColor
        //                 : MainColors.grayTextColors,
        //           ),
        //         ),
        //       )
        //     :
        Text(
          cubit.tabs[index],
          style: MainTextStyle.boldTextStyle(
            fontSize: 12,
            color: isSelected
                ? MainColors.primary
                : MainColors.onSurfaceSecondary,
          ),
        );
      }),
    );
  }
}
