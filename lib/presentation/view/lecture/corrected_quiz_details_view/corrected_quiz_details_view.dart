import 'package:eazifly_student/presentation/view/lecture/corrected_quiz_details_view/widgets/answer_details_container.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class CorrectedQuizDetailsView extends StatelessWidget {
  const CorrectedQuizDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "إمتحان الصف  السادس الإبتدائي",
        leadingText: lang.back,
        isCenterTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              "تفاصيل الإجابات",
              style: MainTextStyle.boldTextStyle(fontSize: 14),
            ),
          ),
          8.ph,
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => AnswerDetailsContainer(
                answerState: index != 2,
                qType: index == 0
                    ? "مقالي"
                    : index == 1
                        ? "صح وخطأ"
                        : "أختيار من متعدد",
                index: index,
                answerText:
                    "مثال :هذا النص هو جزء من عملية تحسين تجربة المستخدم من خلال النص. مثال :هذا النص هو جزء من عملية تحسين تجربة المستخدم من خلال النص.",
                qState: index == 2 ? "إجابة خطأ" : "إجابة صحيحة",
                question: "ما هي أهم العوامل المؤثرة في التغير المناخي ؟",
              ),
              separatorBuilder: (context, index) => 8.ph,
              itemCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}
