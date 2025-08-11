import 'package:eazifly_student/core/enums/week_days.dart';
import 'package:eazifly_student/presentation/controller/group_program_management_controller/grouppackagemanagement_cubit.dart';
import 'package:eazifly_student/presentation/view/group_package_management_view/widgets/repeated_weekly_session.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/widgets/bottom_sheet_day_controller.dart';
import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/lecturer_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class SpecifyAllSessionsDates extends StatelessWidget {
  final int programId;
  const SpecifyAllSessionsDates({
    super.key,
    required this.programId,
  });

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return BlocBuilder<GrouppackagemanagementCubit,
        GrouppackagemanagementState>(
      builder: (context, state) {
        var cubit = context.read<GrouppackagemanagementCubit>();
        int numberOfSessions =
            cubit.getOrderDetailsEntity?.data?.numberOfSessions ?? 0;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: numberOfSessions,
                separatorBuilder: (context, index) => 10.ph,
                itemBuilder: (context, sessionIndex) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      16.ph,
                      Text(
                        "حصة ${sessionIndex + 1}",
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 14,
                          color: MainColors.primary,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "اليوم",
                            style: MainTextStyle.boldTextStyle(
                              fontSize: 12,
                            ),
                          ),
                          16.pw,
                          Expanded(
                            child: InkWell(
                              onTap: () => showModalSheet(
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
                                              cubit.changeSpecifiedAllDay(
                                                context,
                                                WeekDaysEnum
                                                    .values[index].title,
                                                sessionIndex,
                                                programId,
                                              );
                                              back(context);
                                            },
                                            day: WeekDaysEnum
                                                .values[index].title,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              child: CustomTextFormField(
                                controller: sessionIndex <
                                        cubit.specifyAlldayController.length
                                    ? cubit
                                        .specifyAlldayController[sessionIndex]
                                    : null,
                                enabled: false,
                                hintText: "اختر",
                                suffixIconWidget: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                  ),
                                  child: SvgPicture.asset(
                                    Assets.iconsCalender,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      12.ph,
                      Row(
                        children: [
                          Text(
                            "من",
                            style: MainTextStyle.boldTextStyle(fontSize: 12),
                          ),
                          16.pw,
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                // التأكد من وجود controller قبل استدعاء الدالة
                                if (sessionIndex <
                                    cubit.fromControllers.length) {
                                  cubit.showFromTimePickerDialog(
                                      context, sessionIndex, programId);
                                }
                              },
                              child: CustomTextFormField(
                                controller:
                                    sessionIndex < cubit.fromControllers.length
                                        ? cubit.fromControllers[sessionIndex]
                                        : null, // ربط من controller
                                enabled: false,
                                keyboardType: TextInputType.datetime,
                                hintText: "اختر وقت البداية",
                                suffixIconWidget: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Icon(
                                    Icons.access_time,
                                    color: MainColors.onSurfaceSecondary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          15.5.pw,
                          Text(
                            "الي",
                            style: MainTextStyle.boldTextStyle(fontSize: 12),
                          ),
                          16.pw,
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                // التأكد من وجود controller قبل استدعاء الدالة
                                if (sessionIndex < cubit.toControllers.length) {
                                  cubit.showToTimePickerDialog(
                                      context, sessionIndex, programId);
                                }
                              },
                              child: CustomTextFormField(
                                controller:
                                    sessionIndex < cubit.toControllers.length
                                        ? cubit.toControllers[sessionIndex]
                                        : null, // ربط إلى controller
                                enabled: false,
                                keyboardType: TextInputType.datetime,
                                hintText: "اختر وقت النهاية",
                                suffixIconWidget: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Icon(
                                    Icons.access_time,
                                    color: MainColors.onSurfaceSecondary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            if (cubit.specifiedDates.isNotEmpty) ...[
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
            ],
          ],
        );
      },
    );
  }
}
