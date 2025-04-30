import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:flutter/material.dart';

class ChangeLecturerView extends StatelessWidget {
  const ChangeLecturerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "changeLecturer",
        leadingText: "leadingText",
      ),
    );
  }
}
