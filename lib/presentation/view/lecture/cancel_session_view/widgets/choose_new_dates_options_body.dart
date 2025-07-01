import 'dart:developer';

import 'package:eazifly_student/core/component/custom_drop_down.dart';
import 'package:eazifly_student/presentation/controller/cancel_session_controller/cancelsession_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ChooseNewDatesOptionsBody extends StatelessWidget {
  const ChooseNewDatesOptionsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CancelSessionCubit>();
    var lang = context.loc!;
    return Column(
      children: [
        75.5.ph,
        Expanded(
          child: BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              return Column(
                children: [
                  TextedCheckBoxRow(
                    isSelcted: cubit.chooseNewDateOption,
                    onChanged: (value) => cubit.toggleChooseNewDateOption(),
                    text: "تحديد موعد جديد للمحاضرة",
                    value: cubit.chooseNewDateOption,
                  ),
                  12.ph,
                  TextedCheckBoxRow(
                    isSelcted: cubit.cancelSession,
                    onChanged: (value) => cubit.toggleCancelSession(),
                    text: "الغاء المحاضرة",
                    value: cubit.cancelSession,
                  ),
                  const Spacer(),
                  CustomElevatedButton(
                    text: lang.next,
                    width: 343.w,
                    radius: 16.r,
                    color: MainColors.blueTextColor,
                    onPressed: () async {
                      if (!cubit.chooseNewDateOption && !cubit.cancelSession) {
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
                                  "برجاء الاختيار احدي الخيارات المتاحة",
                                  style: MainTextStyle.boldTextStyle(
                                    fontSize: 15,
                                    color: MainColors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else if (cubit.chooseNewDateOption) {
                        final availabilityData =
                            cubit.getInstructorAvailabilitiesEntity?.data;

                        if (availabilityData == null) {
                          // إظهار رسالة خطأ إذا لم تكن البيانات محملة
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
                                    "لا توجد مواعيد متاحة حالياً",
                                    style: MainTextStyle.boldTextStyle(
                                      fontSize: 15,
                                      color: MainColors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                          return;
                        }

                        final daysMap = {
                          "Saturday": availabilityData.saturday,
                          "Sunday": availabilityData.sunday,
                          "Monday": availabilityData.monday,
                          "Tuesday": availabilityData.tuesday,
                          "Wednesday": availabilityData.wednesday,
                          "Thursday": availabilityData.thursday,
                          "Friday": availabilityData.friday,
                        };

                        // تصفية الأيام التي تحتوي على بيانات فقط
                        final filteredDaysMap = Map.fromEntries(
                          daysMap.entries.where((entry) =>
                              entry.value != null && entry.value!.isNotEmpty),
                        );

                        if (filteredDaysMap.isEmpty) {
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
                                    "لا توجد أيام متاحة للحجز",
                                    style: MainTextStyle.boldTextStyle(
                                      fontSize: 15,
                                      color: MainColors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                          return;
                        }

                        final daysList = filteredDaysMap.entries.toList();

                        showModalSheet(
                          context,
                          isFixedSize: true,
                          maxHeight: 314.h,
                          minHeight: 312.h,
                          widget: _TimeSelectionBottomSheet(
                              daysList: daysList, cubit: cubit),
                        );
                      } else {
                        cubit.postCancelSession(context);
                        log("Cancel Session");
                      }
                    },
                  ),
                  32.ph,
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

// فصل الـ BottomSheet في StatefulWidget منفصل مع تحسينات
class _TimeSelectionBottomSheet extends StatefulWidget {
  final List<MapEntry<String, dynamic>> daysList;
  final CancelSessionCubit cubit;

  const _TimeSelectionBottomSheet({
    required this.daysList,
    required this.cubit,
  });

  @override
  State<_TimeSelectionBottomSheet> createState() =>
      _TimeSelectionBottomSheetState();
}

class _TimeSelectionBottomSheetState extends State<_TimeSelectionBottomSheet> {
  MapEntry<String, dynamic>? selectedDay;
  dynamic selectedTimeSlot;

  @override
  void initState() {
    super.initState();
    // طباعة البيانات المتاحة للتحقق
    log("Available days: ${widget.daysList.length}");
    for (var day in widget.daysList) {
      log("Day: ${day.key}, Slots: ${day.value?.length ?? 0}");
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  child: CustomizedDropdownWidget<MapEntry<String, dynamic>>(
                    key: ValueKey(
                        "day_dropdown_${DateTime.now().millisecondsSinceEpoch}"),
                    validator: (val) =>
                        val == null ? "من فضلك اختر اليوم" : null,
                    hintText: widget.daysList.isNotEmpty
                        ? "اختر اليوم"
                        : "لا توجد أيام متاحة",
                    initialValue: selectedDay,
                    onChanged: (val) {
                      log("Day selection changed: ${val?.key}");
                      setState(() {
                        selectedDay = val;
                        selectedTimeSlot = null; // إعادة تعيين الوقت
                      });

                      if (val != null) {
                        log("Selected day: ${val.key}");

                        // طباعة الأوقات المتاحة للتحقق
                        if (val.value != null && val.value is List) {
                          final timeSlots = val.value as List;
                          log("Available time slots for ${val.key}: ${timeSlots.length} slots");
                          for (int i = 0; i < timeSlots.length; i++) {
                            var slot = timeSlots[i];
                            log("Time slot $i: ${slot?.startTime} - ${slot?.endTime}");
                          }
                        } else {
                          log("No time slots available for ${val.key}");
                        }
                      }
                    },
                    items: widget.daysList
                        .map(
                          (e) => DropdownMenuItem<MapEntry<String, dynamic>>(
                            value: e,
                            child: Text(
                              e.key,
                              style:
                                  MainTextStyle.regularTextStyle(fontSize: 12),
                            ),
                          ),
                        )
                        .toList(),
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
                  child: CustomizedDropdownWidget<dynamic>(
                    controller: widget.cubit.timeController,
                    key: ValueKey(
                        "time_dropdown_${selectedDay?.key}_${DateTime.now().millisecondsSinceEpoch}"),
                    validator: (val) =>
                        val == null ? "من فضلك اختر الوقت" : null,
                    hintText: _getTimeHintText(),
                    initialValue: selectedTimeSlot,
                    onChanged: selectedDay != null
                        ? (val) {
                            log("Time selection changed: ${val?.startTime} - ${val?.endTime}");
                            setState(() {
                              selectedTimeSlot = val;
                              widget.cubit.timeController.text =
                                  val.toString().substring(0, 4);
                            });

                            if (val != null) {
                              log("Selected time: ${val.startTime} - ${val.endTime}");
                            }
                          }
                        : null,
                    items: _getTimeSlotItems(),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomElevatedButton(
              radius: 16.r,
              text: "تحديد موعد جديد",
              color: MainColors.blueTextColor,
              onPressed: _canConfirmSelection()
                  ? () => _confirmSelection(context)
                  : () {},
            ),
          ),
          16.ph,
        ],
      ),
    );
  }

  String _getTimeHintText() {
    if (selectedDay == null) {
      return "اختر اليوم أولاً";
    }

    final timeSlots = selectedDay!.value as List?;
    if (timeSlots == null || timeSlots.isEmpty) {
      return "لا توجد أوقات متاحة";
    }

    return "اختر الوقت";
  }

  List<DropdownMenuItem<dynamic>> _getTimeSlotItems() {
    if (selectedDay == null) {
      return [];
    }

    final timeSlots = selectedDay!.value as List?;
    if (timeSlots == null || timeSlots.isEmpty) {
      log("No time slots available for selected day");
      return [];
    }

    log("Building dropdown items for ${timeSlots.length} time slots");
    return timeSlots
        .where((slot) => slot != null) // تصفية القيم الفارغة
        .map(
      (timeSlot) {
        String displayText = "${timeSlot.startTime} - ${timeSlot.endTime}";
        log("Creating dropdown item: $displayText");
        return DropdownMenuItem<dynamic>(
          value: timeSlot,
          child: Text(
            displayText,
            style: MainTextStyle.regularTextStyle(fontSize: 12),
          ),
        );
      },
    ).toList();
  }

  bool _canConfirmSelection() {
    return selectedDay != null && selectedTimeSlot != null;
  }

  void _confirmSelection(BuildContext context) {
    if (!_canConfirmSelection()) return;

    log("=== Final Selection Details ===");
    log("Selected Day: ${selectedDay!.key}");
    log("Selected Time Slot:");
    log("  - Start Time: ${selectedTimeSlot.startTime}");
    log("  - End Time: ${selectedTimeSlot.endTime}");
    log("  - Full Date: ${selectedTimeSlot.fullDate}");
    // log("  - ID: ${selectedTimeSlot.id}");
    log("===============================");

    try {
      // التحقق من وجود fullDate قبل الحفظ
      if (selectedTimeSlot.fullDate == null ||
          selectedTimeSlot.fullDate.toString().isEmpty) {
        throw Exception("التاريخ غير متاح للوقت المحدد");
      }

      // استخدام الدالة المحسنة لحفظ البيانات
      widget.cubit.saveSelectedScheduleData(
        dayName: selectedDay!.key,
        timeSlotData: selectedTimeSlot,
      );

      // التحقق من اكتمال البيانات
      if (widget.cubit.isScheduleDataComplete()) {
        // طباعة البيانات النهائية قبل الإرسال
        log("=== Data Ready for API Call ===");
        log("Day: ${widget.cubit.dayController.text}");
        log("Time: ${widget.cubit.timeController.text}");
        log("Selected Day Name: ${widget.cubit.selectedDayName}");
        log("Full Date: ${widget.cubit.selectedTimeSlotData.fullDate}");
        log("==============================");

        // استدعاء تغيير موعد الجلسة
        widget.cubit.changeSessionDate(sessionId: 1);

        // إغلاق الـ BottomSheet
        Navigator.pop(context);
      } else {
        throw Exception("البيانات غير مكتملة");
      }
    } catch (e) {
      log("Error saving selection: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("حدث خطأ في حفظ البيانات: ${e.toString()}"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
