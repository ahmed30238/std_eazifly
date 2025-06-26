import 'package:eazifly_student/presentation/controller/group_program_management_controller/grouppackagemanagement_cubit.dart';
import 'package:eazifly_student/presentation/view/group_package_management_view/widgets/add_new_student_area.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/widgets/std_data_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ChosenStudentBody extends StatefulWidget {
  const ChosenStudentBody({super.key});

  @override
  State<ChosenStudentBody> createState() => _ChosenStudentBodyState();
}

class _ChosenStudentBodyState extends State<ChosenStudentBody> {
  late GrouppackagemanagementCubit cubit;

  @override
  void initState() {
    cubit = GrouppackagemanagementCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = GrouppackagemanagementCubit.get(context);

    return Column(
      children: [
        const AddNewStudentArea(),
        16.ph,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              BlocBuilder(
                bloc: cubit,
                builder: (context, state) {
                  return Checkbox.adaptive(
                    activeColor: MainColors.blueTextColor,
                    visualDensity: const VisualDensity(
                      horizontal: -4,
                      vertical: -4,
                    ),
                    value: cubit.addMyself,
                    onChanged: (value) {
                      cubit.toggleMyself();
                    },
                  );
                },
              ),
              Text(
                "إضافة نفسي في البرنامج",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        16.ph,
        BlocBuilder<GrouppackagemanagementCubit, GrouppackagemanagementState>(
          builder: (context, state) {
            if (cubit.getMyChildrenLoader) {
              return const Center(child: CircularProgressIndicator());
            } else if (!cubit.getMyChildrenLoader &&
                cubit.getMyChildrenEntity?.data != null) {
              // الشرط المُصحح: عدم التحميل ووجود البيانات
              final childrenList = cubit.getMyChildrenEntity?.data;
              final chosen = cubit.chosen;

              if (childrenList?.isEmpty ?? true) {
                return const Center(
                  child: Text(
                    "لا توجد أطفال مسجلين",
                    style: TextStyle(fontSize: 16),
                  ),
                );
              }

              return Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemBuilder: (context, index) {
                    final child = childrenList?[index];
                    return Row(
                      children: [
                        Checkbox.adaptive(
                          activeColor: MainColors.blueTextColor,
                          visualDensity: const VisualDensity(
                            horizontal: -4,
                            vertical: -4,
                          ),
                          value: chosen.length > index ? chosen[index] : false,
                          onChanged: (value) {
                            cubit.changeChosen(index);
                            cubit.fillAddedUsersIds(index);
                          },
                        ),
                        Expanded(
                          child: StudentDataItem(
                            age: child?.age.toString() ?? "",
                            image: child?.image ?? Assets.imagesEditedPersona,
                            name: child?.firstName ?? "غير معروف",
                            phoneNumber: child?.phone ?? "غير معروف",
                            width: 311.w,
                            hasTrailingIcon: false,
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: childrenList?.length ?? 0,
                  separatorBuilder: (context, index) => 10.ph,
                ),
              );
            } else if (state is GetMyChildernErrorState) {
              return const Center(
                child: Text(
                  "حدث خطأ أثناء تحميل البيانات",
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}
