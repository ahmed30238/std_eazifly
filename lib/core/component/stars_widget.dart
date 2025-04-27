import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StarsWidget extends StatelessWidget {
  final double rating;
  final double starSize;

  const StarsWidget({
    super.key,
    required this.rating,
    required this.starSize,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      ignoreGestures: true,
      initialRating: rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: starSize,
      // itemPadding: EdgeInsets.symmetric(horizontal: 2.0.h),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: MainColors.starColor,
        size: 13.r,
      ),
      onRatingUpdate:
          (_) {}, // set onRatingUpdate to null to make the widget read-only
    );
  }
}
