import 'package:eazifly_student/core/enums/week_days.dart';
import 'package:eazifly_student/presentation/controller/change_lecturer_controller/changelecturer_cubit.dart';
import 'package:eazifly_student/presentation/controller/change_lecturer_controller/changelecturer_state.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/widgets/bottom_sheet_day_controller.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class RepeatWeekSessionToChangeInstructor extends StatelessWidget {
  const RepeatWeekSessionToChangeInstructor({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ChangelecturerCubit>();
    int numberOfSessionPerWeek = int.tryParse(
          cubit.getUserSubscriptionDataEntity?.data?.numberOfSessionPerWeek ??
              "0",
        ) ??
        0;
    // var lang = context.loc!;
    return Form(
      key: cubit.repeatedFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.separated(
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
                                      ...List.generate(
                                        7,
                                        (index) => BottomSheetDayContainer(
                                          onTap: () {
                                            cubit.changeSpecifiedDay(
                                              WeekDaysEnum.values[index].title,
                                              sessionIndex,
                                            );
                                            back(context);
                                          },
                                          day: WeekDaysEnum.values[index].title,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: CustomTextFormField(
                            controller: cubit.dayController[sessionIndex],
                            hintText: "اليوم",
                            validator: customValidation,
                            enabled: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                  16.ph,
                  BlocBuilder<ChangelecturerCubit, ChangelecturerState>(
                    builder: (context, state) {
                      final cubit = ChangelecturerCubit.get(context);

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
                                // إرسال الـ sessionIndex للدالة
                                cubit.showTimePickerDialog(
                                    context, sessionIndex);
                                // الدالة ستتنادى تلقائياً من الـ Cubit
                              },
                              child: AbsorbPointer(
                                child: CustomTextFormField(
                                  validator: customValidation,
                                  onFieldSubmitted: (p0) {
                                    if (sessionIndex ==
                                        numberOfSessionPerWeek) {
                                      cubit.getRemainingProgramSessions(
                                          programId: context
                                              .read<LectureCubit>()
                                              .currentProgramId,
                                          userId: cubit.selectedStudentId);
                                    }
                                  },
                                  // عرض الوقت المحدد لهذا الـ session
                                  hintText:
                                      sessionIndex < cubit.selectedTimes.length
                                          ? cubit.selectedTimes[sessionIndex]
                                          : "24 ساعة",
                                  enabled: false,
                                  controller:
                                      cubit.hoursControllers[sessionIndex],
                                  suffixIconWidget: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.w),
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
          16.ph,
          // 32.ph,
          CustomElevatedButton(
            radius: 16.r,
            width: 343.w,
            height: 48.w,
            color: MainColors.blueTextColor,
            text: "التالي",
            onPressed: () {
              if (cubit.repeatedFormKey.currentState!.validate()) {
              cubit.incrementBodyIndex(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
