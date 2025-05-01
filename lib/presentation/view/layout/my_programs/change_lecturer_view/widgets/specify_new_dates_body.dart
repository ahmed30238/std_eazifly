import 'package:eazifly_student/core/component/bounded_time_slot_form_fields.dart';
import 'package:eazifly_student/core/component/date_type_row.dart';
import 'package:eazifly_student/presentation/controller/change_lecturer_controller/changelecturer_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class SpecifyNewDatesBody extends StatelessWidget {
  const SpecifyNewDatesBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ChangelecturerCubit.get(context);
    return Column(
      children: [
        24.ph,
        SizedBox(
          height: 36.h,
          child: Text(
            "برجاء تحديد المواعيد الجديدة",
            style: MainTextStyle.boldTextStyle(
              fontSize: 14,
            ),
          ),
        ),
        8.ph,
        BlocBuilder(
          bloc: cubit,
          builder: (context, state) => SchdeuleTypeRow(
            cubitIndex: cubit.dateTypeIndex,
            changeDateTypeIndex: (p0) => cubit.changeDateTypeIndex(p0),
          ),
        ),
        44.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "اليوم",
              style: MainTextStyle.boldTextStyle(
                fontSize: 12,
              ),
            ),
            16.pw,
            SizedBox(
              width: 299.w,
              child: InkWell(
                onTap: () => weekDaysModalSheet(context, cubit),
                child: BlocBuilder(
                  bloc: cubit,
                  builder: (context, state) => CustomTextFormField(
                    controller: cubit.dayController,
                    enabled: false,
                    hintText: "اختر",
                  ),
                ),
              ),
            ),
          ],
        ),
        20.ph,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const BoundedTimeSlotFormFields(),
        ),
        const Spacer(),
        CustomElevatedButton(
          radius: 16.r,
          width: 343.w,
          height: 48.w,
          color: MainColors.blueTextColor,
          text: "التالي",
          onPressed: () {
            cubit.incrementBodyIndex();
          },
        ),
        32.ph,
      ],
    );
  }
}
