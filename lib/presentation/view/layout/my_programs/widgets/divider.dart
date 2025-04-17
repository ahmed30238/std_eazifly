import 'package:eazifly_student/core/component/horizntal_divider.dart';
import 'package:flutter/material.dart';

class WavyDivider extends StatelessWidget {
  const WavyDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.center,
      children: [
        CustomHorizontalDivider(),
        Positioned(
          // right: (343* .5).w,
          // left: (343* .5).w,
          child: Text(
            "dfdsfsd",
          ),
        ),
      ],
    );
  }
}