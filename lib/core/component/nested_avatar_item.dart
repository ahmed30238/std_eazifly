import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PositionedItem extends StatelessWidget {
  final double? width;
  final double? height;
  final double padding;
  final String? image;
  const PositionedItem({
    super.key,
    required this.padding,
    this.image,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: padding,
      child: AvatarImage(
        // padding: EdgeInsets.zero,
        width: width ?? 24.w,
        height: height ?? 24.h,
        imageUrl: image,

        shape: BoxShape.circle,
      ),
    );
  }
}
