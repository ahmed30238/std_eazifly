// platform_section_widget.dart
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';

import '../../../../../../domain/entities/home/get_home_current_session_entity.dart';

class PlatformSectionWidget extends StatelessWidget {
  final GetHomeCurrentSessionData sessionData;
  const PlatformSectionWidget({super.key, required this.sessionData});

  @override
  Widget build(BuildContext context) {
    return Text(
      "عبر تطبيق زوم", // TODO: put host when it comes from backend
      style: MainTextStyle.boldTextStyle(
        fontSize: 12,
        color: MainColors.onSecondary,
      ),
    );
  }
}
