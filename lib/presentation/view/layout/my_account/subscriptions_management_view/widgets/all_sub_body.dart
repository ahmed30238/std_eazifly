import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/widgets/all_sub_body_list.dart';
import 'package:flutter/material.dart';

class AllSubBody extends StatelessWidget {
  const AllSubBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AllSubBodyList(
          inProgress: true,
          courseTitle: "الرياضيات للصف السادس الإبتدائي",
        ),
        12.ph,
      ],
    );
  }
}
