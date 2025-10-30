import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class BoundedTimeSlotFormFields extends StatelessWidget {
  final MainAxisAlignment? alignment;
  const BoundedTimeSlotFormFields({super.key, this.alignment});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment ?? MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text("من", style: MainTextStyle.boldTextStyle(fontSize: 12)),
        ),
        16.pw,
        const Expanded(
          flex: 8,
          child: CustomTextFormField(
            keyboardType: TextInputType.datetime,
            hintText: "        aa / mm / hh",
          ),
        ),
        15.5.pw,
        Expanded(
          child: Text("الي", style: MainTextStyle.boldTextStyle(fontSize: 12)),
        ),
        16.pw,
        const Expanded(
          flex: 8,
          child: CustomTextFormField(
            keyboardType: TextInputType.datetime,
            hintText: "        aa / mm / hh",
          ),
        ),
      ],
    );
  }
}
