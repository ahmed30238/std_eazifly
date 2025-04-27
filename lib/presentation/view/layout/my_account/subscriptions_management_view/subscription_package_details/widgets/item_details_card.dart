import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ItemDetailsCard extends StatelessWidget {
  final List<String> titles;

  const ItemDetailsCard({super.key, required this.titles});

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
                    color: MainColors.grayTextColors,
                  ),
                ),
                8.ph,
                Text(
                  "الباقة الإفتراضية",
                  style: MainTextStyle.mediumTextStyle(
                    fontSize: 14,
                    color: MainColors.black,
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
