import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final String? text1;
  final String? text2;
  final TextStyle? text1Style;
  final String? spaceText;
  final TextStyle? spaceStyle;
  final TextStyle? text2Style;
  final VoidCallback? onText1Tap; // وظيفة النقر للنص الأول
  final VoidCallback? onText2Tap; // وظيفة النقر للنص الثاني

  const CustomRichText({
    super.key,
    this.text1,
    this.text2,
    this.text1Style,
    this.text2Style,
    this.spaceStyle,
    this.spaceText,
    this.onText1Tap,
    this.onText2Tap,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: text1 ?? "الملاحظات:",
            style:
                text1Style ??
                MainTextStyle.mediumTextStyle(
                  fontSize: 12,
                  color: MainColors.onSurfaceSecondary,
                ),
            recognizer: onText1Tap != null
                ? (TapGestureRecognizer()..onTap = onText1Tap)
                : null,
          ),
          TextSpan(text: spaceText, style: spaceStyle),
          TextSpan(
            text: text2 ?? " اجابات جيدة ولكن هناك بعض الاخطاء في السؤال 3",
            style:
                text2Style ??
                MainTextStyle.mediumTextStyle(
                  fontSize: 11,
                  color: MainColors.onSecondary,
                ),
            recognizer: onText2Tap != null
                ? (TapGestureRecognizer()..onTap = onText2Tap)
                : null,
          ),
        ],
      ),
    );
  }
}
