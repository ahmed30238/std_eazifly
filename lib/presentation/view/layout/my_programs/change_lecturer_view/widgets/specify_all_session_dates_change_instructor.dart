import 'package:eazifly_student/core/enums/week_days.dart';
import 'package:eazifly_student/presentation/controller/change_lecturer_controller/changelecturer_cubit.dart';
import 'package:eazifly_student/presentation/controller/change_lecturer_controller/changelecturer_state.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/widgets/bottom_sheet_day_controller.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class SpecifyAllSessionDatesChangeInstructor extends StatelessWidget {
  const SpecifyAllSessionDatesChangeInstructor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // var lang = context.loc!;
    return BlocBuilder<ChangelecturerCubit, ChangelecturerState>(
      builder: (context, state) {
        var cubit = context.read<ChangelecturerCubit>();
        int numberOfSessions =
            cubit.getUserSubscriptionDataEntity?.data?.numberOfSessions ?? 0;
        return Form(
          key: cubit.specifiedFormKey,
          child: Column(
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
                                  validator: customValidation,
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
                                        context, sessionIndex);
                                  }
                                },
                                child: CustomTextFormField(
                                  controller: sessionIndex <
                                          cubit.fromControllers.length
                                      ? cubit.fromControllers[sessionIndex]
                                      : null, // ربط من controller
                                  enabled: false,
                                  validator: customValidation,
                                  keyboardType: TextInputType.datetime,
                                  hintText: "اختر وقت البداية",
                                  suffixIconWidget: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.w),
                                    child:  Icon(
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
                                  if (sessionIndex <
                                      cubit.toControllers.length) {
                                    cubit.showToTimePickerDialog(
                                        context, sessionIndex);
                                  }
                                },
                                child: CustomTextFormField(
                                  controller:
                                      sessionIndex < cubit.toControllers.length
                                          ? cubit.toControllers[sessionIndex]
                                          : null, // ربط إلى controller
                                  enabled: false,
                                  keyboardType: TextInputType.datetime,
                                  validator: customValidation,
                                  hintText: "اختر وقت النهاية",
                                  suffixIconWidget: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.w),
                                    child:  Icon(
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
              CustomElevatedButton(
                radius: 16.r,
                width: 343.w,
                height: 48.w,
                color: MainColors.primary,
                text: "التالي",
                onPressed: () {
                  if (cubit.specifiedFormKey.currentState!.validate()) {
                    cubit.incrementBodyIndex(context);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
