import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:flutter/material.dart';

class ProgramsUnderReviewView extends StatelessWidget {
  const ProgramsUnderReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "برامج في المراجعة",
        leadingText: lang.myPrograms,
        isCenterTitle: true,
      ),
    );
  }
}
