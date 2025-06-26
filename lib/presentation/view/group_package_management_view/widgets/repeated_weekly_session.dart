import 'package:eazifly_student/core/enums/week_days.dart';
import 'package:eazifly_student/presentation/controller/set_appointment_controller/setappointments_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/widgets/bottom_sheet_day_controller.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class RepeatedWeeklySession extends StatelessWidget {
  final int numberOfSessionsPerWeek;
  const RepeatedWeeklySession({super.key, required this.numberOfSessionsPerWeek});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SetappointmentsCubit>();
    return ListView.separated(
      itemBuilder: (context, index) => Column(
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
                                        WeekDaysEnum.values[index].title);
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
                    controller: cubit.dayController,
                    hintText: "السبت",
                    enabled: false,
                  ),
                ),
              ),
            ],
          ),
          16.ph,
          Row(
            children: [
              Text(
                "الموعد",
                style: MainTextStyle.boldTextStyle(fontSize: 12),
              ),
              8.pw,
              const Expanded(
                child: CustomTextFormField(
                  hintText: "24 ساعة",
                ),
              ),
            ],
          ),
        ],
      ),
      separatorBuilder: (context, index) => 16.ph,
      itemCount: numberOfSessionsPerWeek,
    );
  }
}
