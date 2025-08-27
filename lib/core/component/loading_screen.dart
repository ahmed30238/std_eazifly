import 'package:eazifly_student/core/component/animated_loader.dart';
import 'package:eazifly_student/core/extensions/widgets_extensions.dart';
import 'package:flutter/material.dart';

class CircularProgressIndicatorScreen extends StatelessWidget {
  const CircularProgressIndicatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black.withValues(alpha:0.3), // Semi-transparent background
        child: const AnimatedLoader().center(),
      ),
    );
  }
}
