// session_card_item.dart
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/domain/entities/home/get_home_current_session_entity.dart';
import 'package:eazifly_student/presentation/controller/home_controller/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'users_section_widget.dart';
import 'platform_section_widget.dart';
import 'zoom_link_section_widget.dart';

class SessionCardItem extends StatelessWidget {
  final int index;
  final GetHomeCurrentSessionData sessionData;
  final String title;
  final HomeCubit cubit;

  const SessionCardItem({
    super.key,
    required this.index,
    required this.sessionData,
    required this.title,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: index == 1 ? 7.w : 0,
      ),
      child: InkWell(
        onTap: () {
          // Handle card tap if needed
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: index == 2 ? 12.w : 0,
          ),
          height: 78.h,
          width: 109.w,
          decoration: BoxDecoration(
            borderRadius: 10.cr,
            color: MainColors.veryLightGrayFormField,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: index == 2 
                ? CrossAxisAlignment.start 
                : CrossAxisAlignment.center,
            children: [
              // Card title
              Text(
                title,
                style: MainTextStyle.boldTextStyle(
                  fontSize: 12,
                  color: MainColors.grayTextColors,
                ),
              ),
              
              // Card content based on index
              _buildCardContent(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardContent(BuildContext context) {
    switch (index) {
      case 0:
        return UsersSectionWidget(sessionData: sessionData);
      case 1:
        return const PlatformSectionWidget();
      case 2:
        return ZoomLinkSectionWidget(
          sessionData: sessionData,
          cubit: cubit,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}