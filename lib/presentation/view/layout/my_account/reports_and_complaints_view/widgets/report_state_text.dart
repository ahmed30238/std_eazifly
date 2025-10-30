import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';

class ProblemState extends StatelessWidget {
  final String state;
  const ProblemState({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case "جاري":
        return Text(
          "جاري",
          style: MainTextStyle.boldTextStyle(
            fontSize: 12,
            color: MainColors.success,
          ),
        );
      case "انتهت":
        return Text(
          "انتهت",
          style: MainTextStyle.boldTextStyle(
            fontSize: 12,
            color: MainColors.error,
          ),
        );
      default:
        return const SizedBox();
    }
  }
}
