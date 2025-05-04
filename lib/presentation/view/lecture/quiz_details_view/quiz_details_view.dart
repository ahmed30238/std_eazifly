import 'package:eazifly_student/presentation/view/lecture/quiz_details_view/widgets/question_container.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class LectureQuizDetailsView extends StatelessWidget {
  const LectureQuizDetailsView({super.key});

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
        children: [
          Expanded(
            child: Column(
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
                      " 100 / ....",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 12,
                        color: MainColors.blackText,
                      ),
                    ),
                    TextedContainer(
                      width: 105.w,
                      height: 26.h,
                      text: "جاري التسليم",
                      textColor: MainColors.yellow,
                      containerColor: MainColors.lightYellow,
                      radius: 16.r,
                    ),
                  ],
                ),
                24.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    "الاسالة",
                    style: MainTextStyle.boldTextStyle(fontSize: 14),
                  ),
                ),
                8.ph,
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.only(bottom: 16.h),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => QuestionContainer(
                      qType: index == 0
                          ? "مقالي"
                          : index == 1
                              ? "صح وخطأ"
                              : "أختيار من متعدد",
                      question: "ما هي أهم العوامل المؤثرة في التغير المناخي ؟",
                      index: index,
                    ),
                    separatorBuilder: (context, index) => 12.ph,
                    itemCount: 3,
                  ),
                ),
              ],
            ),
          ),
          8.ph,
          CustomElevatedButton(
            width: 344.w,
            text: "تسليم الإجابات",
            onPressed: () {},
            radius: 16.r,
            color: MainColors.blueTextColor,
          ),
          32.ph,
        ],
      ),
    );
  }
}