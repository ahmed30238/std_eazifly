import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';


class CategoryRowWidget extends StatelessWidget {
  final String title;

  const CategoryRowWidget({
    super.key,
    required this.title,
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
        Text(
          "عرض الكل",
          style: MainTextStyle.boldTextStyle(
            fontSize: 12,
            color: MainColors.blueTextColor,
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