import 'package:eazifly_student/core/component/horizntal_divider.dart';
import 'package:eazifly_student/core/component/voice_message_widget.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WavyDivider extends StatelessWidget {
  const WavyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const CustomHorizontalDivider(),
        VoiceMessageWidget(
          justWave: true,
          areaWidth: 200.w,
          activeSliderColor: MainColors.redWaveColor,
          noises: 15,
          backgroundColor: MainColors.transparentColor,
          width: 150.w,
        ),
      ],
    );
  }
}
