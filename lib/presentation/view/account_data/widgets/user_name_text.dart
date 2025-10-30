import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';

class UserNameText extends StatelessWidget {
  final String name;
  const UserNameText({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        name,
        style: MainTextStyle.boldTextStyle(
          fontSize: 16,
          color: MainColors.onSecondary,
        ),
      ),
    );
  }
}
