


import 'package:eazifly_student/presentation/controller/group_program_management_controller/grouppackagemanagement_cubit.dart';
import 'package:eazifly_student/presentation/view/group_package_management_view/widgets/add_new_student_area.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/widgets/std_data_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ChosenStudentBody extends StatelessWidget {
  const ChosenStudentBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = GrouppackagemanagementCubit.get(context);

    return Column(
      children: [
        const AddNewStudentArea(),
        16.ph,
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemBuilder: (context, index) {
              for (int i = 0; i < 13; i++) {
                cubit.chosen.add(false);
              }
              return Row(
                children: [
                  BlocBuilder(
                    bloc: cubit,
                    builder: (context, state) => Checkbox.adaptive(
                      activeColor: MainColors.blueTextColor,
                      visualDensity:
                          const VisualDensity(horizontal: -4, vertical: -4),
                      value: cubit.chosen[index],
                      onChanged: (value) {
                        cubit.changeChosen(index);
                      },
                    ),
                  ),
                  StudentDataItem(
                    age: "15",
                    image: "sdf",
                    name: "name",
                    phoneNumber: "0104255725",
                    width: 311.w,
                    index: index,
                    hasTrailingIcon: false,
                  ),
                ],
              );
            },
            itemCount: 13,
            separatorBuilder: (context, index) => 10.ph,
          ),
        ),
      ],
    );
  }
}