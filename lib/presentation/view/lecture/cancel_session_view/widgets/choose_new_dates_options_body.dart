import 'dart:developer';

import 'package:eazifly_student/presentation/controller/cancel_session_controller/cancelsession_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/view/lecture/cancel_session_view/widgets/time_selection_bottomsheet.dart';
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
                          widget: TimeSelectionBottomSheet(
                            daysList: daysList,
                            cubit: cubit,
                            sessionId: context
                                    .read<LectureCubit>()
                                    .showProgramDetailsEntity
                                    ?.data
                                    ?.nextSession
                                    ?.id ??
                                -1,
                          ),
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
