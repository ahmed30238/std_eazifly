import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class NoOfChildrenContainer extends StatelessWidget {
  final int index;
  final bool isSelected;
  const NoOfChildrenContainer({
    super.key,
    required this.isSelected,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: 80.w,
      decoration: BoxDecoration(
          borderRadius: 8.cr,
          color: isSelected ? MainColors.blueTextColor : MainColors.lightblue),
      child: Text(
        "${index + 1}",
        style: MainTextStyle.mediumTextStyle(
          fontSize: 16,
          color: isSelected ? MainColors.white : MainColors.blueTextColor,
        ),
      ).center(),
    );
  }
}
