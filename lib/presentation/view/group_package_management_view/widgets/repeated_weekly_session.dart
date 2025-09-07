import 'package:eazifly_student/core/enums/week_days.dart';
import 'package:eazifly_student/presentation/controller/group_program_management_controller/grouppackagemanagement_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/widgets/bottom_sheet_day_controller.dart';
import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/lecturer_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:shimmer/shimmer.dart';

class RepeatedWeeklySession extends StatelessWidget {
  final int programId;

  const RepeatedWeeklySession({super.key, required this.programId});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<GrouppackagemanagementCubit>();
    int numberOfSessionPerWeek =
        int.tryParse(
          cubit.getOrderDetailsEntity?.data?.numberOfSessionPerWeek ?? "0",
        ) ??
        0;
    var lang = context.loc!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // تأكد من وجود جلسات قبل إنشاء الـ Form
        if (numberOfSessionPerWeek > 0) ...[
          // استخدام Flexible بدلاً من Expanded
          Flexible(
            child: Form(
              key: cubit.repeatedFormKey,
              child: ListView.separated(
                shrinkWrap: true,
                // مهم: للسماح للـ ListView بأخذ المساحة المطلوبة فقط
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
                                        ...List.generate(7, (index) {
                                          return BottomSheetDayContainer(
                                            onTap: () {
                                              cubit.changeSpecifiedDay(
                                                WeekDaysEnum
                                                    .values[index]
                                                    .title,
                                                sessionIndex,
                                              );
                                              Navigator.of(context).pop();
                                            },
                                            day: WeekDaysEnum
                                                .values[index]
                                                .title,
                                          );
                                        }),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: CustomTextFormField(
                              controller:
                                  sessionIndex < cubit.dayController.length
                                  ? cubit.dayController[sessionIndex]
                                  : null,
                              hintText: "اليوم",
                              validator: customValidation,
                              enabled: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                    16.ph,
                    BlocBuilder<
                      GrouppackagemanagementCubit,
                      GrouppackagemanagementState
                    >(
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
                                  cubit.showTimePickerDialog(
                                    context,
                                    sessionIndex,
                                    programId,

                                  );
                                },
                                child: AbsorbPointer(
                                  child: CustomTextFormField(
                                    onFieldSubmitted: (p0) {
                                      cubit.addWeeklyAppointments(context);
                                    },
                                    hintText:
                                        sessionIndex <
                                            cubit.selectedTimes.length
                                        ? cubit.selectedTimes[sessionIndex]
                                        : "24 ساعة",
                                    enabled: false,
                                    validator: customValidation,
                                    controller:
                                        sessionIndex <
                                            cubit.hoursControllers.length
                                        ? cubit.hoursControllers[sessionIndex]
                                        : null,
                                    suffixIconWidget: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16.w,
                                      ),
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
          ),
        ] else ...[
          // في حالة عدم وجود جلسات
          SizedBox(
            height: 200.h, // إعطاء ارتفاع ثابت
            child: const Center(
              child: Text(
                "لا توجد جلسات محددة",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ),
        ],
        16.ph,
        if (cubit.addWeeklyAppontmentsEntity != null) ...[
          Text(
            lang.chooseAppropriateLecturer,
            style: MainTextStyle.boldTextStyle(fontSize: 12),
          ),
          8.ph,
          //! Instructors
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              // Handle loading state
              if (cubit.getInstructorsLoader ||
                  cubit.getInstructorsEntity == null) {
                return SizedBox(height: 48.h, child: buildShimmerLoader());
              }

              // Handle error state
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
                if (cubit.requestTofindInstructorLoader) {
                  return SizedBox(
                    height: 48.h,
                    child: const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  );
                }
                return SizedBox(
                  height: 48.h,
                  child: Center(
                    child: CustomRichText(
                      text1Style: MainTextStyle.boldTextStyle(
                        fontSize: 14,
                        color: MainColors.error,
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
                        cubit.findInstructor(
                          context: context,
                          programId: programId.toString(),
                        );
                      },
                    ),
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
        ],
        16.ph,
        BlocBuilder(
          bloc: cubit,
          builder: (context, state) => CustomElevatedButton(
            text: "إضافة طالب للبرنامج",
            color: MainColors.primary,
            height: 48.h,
            width: 343.w,
            radius: 16.r,
            onPressed: cubit.createMeetingSessionsLoader
                ? () {} // تعطيل الزر أثناء التحميل
                : () {
                    // التحقق من صحة النموذج فقط إذا كان هناك جلسات
                    if (numberOfSessionPerWeek > 0 &&
                        !cubit.repeatedFormKey.currentState!.validate()) {
                      return;
                    }

                    if (cubit.getInstructorsEntity?.data != null &&
                        cubit.getInstructorsEntity!.data!.isNotEmpty) {
                      cubit.createMeetingSessions(context);
                    } else {
                      delightfulToast(message: "غير متوفر", context: context);
                    }
                  },
            child: cubit.createMeetingSessionsLoader
                ? const CircularProgressIndicator.adaptive()
                : null,
          ),
        ),
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
