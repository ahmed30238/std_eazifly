import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/presentation/view/lecture/lecture_details_view/widget/lecture_data_plus_link.dart';
import 'package:eazifly_student/presentation/view/lecture/lecture_details_view/widget/row_buttons.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/lecture_stats_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LectureDetailsView extends StatelessWidget {
  const LectureDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "محاضرة رياضيات للصف السادس",
        leadingText: "المواعيد",
        leadingCustomWidth: 80.w,
        onLeadinTap: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          24.ph,
          const LectureStats(status: LectureStatesEnum.ongoing),
          12.ph,
          const LectureDataPlusLinkRow(),
          const Spacer(),
          const RowButtons(),
          48.ph,
        ],
      ),
    );
  }
}
