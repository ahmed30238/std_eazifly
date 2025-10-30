import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class OfferContainer extends StatelessWidget {
  final String offerText;
  final double width;
  final double height;
  const OfferContainer({
    super.key,
    required this.offerText,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(borderRadius: 16.cr, color: MainColors.accent),
      child: Text(
        offerText,
        style: MainTextStyle.boldTextStyle(
          fontSize: 11,
          color: MainColors.background,
        ),
      ).center(),
    );
  }
}
