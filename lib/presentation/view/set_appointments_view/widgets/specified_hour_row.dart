import 'package:eazifly_student/core/component/titled_form_field.dart';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:flutter/material.dart';

class SpecifiedHourRow extends StatelessWidget {
  const SpecifiedHourRow({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Row(
      children: [
        Expanded(
          child: TitledFormFieldItem(
            verticalSpace: 4.ph,
            keyboardType: TextInputType.number,
            iconWidget: 0.ph,
            titleText: lang.frommHour,
            formfieldHintText: "mm / hh",
          ),
        ),
        20.pw,
        Expanded(
          child: TitledFormFieldItem(
            verticalSpace: 4.ph,
            keyboardType: TextInputType.number,
            iconWidget: 0.ph,
            titleText: lang.toHour,
            formfieldHintText: "mm / hh",
          ),
        ),
      ],
    );
  }
}
