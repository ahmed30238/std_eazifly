import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class EssayStudentAnswer extends StatelessWidget {
  const EssayStudentAnswer({
    super.key,
    required this.essayAnswer,
  });

  final String? essayAnswer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      constraints: BoxConstraints(
        minHeight: 84.h,
      ),
      child: Text(
        essayAnswer ?? "",
        style: MainTextStyle.mediumTextStyle(
          fontSize: 12,
        ),
      ),
    );
  }
}