import 'package:eazifly_student/presentation/view/lecture/corrcected_assignment_details_view/widgets/question_an_sol_container.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class CorrcectedAssignmentDetailsView extends StatelessWidget {
  const CorrcectedAssignmentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "واجب الرياضيات للصف السادس الابتدائي",
        leadingText: lang.back,
        isCenterTitle: true,
      ),
      body: Column(
        children: [
          16.ph,
          StudentStats(
            horizontalPadding: 0,
            titleText: const [
              "تاريخ التسليم",
              "درجة الإمتحان",
              "حالة الإمتحان"
            ],
            downSideWidgets: [
              Text(
                "2025 - 3 - 12",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 12,
                  color: MainColors.blackText,
                ),
              ),
              Text(
                "85 / 100",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 12,
                  color: MainColors.blackText,
                ),
              ),
              TextedContainer(
                width: 63.w,
                height: 26.h,
                text: "ناجح",
                textColor: MainColors.greenTeal,
                containerColor: MainColors.lightgreenTeal,
                radius: 55.r,
              ),
            ],
          ),
          16.ph,
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                bottom: 16.h,
              ),
              itemBuilder: (context, index) => QuestionAndSolutionContainer(
                fullTeacherAssessment: index == 1,
                index: index,
              ),
              separatorBuilder: (context, index) => 16.ph,
              itemCount: 2,
            ),
          ),
        ],
      ),
    );
  }
}
