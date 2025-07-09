import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class CategoryRowWidget extends StatelessWidget {
  final String title;
  final VoidCallback onViewAllTap;

  const CategoryRowWidget({
    super.key,
    required this.title,
    required this.onViewAllTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: MainTextStyle.boldTextStyle(
            fontSize: 15,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onViewAllTap,
          child: Text(
            "عرض الكل",
            style: MainTextStyle.boldTextStyle(
              fontSize: 12,
              color: MainColors.blueTextColor,
            ),
          ),
        ),
        4.pw,
        SvgPicture.asset(
          Assets.iconsViewAllArrow,
        )
      ],
    );
  }
}
