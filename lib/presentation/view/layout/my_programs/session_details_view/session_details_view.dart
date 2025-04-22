import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SessionDetailsView extends StatelessWidget {
  const SessionDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        mainTitle: "محاضرة رياضيات للصف السادس",
        leadingText: lang.dates,
        isCenterTitle: true,
        onLeadinTap: () => back(context),
      ),
      body: Column(
        children: [
          Container(
            height: 78.h,
            width: double.infinity,
            decoration: const BoxDecoration(),
          ),
          const Text(
            "asdasdsa",
          ),
        ],
      ),
    );
  }
}
