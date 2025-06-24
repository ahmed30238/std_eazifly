import 'package:eazifly_student/core/enums/student_success_status.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/dummy_data.dart';

import '../../subscription_details_view/widgets/imports.dart';

class ExamBodyCustomTrailing extends StatelessWidget {
  final StudentStatus status;
  final bool isNewExam;
  final String quizGrade;
  final String stdGrade;
  
  const ExamBodyCustomTrailing({
    super.key,
    this.isNewExam = false,
    required this.status,
    required this.quizGrade,
    required this.stdGrade,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomMaterialButton(
          color: studentStatus(status).containerColor,
          textColor: studentStatus(status).textColor,
          text: studentStatus(status).text,
          onPressed: () {},
        ),
        4.ph, // إضافة مسافة صغيرة
        // عرض العلامات فقط إذا لم يكن الامتحان جديد ولديه علامات صحيحة
        if (!isNewExam && _hasValidGrades()) ...{
          Text(
            "$stdGrade / $quizGrade",
            style: MainTextStyle.boldTextStyle(
              fontSize: 12,
              color: _getGradeTextColor(),
            ),
          )
        }
      ],
    );
  }

  /// التحقق من وجود علامات صحيحة للعرض
  bool _hasValidGrades() {
    return quizGrade.isNotEmpty && 
           stdGrade.isNotEmpty && 
           quizGrade != "null" && 
           stdGrade != "null" &&
           status != StudentStatus.pending;
  }

  /// اختيار لون النص للعلامات بناءً على الحالة
  Color _getGradeTextColor() {
    switch (status) {
      case StudentStatus.successful:
        return MainColors.greenTeal;
      case StudentStatus.acceptable:
        return MainColors.blueTextColor;
      case StudentStatus.failed:
        return MainColors.red;
      case StudentStatus.pending:
      case StudentStatus.newStudent:
        return MainColors.grayTextColors;
      default:
        return MainColors.grayTextColors;
    }
  }
}

/// دالة تحديد ألوان ونصوص الأزرار حسب حالة الطالب
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
    case StudentStatus.pending:
      return BtnColors(
          textColor: MainColors.yellow,
          containerColor: MainColors.lightYellow,
          text: "جديد");
    case StudentStatus.newStudent:
      return BtnColors(
          textColor: MainColors.yellow,
          containerColor: MainColors.lightYellow,
          text: "جديد");
    default:
      return BtnColors(
        textColor: MainColors.yellow,
        containerColor: MainColors.lightYellow,
        text: "غير محدد",
      );
  }
}