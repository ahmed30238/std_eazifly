import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final void Function(bool?) onChanged;
  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox.adaptive(
      side: BorderSide(strokeAlign: 3.w, width: 1.w),
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      value: value,
      shape: RoundedRectangleBorder(
        borderRadius: 5.cr,
        side: BorderSide(width: 1.w, strokeAlign: 1.w),
      ),
      onChanged: onChanged,
      activeColor: MainColors.primary,
    );
  }
}
