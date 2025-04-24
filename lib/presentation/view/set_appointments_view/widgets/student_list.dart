import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/student_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentsList extends StatelessWidget {
  const StudentsList({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 98.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          bool isSelected = false;
          if (index == 0) {
            isSelected = true;
          }
          return InkWell(
            onTap: () {},
            child: StudentItem(
              isSelected: isSelected,
            ),
          );
        },
        separatorBuilder: (context, index) => 8.pw,
        itemCount: 8,
      ),
    );
  }
}