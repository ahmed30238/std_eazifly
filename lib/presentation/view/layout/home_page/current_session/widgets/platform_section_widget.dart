// platform_section_widget.dart
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';

class PlatformSectionWidget extends StatelessWidget {
  const PlatformSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "عبر تطبيق زوم",
      style: MainTextStyle.boldTextStyle(
        fontSize: 12,
        color: MainColors.blackText,
      ),
    );
  }
}