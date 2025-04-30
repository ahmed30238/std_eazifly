import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:flutter/material.dart';

class ProgramGoalsView extends StatelessWidget {
  const ProgramGoalsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "mainTitle",
        leadingText: "leadingText",
      ),
    );
  }
}
