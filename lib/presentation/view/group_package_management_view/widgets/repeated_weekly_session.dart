import 'package:eazifly_student/core/enums/week_days.dart';
import 'package:eazifly_student/presentation/controller/group_program_management_controller/grouppackagemanagement_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/widgets/bottom_sheet_day_controller.dart';
import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/lecturer_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:shimmer/shimmer.dart';

class RepeatedWeeklySession extends StatelessWidget {
  // final int numberOfSessionsPerWeek;
  const RepeatedWeeklySession({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<GrouppackagemanagementCubit>();
    int numberOfSessionPerWeek = int.tryParse(
          cubit.getOrderDetailsEntity?.data?.numberOfSessionPerWeek ?? "0",
        ) ??
        0;
    var lang = context.loc!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, sessionIndex) => Column(
              children: [
                16.ph,
                Row(
                  children: [
                    Text(
                      "اليوم",
                      style: MainTextStyle.boldTextStyle(fontSize: 12),
                    ),
                    8.pw,
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          showModalSheet(
                            isFixedSize: true,
                            minHeight: 400.h,
                            maxHeight: 401.h,
                            context,
                            widget: BlocProvider.value(
                              value: cubit,
                              child: CustomBottomSheetDesign(
                                radius: 16.r,
                                widget: Column(
                                  children: [
                                    24.ph,
                                    ...List.generate(
                                      7,
                                      (index) => BottomSheetDayContainer(
                                        onTap: () {
                                          cubit.changeSpecifiedDay(
                                            WeekDaysEnum.values[index].title,
                                            sessionIndex,
                                          );
                                          back(context);
                                        },
                                        day: WeekDaysEnum.values[index].title,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: CustomTextFormField(
                          controller: cubit.dayController[sessionIndex],
                          hintText: "السبت",
                          enabled: false,
                        ),
                      ),
                    ),
                  ],
                ),
                16.ph,
                BlocBuilder<GrouppackagemanagementCubit,
                    GrouppackagemanagementState>(
                  builder: (context, state) {
                    final cubit = GrouppackagemanagementCubit.get(context);

                    return Row(
                      children: [
                        Text(
                          "الموعد",
                          style: MainTextStyle.boldTextStyle(fontSize: 12),
                        ),
                        8.pw,
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // إرسال الـ sessionIndex للدالة
                              cubit.showTimePickerDialog(context, sessionIndex);
                              // الدالة ستتنادى تلقائياً من الـ Cubit
                            },
                            child: AbsorbPointer(
                              child: CustomTextFormField(
                                onFieldSubmitted: (p0) {
                                  if (sessionIndex == numberOfSessionPerWeek) {
                                    cubit.addWeeklyAppointments();
                                  }
                                },
                                // عرض الوقت المحدد لهذا الـ session
                                hintText:
                                    sessionIndex < cubit.selectedTimes.length
                                        ? cubit.selectedTimes[sessionIndex]
                                        : "24 ساعة",
                                enabled: false,
                                controller:
                                    cubit.hoursControllers[sessionIndex],
                                suffixIconWidget: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: const Icon(
                                    Icons.access_time,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
            separatorBuilder: (context, index) => 16.ph,
            itemCount: numberOfSessionPerWeek,
          ),
        ),
        16.ph,
        if (cubit.addWeeklyAppontmentsEntity != null) ...[
          Text(
            lang.chooseAppropriateLecturer,
            style: MainTextStyle.boldTextStyle(
              fontSize: 12,
            ),
          ),
          8.ph,
          //! Instrcutors
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              // Handle loading state
              if (cubit.getInstructorsLoader ||
                  cubit.getInstructorsEntity == null) {
                return SizedBox(
                  height: 48.h,
                  child: buildShimmerLoader(),
                );
              }

              // Handle error state (optional)
              if (state is GetInstructorsErrorState) {
                return SizedBox(
                  height: 48.h,
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
                return SizedBox(
                  height: 48.h,
                  child: const Center(
                    child: Text('No instructors available'),
                  ),
                );
              }

              return SizedBox(
                height: 48.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    bool isSelected = cubit.selectedLecturerIndex == index;
                    var instructor = instructors[index];
                    return InkWell(
                      onTap: () {
                        cubit.changeLecturerIndex(index);
                      },
                      child: LecturerItem(
                        image: instructor.image ?? "",
                        instructorName: instructor.nameAr ?? "",
                        isSelected: isSelected,
                      ),
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
        ]
      ],
    );
  }
}

Widget buildShimmerLoader() {
  return ListView.separated(
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: 80.w,
          height: 48.h,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      );
    },
    separatorBuilder: (context, index) => 8.pw,
    itemCount: 5, // Show 5 shimmer items
  );
}
