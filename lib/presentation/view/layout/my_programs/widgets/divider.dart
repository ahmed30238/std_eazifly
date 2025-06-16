import 'package:eazifly_student/core/component/horizntal_divider.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/widgets/audio_wave_form.dart';
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
        AudioWaveformWidget(
          isRecording: true,
          height: 20.0.h,
          width: 200.0.w,
        ),
      ],
    );
  }
}
