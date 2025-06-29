import 'dart:developer';

import 'package:eazifly_student/core/enums/week_days.dart';
import 'package:eazifly_student/presentation/controller/cancel_session_controller/cancelsession_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/widgets/bottom_sheet_day_controller.dart';
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
                    onPressed: () {
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
                        showModalSheet(
                          context,
                          isFixedSize: true,
                          maxHeight: 314.h,
                          minHeight: 312.h,
                          widget: CustomBottomSheetDesign(
                            widget: Column(
                              children: [
                                16.ph,
                                Text(
                                  "برجاء تحديد الموعد الجديدة",
                                  style:
                                      MainTextStyle.boldTextStyle(fontSize: 14),
                                ),
                                32.ph,
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Row(
                                    children: [
                                      Text(
                                        "اليوم",
                                        style: MainTextStyle.boldTextStyle(
                                            fontSize: 12),
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
                                                        (index) =>
                                                            BottomSheetDayContainer(
                                                          onTap: () {
                                                            cubit
                                                                .changeSpecifiedDay(
                                                              WeekDaysEnum
                                                                  .values[index]
                                                                  .title,
                                                            );
                                                            back(context);
                                                          },
                                                          day: WeekDaysEnum
                                                              .values[index]
                                                              .title,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          child: CustomTextFormField(
                                            controller: cubit.dayController,
                                            hintText: "السبت",
                                            enabled: false,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                20.ph,
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Row(
                                    children: [
                                      Text(
                                        "الوقت",
                                        style: MainTextStyle.boldTextStyle(
                                            fontSize: 12),
                                      ),
                                      8.pw,
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () async {
                                            TimeOfDay? selectedTime =
                                                await showTimePicker(
                                              context: context,
                                              initialTime: cubit.selectedTime ??
                                                  TimeOfDay.now(),
                                            );

                                            if (selectedTime != null) {
                                              // تعديل الوقت ليكون ساعات صحيحة أو 30 دقيقة
                                              int adjustedMinute;
                                              if (selectedTime.minute <= 15) {
                                                adjustedMinute = 0;
                                              } else if (selectedTime.minute <=
                                                  45) {
                                                adjustedMinute = 30;
                                              } else {
                                                adjustedMinute = 0;
                                                selectedTime = TimeOfDay(
                                                  hour:
                                                      (selectedTime.hour + 1) %
                                                          24,
                                                  minute: 0,
                                                );
                                              }

                                              TimeOfDay finalTime = TimeOfDay(
                                                hour: selectedTime.hour,
                                                minute: adjustedMinute,
                                              );

                                              cubit.changeSelectedTime(
                                                  finalTime);
                                            }
                                          },
                                          child: CustomTextFormField(
                                            controller: cubit.timeController,
                                            hintText: "اختر الوقت",
                                            enabled: false,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: CustomElevatedButton(
                                    radius: 16.r,
                                    text: "تحديد موعد جديد",
                                    color: MainColors.blueTextColor,
                                    onPressed: () {},
                                  ),
                                ),
                                16.ph,
                              ],
                            ),
                          ),
                        );
                      } else {
                        // TODO cancel session
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
