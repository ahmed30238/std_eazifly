import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageContainer extends StatelessWidget {
  final double? containerWidth;
  final BoxFit? fit;
  final double? containerHeight;
  final String? image;
  final Color? borderColor;
  final double? borderWidth;
  final BoxShape? shape;
  final Widget? child;
  final double? radius;
  const ImageContainer({
    super.key,
    this.fit,
    this.containerHeight,
    this.borderColor,
    this.child,
    this.borderWidth,
    this.containerWidth,
    this.image,
    this.radius,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: containerWidth ?? 48.w,
      height: containerHeight ?? 32.h,
      decoration: BoxDecoration(
        shape: shape ?? BoxShape.rectangle,
        border: Border.all(
          strokeAlign: BorderSide.strokeAlignCenter,
          width: borderWidth ?? 0,
          color: borderColor ?? MainColors.transparentColor,
        ),
        image: DecorationImage(
          fit: fit ?? BoxFit.cover,
          image: AssetImage(
            image ?? Assets.imagesPersona,
          ),
        ),
        borderRadius: shape == null
            ? BorderRadius.circular(
                radius ?? 8.r,
              )
            : null,
      ),
      child: child,
    );
  }
}
