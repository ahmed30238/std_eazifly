import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ItemDetailsCard extends StatelessWidget {
  final List<String> titles;
  final List<String> values;

  const ItemDetailsCard({
    super.key,
    required this.titles,
    required this.values,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          3,
          (index) => Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  titles[index],
                  style: MainTextStyle.mediumTextStyle(
                    fontSize: 12,
                    color: MainColors.onSurfaceSecondary,
                  ),
                ),
                8.ph,
                Text(
                  values[index],
                  style: MainTextStyle.mediumTextStyle(
                    fontSize: 14,
                    color: MainColors.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ).center(),
    );
  }
}
