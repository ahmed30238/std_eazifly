import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:flutter/material.dart';

class CustomHorizontalDivider extends StatelessWidget {
  final double? thickness;
  final Color? color;
  const CustomHorizontalDivider({super.key, this.thickness, this.color});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? MainColors.lightGray,
      thickness: thickness ?? 1.5,
    );
  }
}
