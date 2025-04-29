import 'package:eazifly_student/core/images/my_images.dart';
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
      child: Container(
        padding: EdgeInsets.zero,
        width: width ?? 24.w,
        height: height ?? 24.h,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.w,
            color: Colors.white,
          ),
          shape: BoxShape.circle,
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              Assets.imagesPersona,
            ),
          ),
        ),
      ),
    );
  }
}
