import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/notifications_view/notification_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
class GoalsViewAppbar extends StatelessWidget implements PreferredSizeWidget {
  const GoalsViewAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;

    return CustomAppBar(
      context,
      isCenterTitle: true,
      mainTitle: lang.goals,
      leadingText: lang.back,
      // onLeadinTap: () => back(context),
      customAction: [
        InkWell(
          onTap: () => showModalSheet(
            context,
            widget: CustomBottomSheetDesign(
              height: 101.h,
              radius: 16.r,
              widget: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: InkWell(
                  onTap: () => Navigator.pushNamed(
                    context,
                    RoutePaths.leaderBoardView,
                  ),
                  child: SizedBox(
                    height: 45.h,
                    child: Text(
                      lang.leaderboardMenu,
                      style: MainTextStyle.boldTextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ),
            ),
            isFixedSize: true,
            safeArea: true,
            minHeight: 101.h,
            maxHeight: 102.h,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SvgPicture.asset(
              Assets.iconsVerticalDots,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);
}