import 'package:eazifly_student/core/component/titled_form_field.dart';
import 'package:eazifly_student/presentation/controller/program_subscription_plan/programsubscriptionplan_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class StartDateField extends StatelessWidget {
  const StartDateField({super.key, required this.cubit});

  final ProgramSubscriptionPlanCubit cubit;

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return GestureDetector(
      onTap: () async {
        DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2030),
          // locale: const Locale('ar', 'SA'),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  onSurface: Colors.black,
                ),
              ),
              child: child!,
            );
          },
        );

        if (selectedDate != null) {
          cubit.updateStartDate(selectedDate);
        }
      },
      child: TitledFormFieldItem(
        titleText: lang.startDate,
        iconWidget: 0.ph,
        formfieldHintText: lang.startDateHint,
        controller: cubit.startDate,
        validator: customValidation,
        enabled: false,
      ),
    );
  }
}
