import 'dart:developer';

import 'package:eazifly_student/presentation/controller/cancel_session_controller/cancelsession_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/view/lecture/cancel_session_view/widgets/time_selection_bottomsheet.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:intl/intl.dart';

class SchedulesBody extends StatelessWidget {
  const SchedulesBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LectureCubit>();
    var sessions = cubit.getProgramSessionsEntity?.data;
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        var session = sessions?[index];
        final days = sessions
            ?.map((session) => DateFormat('EEEE', 'ar')
                .format(session.sessionDate ?? DateTime.now()))
            .toList();
        return ScheduleItem(
          date: session?.sessionDate?.toIso8601String().substring(0, 10) ?? "",
          day: days?[index] ?? "",
          from: session?.sessionTime?.substring(0, 5) ?? "",
          to: session?.sessionTimeTo?.substring(0, 5) ?? "",
          sessionId: session?.id ?? -1,
        );
      },
      separatorBuilder: (context, index) => 8.ph,
      itemCount: sessions?.length ?? 0,
    );
  }
}

class ScheduleItem extends StatelessWidget {
  final String day;
  final String date;
  final String from;
  final String to;
  final int sessionId;

  const ScheduleItem({
    super.key,
    required this.date,
    required this.day,
    required this.from,
    required this.to,
    required this.sessionId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      height: 74.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: MainColors.veryLightGrayFormField,
      ),
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
                      color: MainColors.grayTextColors,
                    ),
                  ),
                  8.ph,
                  Text(
                    "$day  $date",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.black,
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
                      color: MainColors.grayTextColors,
                    ),
                  ),
                  8.ph,
                  Expanded(
                    child: Text(
                      "$from الي $to ",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 12,
                        color: MainColors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            27.pw,
            InkWell(
              onTap: () async {
                log("$sessionId");
                var read = context
                    .read<CancelSessionCubit>();
                    
                await read
                    .getInstructorAvailabilities(
                      instructorId: (int.tryParse(
                            context
                                    .read<LectureCubit>()
                                    .showProgramDetailsEntity
                                    ?.data
                                    ?.nextSession
                                    ?.instructorId ??
                                "",
                          )) ??
                          -1,
                      duration: (int.tryParse(
                            context
                                    .read<LectureCubit>()
                                    .showProgramDetailsEntity
                                    ?.data
                                    ?.nextSession
                                    ?.duration ??
                                "",
                          )) ??
                          -1,
                    );
                final availabilityData = context
                    .read<CancelSessionCubit>()
                    .getInstructorAvailabilitiesEntity
                    ?.data;

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
                final daysList = filteredDaysMap.entries.toList();

                showModalSheet(
                  isFixedSize: true,
                  maxHeight: 323.h,
                  minHeight: 322.h,
                  context,
                  widget: TimeSelectionBottomSheet(
                    cubit: context.read<CancelSessionCubit>(),
                    daysList: daysList,
                    navigateToMyPrograms: false,
                    sessionId: sessionId,
                  ),
                );
              },
              child: Text(
                "تعديل الموعد",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 12,
                  color: MainColors.blueTextColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UpdateSessionDateBottomSheet extends StatelessWidget {
  const UpdateSessionDateBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheetDesign(
      widget: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            16.ph,
            SizedBox(
              height: 36.h,
              child: Text(
                "برجاء تحديد المواعيد الجديدة",
                style: MainTextStyle.boldTextStyle(fontSize: 15),
              ),
            ),
            32.ph,
            Row(
              children: [
                Text(
                  "اليوم",
                  style: MainTextStyle.boldTextStyle(fontSize: 12),
                ),
                16.pw,
                SizedBox(
                  width: 291.w,
                  child: const InkWell(
                    child: CustomTextFormField(
                      filledColor: MainColors.lightGray,
                      enabled: false,
                      hintText: "السبت",
                    ),
                  ),
                ),
              ],
            ),
            20.ph,
            Row(
              children: [
                Text(
                  "الوقت",
                  style: MainTextStyle.boldTextStyle(fontSize: 12),
                ),
                16.pw,
                SizedBox(
                  height: 54.h,
                  width: 291.w,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => const TimeSlot(),
                    separatorBuilder: (context, index) => 12.pw,
                    itemCount: 4,
                  ),
                ),
              ],
            ),
            40.ph,
            CustomElevatedButton(
              height: 48.h,
              color: MainColors.blueTextColor,
              text: "تحديد موعد جديد",
              radius: 16.r,
              onPressed: () {
                back(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TimeSlot extends StatelessWidget {
  const TimeSlot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.h,
      width: 135.w,
      decoration: BoxDecoration(
        color: MainColors.veryLightGrayFormField,
        borderRadius: 8.cr,
      ),
      child: CustomRichText(
        text1: "${DateTime.now().hour} : ${DateTime.now().minute}",
        text1Style: MainTextStyle.boldTextStyle(fontSize: 14),
        text2Style: MainTextStyle.boldTextStyle(fontSize: 14),
        spaceText: "  الي  ",
        spaceStyle: MainTextStyle.boldTextStyle(fontSize: 12),
        text2: "${DateTime.now().hour} : ${DateTime.now().minute}",
      ).center(),
    );
  }
}
