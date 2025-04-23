import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/widgets/std_data_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentManagementView extends StatelessWidget {
  const StudentManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(     context,
        mainTitle: "ادارة الطلاب",
        isCenterTitle: true,
        leadingText: lang.back,
        onLeadinTap: () => back(context),
        leadingCustomWidth: 100.w,
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemBuilder: (context, index) => StudentDataItem(
          index: index,
        ),
        itemCount: 13,
        separatorBuilder: (context, index) => 10.ph,
      ),
    );
  }
}

