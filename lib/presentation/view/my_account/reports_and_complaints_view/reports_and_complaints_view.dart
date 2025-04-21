import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/component/horizntal_divider.dart';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/presentation/view/my_account/reports_and_complaints_view/widgets/report_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportsAndComplaintsView extends StatelessWidget {
  const ReportsAndComplaintsView({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        mainTitle: lang.reportsAndComplaints,
        leadingText: lang.back,
        isCenterTitle: true,
        onLeadinTap: () => back(context),
      ),
      body: ListView.separated(
        padding: EdgeInsets.only(top: 16.h),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => ReportsAndComplaintsWidget(
          state: index == 0
              ? "جاري"
              : index == 1
                  ? ""
                  : "انتهت",
        ),
        separatorBuilder: (context, index) => const CustomHorizontalDivider(
          thickness: 1,
        ),
        itemCount: 3,
      ),
    );
  }
}
