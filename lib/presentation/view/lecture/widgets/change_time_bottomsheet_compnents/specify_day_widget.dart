import 'package:eazifly_student/presentation/controller/cancel_session_controller/cancelsession_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

import '../../helper_functions.dart';

class SpecifyDayWidget extends StatelessWidget {
  final LectureCubit lectureCubit;
  final CancelSessionCubit cubit;

  const SpecifyDayWidget({
    super.key,
    required this.cubit,
    required this.lectureCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Text("اليوم", style: MainTextStyle.boldTextStyle(fontSize: 12)),
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
                    final availableDays = dayList(
                      context,
                    ).map((entry) => entry.key).toList();

                    final dayName = weekdayToName(day.weekday);

                    return availableDays.contains(dayName);
                  },
                );

                cubit.changeSpecifiedDay(
                  weekdayToName(selectedDay?.weekday ?? 0),
                );
              },
              child: CustomTextFormField(
                controller: cubit.dayController,
                hintText: cubit.dayController.text.isEmpty
                    ? "اليوم"
                    : cubit.dayController.text,
                enabled: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
