import 'package:eazifly_student/presentation/controller/change_lecturer_controller/changelecturer_cubit.dart';
import 'package:eazifly_student/presentation/controller/change_lecturer_controller/changelecturer_state.dart';
import 'package:eazifly_student/presentation/view/group_package_management_view/widgets/repeated_weekly_session.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/add_new_student_data_view/widgets/choose_teacher_body.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ChooseProperLecturerBody extends StatelessWidget {
  const ChooseProperLecturerBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ChangelecturerCubit>();
    // var lang = context.loc!;
    return Column(
      children: [
        44.ph,
        SizedBox(
          height: 36.h,
          child: Text(
            "برجاء تحديد المحاضر المناسب",
            style: MainTextStyle.boldTextStyle(
              fontSize: 14,
            ),
          ),
        ),
        28.ph,
        // SizedBox(
        //   height: 157.h,
        //   child: ListView.separated(
        //     scrollDirection: Axis.horizontal,
        //     itemBuilder: (context, index) {
        //       bool isSelected = cubit.selectedLecturerIndex == index;
        //       return SuggestedTeachersItem(
        //         image: "",
        //         instructorName: "",
        //         isSelected: isSelected,
        //         blured: false,
        //         onTap: () {
        //           cubit.changeLecturerIndex(index);
        //         },
        //       );
        //     },
        //     separatorBuilder: (context, index) => 16.pw,
        //     itemCount: 5,
        //   ),
        // ),
        // if (cubit.getRemainingProgramSessionsEntity != null)
        // Text(
        //   lang.chooseAppropriateLecturer,
        //   style: MainTextStyle.boldTextStyle(
        //     fontSize: 12,
        //   ),
        // ),
        // 8.ph,
        //! Instrcutors
        BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            // Handle loading state
            if (cubit.getInstructorsLoader

                // cubit.getInstructorsEntity == null
                ) {
              return SizedBox(
                height: 130.h,
                child: buildShimmerLoader(),
              );
            }

            // Handle error state (optional)
            if (state is GetInstructorsErrorState) {
              return SizedBox(
                height: 130.h,
                child: const Center(
                  child: Text(
                    'Error loading instructors',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              );
            }

            // Handle success state with data
            var instructors = cubit.getInstructorsEntity?.data;

            // Handle empty data
            if (instructors == null || instructors.isEmpty) {
              if (cubit.requestTofindInstructorLoader) {
                return const CircularProgressIndicator.adaptive();
              }
              return SizedBox(
                height: 130.h,
                child: Center(
                  child: CustomRichText(
                    text1Style: MainTextStyle.boldTextStyle(
                      fontSize: 14,
                      color: MainColors.onError,
                    ),
                    spaceText: "   ",
                    text1:
                        "لا يوجد معلمين متوفرين في هذا الوقت برجاء اختيار مواعيد اخري او ارسال طلب لتوفير معلمين في هذا الوقت",
                    text2: "ارسال طلب ",
                    text2Style: MainTextStyle.boldTextStyle(
                      fontSize: 14,
                      color: MainColors.primary,
                    ),
                    onText2Tap: () {
                      cubit.findInstructor(context: context);
                    },
                  ),
                  // Text(

                  // ),
                ),
              );
            }
            if (instructors.length == 1) {
              var instructor = instructors.first;
              return SuggestedTeachersItem(
                specializations: instructor.specializations
                        ?.map(
                          (e) => e.name ?? "",
                        )
                        .toList() ??
                    [],
                onTap: () {
                  cubit.changeLecturerIndex(0);
                },
                isSelected: true,
                image: instructor.image ?? "",
                instructorName: instructor.nameAr ?? "",
                blured: false,
              );
            }

            return SizedBox(
              height: 130.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  bool isSelected = cubit.selectedLecturerIndex == index;
                  var instructor = instructors[index];

                  return SuggestedTeachersItem(
                    specializations: instructor.specializations
                            ?.map(
                              (e) => e.name ?? "",
                            )
                            .toList() ??
                        [],
                    onTap: () {
                      cubit.changeLecturerIndex(index);
                    },
                    isSelected: isSelected,
                    image: instructor.image ?? "",
                    instructorName: instructor.nameAr ?? "",
                    blured: false,
                  );
                },
                separatorBuilder: (context, index) => 8.pw,
                itemCount: instructors.length,
              ),
            );
          },
        ),
        // BlocBuilder(
        //   bloc: cubit,
        //   builder: (context, state) => CustomElevatedButton(
        //     text: cubit.stepperIndex == 1 ? lang.next : "بدء البرامج",
        //     color: MainColors.blueTextColor,
        //     height: 48.h,
        //     width: 343.w,
        //     radius: 16.r,
        //     onPressed: cubit.stepperIndex == 1
        //         ? () {
        //             cubit.incrementStepperIndex(context);
        //             cubit.fillAddedChildrenData();
        //           }
        //         : () {
        //             cubit.createMeetingSessions();
        //           },
        //   ),
        // ),

        const Spacer(),
        32.ph,
        BlocBuilder(
          bloc: cubit,
          builder: (context, state) => CustomElevatedButton(
            radius: 16.r,
            width: 343.w,
            height: 48.w,
            color: MainColors.primary,
            text: "التالي",
            onPressed: cubit.changeInstructorLoader
                ? () {}
                : () async {
                    await cubit.changeInstructor(context);
                  },
            child: cubit.changeInstructorLoader
                ? const CircularProgressIndicator.adaptive()
                : null,
          ),
        ),
        32.ph,
      ],
    );
  }
}
