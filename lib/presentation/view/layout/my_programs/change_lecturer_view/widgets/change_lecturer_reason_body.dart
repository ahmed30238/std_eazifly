import 'package:eazifly_student/presentation/controller/change_lecturer_controller/changelecturer_cubit.dart';
import 'package:eazifly_student/presentation/controller/change_lecturer_controller/changelecturer_state.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_state.dart';
import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/student_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ChangeLecturerReasonBody extends StatelessWidget {
  const ChangeLecturerReasonBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ChangelecturerCubit.get(context);
    var programCubit = context.read<MyProgramsCubit>();
    var lang = context.loc!;
    return Column(
      children: [
        32.ph,
        BlocSelector<ChangelecturerCubit, ChangelecturerState, int>(
          selector: (state) => cubit.selectedStudent,
          builder: (context, selectedStudent) {
            return BlocBuilder<MyProgramsCubit, MyProgramsState>(
              bloc: programCubit,
              builder: (context, programState) {
                var childern =
                    programCubit.getAssignedChildrenToProgramEntity?.data;

                return SizedBox(
                  height: 98.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      bool isSelected = index == selectedStudent;
                      var child = childern?[index];
                      return StudentItem(
                        onTap: () {
                          cubit.changeSelectedStudent(index);
                        },
                        name: "${child?.firstName}",
                        image: child?.image ?? "",
                        isSelected: isSelected,
                        isDoneAdded: false,
                      );
                    },
                    separatorBuilder: (context, index) => 8.pw,
                    itemCount: childern?.length ?? 0,
                  ),
                );
              },
            );
          },
        ),
        32.ph,
        Text(
          "برجاء إختيار سبب لتغير المعلم",
          style: MainTextStyle.boldTextStyle(
            fontSize: 14,
          ),
        ),
        if (cubit.selectedStudent != -1)
          BlocBuilder(
            bloc: cubit,
            builder:(context, state) =>  Text(
              "${programCubit.getAssignedChildrenToProgramEntity?.data?[cubit.selectedStudent].firstName} للطالب",
              style: MainTextStyle.boldTextStyle(
                fontSize: 14,
              ),
            ),
          ),
        20.ph,
        Expanded(
          child: BlocBuilder(
            bloc: cubit,
            builder: (context, state) => ListView.separated(
              itemBuilder: (context, index) {
                for (var i = 0; i < 4; i++) {
                  cubit.changeLecturerReason.add(false);
                }
                bool isSelcted = cubit.changeLecturerReason[index] == true;
                return TextedCheckBoxRow(
                  isSelcted: isSelcted,
                  onChanged: (value) =>
                      cubit.chooseLecturerReasons(index, value ?? false),
                  text: "سبب ${index + 1}",
                  value: cubit.changeLecturerReason[index],
                );
              },
              separatorBuilder: (context, index) => 12.ph,
              itemCount: 4,
            ),
          ),
        ),
        8.ph,
        CustomElevatedButton(
          text: lang.next,
          width: 343.w,
          radius: 16.r,
          color: MainColors.blueTextColor,
          onPressed: () {
            if (cubit.noChosenReason()) {
              customAdaptiveDialog(
                context,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: 16.cr,
                    color: MainColors.white,
                  ),
                  height: 160.h,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.iconsRejectRequest,
                      ),
                      8.ph,
                      Text(
                        "برجاء اختيار سبب تغيير المعلم",
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 15,
                          color: MainColors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              cubit.incrementBodyIndex();
            }
          },
        ),
        32.ph,
      ],
    );
  }
}
