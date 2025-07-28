import 'dart:developer';
import 'package:eazifly_student/presentation/controller/cancel_session_controller/cancelsession_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/view/lecture/cancel_session_view/widgets/time_selection_bottomsheet.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ScheduleItem extends StatelessWidget {
  final String day;
  final String date;
  final String from;
  final String to;
  final int sessionId;
  final String state;
  final String statusLabel;

  const ScheduleItem({
    super.key,
    required this.date,
    required this.day,
    required this.from,
    required this.to,
    required this.sessionId,
    required this.state,
    required this.statusLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      height: 74.h,
      width: double.infinity,
      decoration: BoxDecoration(
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
            state != "pending"
                ? Text(
                    statusLabel,
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.red,
                    ),
                  )
                : EditSessionDateArea(sessionId: sessionId),
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
  });

  final int sessionId;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        log("$sessionId");
        var read = context.read<CancelSessionCubit>();

        await read.getInstructorAvailabilities(
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
          daysMap.entries
              .where((entry) => entry.value != null && entry.value!.isNotEmpty),
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
    );
  }
}
