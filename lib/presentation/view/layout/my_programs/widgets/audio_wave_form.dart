import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:flutter/material.dart';

class AudioWaveformWidget extends StatelessWidget {
  final bool isRecording;
  final Color waveColor;
  final double? height;
  final double? width;

  const AudioWaveformWidget({
    super.key,
    this.isRecording = true,
    this.waveColor = Colors.red,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 20,
      width: width ?? 100.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _buildWaveBars(),
      ),
    );
  }

  List<Widget> _buildWaveBars() {
    // ارتفاعات مختلفة للموجات لتبدو طبيعية
    List<double> waveHeights = [
      0.3,
      0.7,
      0.4,
      0.8,
      0.2,
      0.9,
      0.5,
      0.6,
      0.3,
      0.7,
      0.8,
      0.4,
      0.6,
      0.9,
      0.3,
      0.5,
      0.7,
      0.2,
      0.8,
      0.4,
      0.6,
      0.3,
      0.9,
      0.5,
      0.7,
      0.2,
      0.8,
      0.4,
      0.6,
      0.3
    ];

    return waveHeights.map((heightRatio) {
      return Container(
        width: 3.0.w,
        height: (height ?? 20) * heightRatio,
        margin: const EdgeInsets.symmetric(horizontal: 1.0),
        decoration: BoxDecoration(
          color: isRecording ? waveColor : Colors.grey.shade400,
          borderRadius: BorderRadius.circular(1.5.r),
        ),
      );
    }).toList();
  }
}

class SimpleLectureIndicator extends StatelessWidget {
  final bool isActive;

  const SimpleLectureIndicator({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AudioWaveformWidget(
          isRecording: isActive,
          height: 30.0.h,
          width: 50.0.w,
        ),
      ],
    );
  }
}
