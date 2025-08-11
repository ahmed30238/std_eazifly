
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MainTextStyle {
  static TextStyle _mainAppTextStyle({bool plusJakartaSans = false}) => plusJakartaSans
      ? GoogleFonts.plusJakartaSans()
      : GoogleFonts.ibmPlexSansArabic();

  static TextStyle boldTextStyle({
    required double fontSize,
    bool? plusJakartaSans,
    Color? color,
  }) =>
      _mainAppTextStyle(plusJakartaSans: plusJakartaSans ?? false).copyWith(
        fontSize: fontSize.sp,
        color: color ?? MainColors.onSecondary,
        fontWeight: FontWeight.w700,
      );
  static TextStyle mediumTextStyle({
    required double fontSize,
    Color? color,
    bool? plusJakartaSans,
  }) =>
      _mainAppTextStyle(plusJakartaSans: plusJakartaSans ?? false).copyWith(
        fontSize: fontSize.sp,
        color: color ?? MainColors.onSecondary,
        fontWeight: FontWeight.w600,
      );
  static TextStyle regularTextStyle({
    required double fontSize,
    Color? color,
  }) =>
      _mainAppTextStyle().copyWith(
        fontSize: fontSize.sp,
        color: color ?? MainColors.onSecondary,
        fontWeight: FontWeight.w500,
      );
}
