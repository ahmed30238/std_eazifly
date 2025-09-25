import 'dart:developer';

import 'package:eazifly_student/presentation/controller/cancel_session_controller/cancelsession_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

import '../../helper_functions.dart';

class SpecifyTimeslotWidget extends StatelessWidget {
  final LectureCubit lectureCubit;
  final CancelSessionCubit cubit;
  final BuildContext mainContext;

  const SpecifyTimeslotWidget({
    super.key,
    required this.mainContext,
    required this.lectureCubit,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Text("الوقت", style: MainTextStyle.boldTextStyle(fontSize: 12)),
          8.pw,
          Expanded(
            child: GestureDetector(
              onTap: () async {
                log("spec day ${cubit.dayController.text}");
                if (cubit.dayController.text.isEmpty) {
                  delightfulToast(
                    message: "برجاء اختيار اليوم أولاً",
                    context: mainContext,
                  );
                  return;
                }

                final selectedDayEntry = dayList(context).firstWhere((entry) {
                  log(entry.key);
                  final String dayAsString = cubit.dayController.text;

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
                      shape: RoundedRectangleBorder(borderRadius: 16.cr),
                      title: const Text("اختر الوقت"),
                      content: SizedBox(
                        width: double.maxFinite,
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, // عدد الأعمدة
                                crossAxisSpacing: 8.w,
                                mainAxisSpacing: 8.h,
                                childAspectRatio: 2.5, // شكل المربع (عرض × طول)
                              ),
                          itemCount: times.length,
                          itemBuilder: (context, index) {
                            final time = times[index];
                            int hour =
                                int.tryParse(
                                  time.startTime?.split(":").first ?? "",
                                ) ??
                                0;
                            int minute =
                                int.tryParse(
                                  time.startTime?.split(":")[1] ?? "",
                                ) ??
                                0;

                            final displayText = convertTo12HourFormat(
                              hour,
                              minute,
                            );
                            log("start time is ${time.startTime}");

                            return CustomElevatedButton(
                              text: displayText,
                              radius: 12.r,
                              borderColor: MainColors.primary,
                              color: MainColors.background,
                              textColor: MainColors.primary,

                              onPressed: () {
                                final dayName = cubit.dayController.text;
                                cubit.saveSelectedScheduleData(
                                  dayName: dayName,
                                  timeSlotData: time,
                                );
                                Navigator.pop(context, displayText);
                              },
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
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
    );
  }
}
