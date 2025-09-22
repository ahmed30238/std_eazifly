import 'dart:developer';

import 'package:eazifly_student/presentation/controller/cancel_session_controller/cancelsession_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

import '../../../../data/models/sessions/get_instructor_availabilities_model.dart';

class ScheduleItem extends StatelessWidget {
  final String day;
  final String date;
  final String from;
  final String to;
  final int sessionId;
  final String state;
  final String statusLabel;
  final int index;

  const ScheduleItem({
    super.key,
    required this.date,
    required this.day,
    required this.from,
    required this.to,
    required this.sessionId,
    required this.state,
    required this.statusLabel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      height: 74.h,
      width: double.infinity,
      decoration: BoxDecoration(color: MainColors.inputFill),
      child: SizedBox(
        height: 74.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    "تاريخ المحاضرة",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 11,
                      color: MainColors.onSurfaceSecondary,
                    ),
                  ),
                  8.ph,
                  Text(
                    "$day  $date",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    "وقت المحاضرة",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 11,
                      color: MainColors.onSurfaceSecondary,
                    ),
                  ),
                  8.ph,
                  Expanded(
                    child: Text(
                      "$from الي $to ",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 12,
                        color: MainColors.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            27.pw,
            state != "pending"
                ? Text(
                    statusLabel,
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.error,
                    ),
                  )
                : EditSessionDateArea(sessionId: sessionId, index: index),
          ],
        ),
      ),
    );
  }
}

class EditSessionDateArea extends StatelessWidget {
  const EditSessionDateArea({
    super.key,
    required this.sessionId,
    required this.index,
  });

  final int sessionId;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        log("$sessionId");
        // final expireDate = context
        //     .read<MyProgramsCubit>()
        //     .getAssignedChildrenToProgramEntity
        //     ?.data?[context.read<LectureCubit>().currentUserIndex]
        //     .expireDate;

        // var read = context.read<CancelSessionCubit>();
        //
        // await read.getInstructorAvailabilities(
        //   instructorId: (int.tryParse(
        //         context
        //                 .read<MyProgramsCubit>()
        //                 .getAssignedChildrenToProgramEntity
        //                 ?.data?[index]
        //                 .nextSession
        //                 ?.instructorId ??
        //             "",
        //       )) ??
        //       -1,
        //   duration: (int.tryParse(
        //         context
        //                 .read<MyProgramsCubit>()
        //                 .getAssignedChildrenToProgramEntity
        //                 ?.data?[index]
        //                 .nextSession
        //                 ?.duration ??
        //             "",
        //       )) ??
        //       -1,
        // );
        // final availabilityData = context
        //     .read<CancelSessionCubit>()
        //     .getInstructorAvailabilitiesEntity
        //     ?.data;
        //
        // if (availabilityData == null) {
        //   // إظهار رسالة خطأ إذا لم تكن البيانات محملة
        //   customAdaptiveDialog(
        //     context,
        //     child: Container(
        //       padding: EdgeInsets.symmetric(horizontal: 16.w),
        //       decoration: BoxDecoration(
        //         borderRadius: 16.cr,
        //         color: MainColors.background,
        //       ),
        //       height: 160.h,
        //       width: double.infinity,
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           SvgPicture.asset(
        //             Assets.iconsRejectRequest,
        //           ),
        //           8.ph,
        //           Text(
        //             "لا توجد مواعيد متاحة حالياً",
        //             style: MainTextStyle.boldTextStyle(
        //               fontSize: 15,
        //               color: MainColors.error,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   );
        //   return;
        // }
        // final daysMap = {
        //   "Saturday": availabilityData.saturday,
        //   "Sunday": availabilityData.sunday,
        //   "Monday": availabilityData.monday,
        //   "Tuesday": availabilityData.tuesday,
        //   "Wednesday": availabilityData.wednesday,
        //   "Thursday": availabilityData.thursday,
        //   "Friday": availabilityData.friday,
        // };
        //
        // // تصفية الأيام التي تحتوي على بيانات فقط
        // final filteredDaysMap = Map.fromEntries(
        //   daysMap.entries
        //       .where((entry) => entry.value != null && entry.value!.isNotEmpty),
        // );
        // final daysList = filteredDaysMap.entries.toList();
        //
        // showModalSheet(
        //   isFixedSize: true,
        //   maxHeight: 323.h,
        //   minHeight: 322.h,
        //   context,
        //   widget: TimeSelectionBottomSheet(
        //     cubit: context.read<CancelSessionCubit>(),
        //     daysList: daysList,
        //     navigateToMyPrograms: false,
        //     sessionId: sessionId,
        //   ),
        // );
        showModalSheet(
          isFixedSize: true,
          maxHeight: 323.h,
          minHeight: 322.h,

          context,
          widget: ChangeTimeBottomSheetDesign(sessionId: sessionId),
        );
      },
      child: Text(
        "تعديل الموعد",
        style: MainTextStyle.boldTextStyle(
          fontSize: 12,
          color: MainColors.primary,
        ),
      ),
    );
  }
}

class ChangeTimeBottomSheetDesign extends StatefulWidget {
  final int sessionId;

  const ChangeTimeBottomSheetDesign({super.key, required this.sessionId});

  @override
  State<ChangeTimeBottomSheetDesign> createState() =>
      _ChangeTimeBottomSheetDesignState();
}

class _ChangeTimeBottomSheetDesignState
    extends State<ChangeTimeBottomSheetDesign> {
  late CancelSessionCubit cubit;
  late LectureCubit lectureCubit;

  @override
  void initState() {
    cubit = context.read<CancelSessionCubit>();
    lectureCubit = context.read<LectureCubit>();
    final nextSession = context
        .read<MyProgramsCubit>()
        .getAssignedChildrenToProgramEntity
        ?.data?[lectureCubit.currentUserIndex]
        .nextSession;
    cubit.getInstructorAvailabilities(
      instructorId: (int.tryParse(nextSession?.instructorId ?? "")) ?? -1,
      duration: (int.tryParse(nextSession?.duration ?? "")) ?? -1,
      context: context,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CancelSessionCubit, CancelSessionState>(
      builder: (context, state) {
        final availabilityData = cubit.getInstructorAvailabilitiesEntity?.data;
        if (cubit.getInstructorAvailabilitiesLoader ||
            availabilityData == null) {
          return const CircularProgressIndicator();
        }
        return CustomBottomSheetDesign(
          widget: Column(
            children: [
              16.ph,
              Text(
                "برجاء تحديد الموعد الجديد",
                style: MainTextStyle.boldTextStyle(fontSize: 14),
              ),
              32.ph,
              // Day Dropdown
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Text(
                      "اليوم",
                      style: MainTextStyle.boldTextStyle(fontSize: 12),
                    ),
                    8.pw,
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          final expireDate = context
                              .read<MyProgramsCubit>()
                              .getAssignedChildrenToProgramEntity
                              ?.data?[lectureCubit.currentUserIndex]
                              .expireDate;
                          final selectedDay = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: expireDate!,
                            selectableDayPredicate: (day) {
                              // الأيام اللي راجعة من الـ API
                              final availableDays = dayList(
                                context,
                              ).map((entry) => entry.key).toList();

                              // نحول weekday (int) لاسم اليوم
                              final dayName = weekdayToName(day.weekday);

                              // هنرجع true لو اليوم موجود في الأيام المسموحة
                              return availableDays.contains(dayName);
                            },
                          );

                          cubit.changeSpecifiedDay(selectedDay.toString());
                        },
                        child: CustomTextFormField(
                          controller: cubit.dayController,
                          hintText: cubit.specifiedDay.isEmpty
                              ? "اليوم"
                              : cubit.specifiedDay.substring(0, 10),
                          enabled: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              20.ph,
              // Time Dropdown
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Text(
                      "الوقت",
                      style: MainTextStyle.boldTextStyle(fontSize: 12),
                    ),
                    8.pw,
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          // لو مفيش يوم مختار من المستخدم
                          log("spec day ${cubit.specifiedDay}");
                          if (cubit.specifiedDay.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("برجاء اختيار اليوم أولاً"),
                              ),
                            );
                            return;
                          }

                          // دور على الساعات الخاصة باليوم المختار
                          final selectedDayEntry = dayList(context).firstWhere((
                            entry,
                          ) {
                            log(entry.key);
                            final String dayAsString = weekdayToName(
                              DateTime.tryParse(cubit.specifiedDay)?.weekday ??
                                  0,
                            );
                            log("dayAsString $dayAsString");
                            log("bool val ${dayAsString == entry.key}");
                            return entry.key == dayAsString;
                          });

                          final times = selectedDayEntry.value ?? [];

                          // افتح Dialog بالساعات
                          final selectedTime = await showDialog<String>(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                title: const Text("اختر الوقت"),
                                content: SizedBox(
                                  width: double.maxFinite,
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2, // عدد الأعمدة
                                          crossAxisSpacing: 8,
                                          mainAxisSpacing: 8,
                                          childAspectRatio:
                                              2.5, // شكل المربع (عرض × طول)
                                        ),
                                    itemCount: times.length,
                                    itemBuilder: (context, index) {
                                      final time = times[index];
                                      final displayText =
                                          "${time.startTime} - ${time.endTime}";
                                      return ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: MainColors.primary,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          final dayName = weekdayToName(
                                            DateTime.tryParse(
                                                  cubit.specifiedDay,
                                                )?.weekday ??
                                                0,
                                          );

                                          cubit.saveSelectedScheduleData(
                                            dayName: dayName,
                                            timeSlotData: time,
                                          );
                                          Navigator.pop(context, displayText);
                                        },
                                        child: Text(
                                          displayText,
                                          style: MainTextStyle.boldTextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          );

                          // لو اختار وقت نحطه في الـ Controller
                          if (selectedTime != null) {
                            cubit.timeController.text = selectedTime;
                          }
                        },
                        child: AbsorbPointer(
                          child: CustomTextFormField(
                            controller: cubit.timeController,
                            hintText: cubit.timeController.text.isEmpty
                                ? "اختر الوقت"
                                : cubit.timeController.text,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              BlocBuilder<CancelSessionCubit, CancelSessionState>(
                builder: (context, state) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: CustomElevatedButton(
                      radius: 16.r,
                      text: "تحديد موعد جديد",
                      color: MainColors.primary,
                      onPressed: () {
                        // if (cubit.specifiedDay.isNotEmpty &&
                        //     cubit.timeController.text.isNotEmpty) {
                        //   cubit.changeSessionDate(sessionId: widget.sessionId);
                        // }
                        _confirmSelection(
                          context,
                          cubit: cubit,
                          lectureCubit: lectureCubit,
                          sessionId: widget.sessionId,
                          navigateToMyPrograms: false,
                        );
                      },
                      child: cubit.changeSessionDateLoader
                          ? const CircularProgressIndicator.adaptive()
                          : null,
                    ),
                  );
                },
              ),
              16.ph,
            ],
          ),
        );
      },
    );
  }
}

List<MapEntry<String, List<GetInstructorAvailabilitieDayModel>?>> dayList(
  BuildContext context,
) {
  final availabilityData = context
      .read<CancelSessionCubit>()
      .getInstructorAvailabilitiesEntity
      ?.data;
  final daysMap = {
    "Saturday": availabilityData?.saturday,
    "Sunday": availabilityData?.sunday,
    "Monday": availabilityData?.monday,
    "Tuesday": availabilityData?.tuesday,
    "Wednesday": availabilityData?.wednesday,
    "Thursday": availabilityData?.thursday,
    "Friday": availabilityData?.friday,
  };

  // تصفية الأيام التي تحتوي على بيانات فقط
  final filteredDaysMap = Map.fromEntries(
    daysMap.entries.where(
      (entry) => entry.value != null && entry.value!.isNotEmpty,
    ),
  );
  final daysList = filteredDaysMap.entries.toList();
  return daysList;
}

String weekdayToName(int weekday) {
  switch (weekday) {
    case DateTime.saturday:
      return "Saturday";
    case DateTime.sunday:
      return "Sunday";
    case DateTime.monday:
      return "Monday";
    case DateTime.tuesday:
      return "Tuesday";
    case DateTime.wednesday:
      return "Wednesday";
    case DateTime.thursday:
      return "Thursday";
    case DateTime.friday:
      return "Friday";
    default:
      return "";
  }
}

bool _canConfirmSelection(CancelSessionCubit cubit) {
  return cubit.specifiedDay.isNotEmpty &&
      cubit.timeController.text.isNotEmpty &&
      !cubit.changeSessionDateLoader;
}

Future<void> _confirmSelection(
  BuildContext context, {
  required CancelSessionCubit cubit,
  required LectureCubit lectureCubit,
  required int sessionId,
  required bool navigateToMyPrograms,
}) async {
  if (!_canConfirmSelection(cubit)) return;

  log("=== Final Selection Details ===");
  log("Selected Day Name: ${cubit.selectedDayName}");
  log("Selected Time: ${cubit.timeController.text}");
  log("Full Date: ${cubit.selectedTimeSlotData.fullDate}");
  log("===============================");

  try {
    // التحقق من وجود fullDate
    if (cubit.selectedTimeSlotData.fullDate == null ||
        cubit.selectedTimeSlotData.fullDate.toString().isEmpty) {
      throw Exception("التاريخ غير متاح للوقت المحدد");
    }

    // التحقق من اكتمال البيانات
    if (cubit.isScheduleDataComplete()) {
      // استدعاء تغيير موعد الجلسة
      await cubit.changeSessionDate(sessionId: sessionId);

      if (!context.mounted) return;

      if (navigateToMyPrograms) {
        Navigator.pushReplacementNamed(context, RoutePaths.layoutPath);
      } else {
        // حفظ المعلومات المطلوبة قبل استخدام context
        final userId = lectureCubit.userId;
        final programId = lectureCubit.currentProgramId;

        back(context);

        // استدعاء getProgramSessions
        lectureCubit.getProgramSessions(programId: programId, userId: userId);
      }
    } else {
      throw Exception("البيانات غير مكتملة");
    }
  } catch (e) {
    log("Error saving selection: $e");

    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("حدث خطأ في حفظ البيانات: ${e.toString()}"),
        backgroundColor: Colors.red,
      ),
    );
  }
}
