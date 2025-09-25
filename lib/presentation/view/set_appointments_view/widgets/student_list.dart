import 'dart:developer';

import 'package:eazifly_student/presentation/controller/group_program_management_controller/grouppackagemanagement_cubit.dart';
import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/student_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class StudentsList extends StatelessWidget {
  const StudentsList({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<GroupPackageManagementCubit>();
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        return SizedBox(
          height: 98.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              bool isSelected = index == cubit.selectedStudentIndex;
              var child = cubit.addedChildren?[index];
              log("${cubit.isDoneAdded}");
              return StudentItem(
                name: "${child?.firstName}",
                image: child?.image ?? "",
                isSelected: isSelected,
                isDoneAdded: cubit.isDoneAdded[index],
              );
            },
            separatorBuilder: (context, index) => 8.pw,
            itemCount: cubit.addedChildren?.length ?? 0,
          ),
        );
      },
    );
  }
}
