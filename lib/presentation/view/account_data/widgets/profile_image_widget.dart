import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImageWidget extends StatelessWidget {
  final bool? isEditable;
  final double? width;
  final double? height;
  final double? borderWidth;
  final Color? borderColor;
  final DecorationImage decorationImage;
  final VoidCallback onEditTap;
  const ProfileImageWidget({
    super.key,
    this.isEditable = true,
    this.height,
    this.borderColor,
    this.borderWidth,
    this.width,
    required this.decorationImage,
    required this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    // AccountdataCubit cubit = AccountdataCubit.get(context);
    return Stack(
      fit: StackFit.loose,
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            height: height ?? 100.h,
            width: width ?? 100.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: borderColor ?? MainColors.blueTextColor,
                width: borderWidth ?? 3.w,
              ),
              image: decorationImage,
            ),
          ),
        ),
        if (isEditable!) ...{
          Positioned(
            bottom: 0,
            right: 127.w,
            child: InkWell(
              onTap: onEditTap,
              child: CircleAvatar(
                backgroundColor: MainColors.blueTextColor,
                radius: 15.r,
                child: Icon(
                  Icons.edit_calendar_rounded,
                  size: 20.r,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        },
      ],
    );
  }
}
