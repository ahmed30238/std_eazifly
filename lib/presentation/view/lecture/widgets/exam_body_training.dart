
import 'package:eazifly_student/core/enums/student_success_status.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/dummy_data.dart';

import '../../subscription_details_view/widgets/imports.dart';
class ExamBodyCustomTrailing extends StatelessWidget {
  final StudentStatus status;
  final bool? isNewStudent;
  const ExamBodyCustomTrailing({
    super.key,
    this.isNewStudent = false,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomMaterialButton(
          color: studentStatus(status).containerColor,
          textColor: studentStatus(status).textColor,
          text: studentStatus(status).text,
          onPressed: () {},
        ),
        !isNewStudent!
            ? Text(
                "100 / 55",
                style: MainTextStyle.boldTextStyle(fontSize: 12),
              )
            : 0.ph,
      ],
    );
  }
}

BtnColors studentStatus(StudentStatus state) {
  switch (state) {
    case StudentStatus.successful:
      return BtnColors(
          containerColor: MainColors.lightgreenTeal,
          textColor: MainColors.greenTeal,
          text: "ناجح");
    case StudentStatus.acceptable:
      return BtnColors(
          textColor: MainColors.blueTextColor,
          containerColor: MainColors.lightblue,
          text: "مقبول");
    case StudentStatus.failed:
      return BtnColors(
          textColor: MainColors.red,
          containerColor: MainColors.lightRed,
          text: "راسب");

    default:
      return BtnColors(
          textColor: MainColors.yellow,
          containerColor: MainColors.lightYellow,
          text: "جديد");
  }
}