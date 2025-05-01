import 'package:eazifly_student/core/component/custom_checkbox.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class TextedCheckBoxRow extends StatelessWidget {
  final bool isSelcted;
  final String text;
  final Function(bool?) onChanged;
  final bool value;
  const TextedCheckBoxRow({
    super.key,
    required this.text,
    required this.onChanged,
    required this.value,
    required this.isSelcted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 45.h,
      decoration: BoxDecoration(
        color: isSelcted ? MainColors.lightblue : MainColors.white,
        borderRadius: 8.cr,
      ),
      child: Row(
        children: [
          CustomCheckbox(
            onChanged: onChanged,
            value: value,
          ),
          12.pw,
          Text(
            text,
            style: MainTextStyle.boldTextStyle(
              fontSize: 14,
              color: isSelcted ? MainColors.blueTextColor : null,
            ),
          ),
        ],
      ),
    );
  }
}
