import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class StudentGenderBox extends StatelessWidget {
  final VoidCallback onTap;
  final String icon;
  final String type;
  final double? padding;
  final bool isSelected;
  const StudentGenderBox({
    super.key,
    required this.icon,
    this.padding,
    required this.type,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(left: padding ?? 0, right: padding ?? 0),
          height: 56.h,
          decoration: BoxDecoration(
            borderRadius: 8.cr,
            border: Border.all(
              color: isSelected
                  ? MainColors.primary
                  : MainColors.outlineVariant,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
              ),
              8.pw,
              Text(
                type,
                style: MainTextStyle.boldTextStyle(
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}