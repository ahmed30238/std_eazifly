import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class SubscriptionScreenCustomText extends StatelessWidget {
  final String text;
  const SubscriptionScreenCustomText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: MainTextStyle.boldTextStyle(
        fontSize: 12,
      ),
    );
  }
}
