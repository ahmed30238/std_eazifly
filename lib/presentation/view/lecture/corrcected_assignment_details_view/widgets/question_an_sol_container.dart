import 'package:eazifly_student/core/component/voice_message_widget.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class QuestionAndSolutionContainer extends StatelessWidget {
  final bool fullTeacherAssessment;
  final int index;
  const QuestionAndSolutionContainer({
    super.key,
    required this.index,
    this.fullTeacherAssessment = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      constraints: BoxConstraints(
        minHeight: 355.h,
      ),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: MainColors.veryLightGrayFormField,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.ph,
          SizedBox(
            height: 29.h,
            child: Text(
              "نص التسليم ${index + 1}",
              style: MainTextStyle.boldTextStyle(
                fontSize: 12,
                color: MainColors.checkBoxBorderGray,
              ),
            ),
          ),
          10.ph,
          SizedBox(
            height: 20.h,
            child: Text(
              "مثال ما هو أكبر كوكب في المجموعة الشمسية؟",
              style: MainTextStyle.mediumTextStyle(
                fontSize: 12,
              ),
            ),
          ),
          16.ph,
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "الاجابة",
              style: MainTextStyle.boldTextStyle(
                fontSize: 12,
                color: MainColors.checkBoxBorderGray,
              ),
            ),
          ),
          8.ph,
          Text(
            "مثال :هذا النص هو جزء من عملية تحسين تجربة المستخدم من خلال النص. مثال :هذا النص هو جزء من عملية تحسين تجربة المستخدم من خلال النص.",
            style: MainTextStyle.boldTextStyle(
              fontSize: 14,
            ),
          ),
          8.ph,
          SizedBox(
            height: 105.h,
            width: 375.w,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ImageContainer(
                containerWidth: 104.h,
                containerHeight: 84.w,
                radius: 8.r,
              ),
              separatorBuilder: (context, index) => 8.pw,
              itemCount: 5,
            ),
          ),
          12.ph,
          Text(
            "تقييم المعلم",
            style: MainTextStyle.mediumTextStyle(
              fontSize: 12,
            ),
          ),
          8.ph,
          Column(
            children: [
              if (fullTeacherAssessment) ...{
                Text(
                  "مستوي مقبول  مثال :هذا النص هو جزء من عملية تحسين تجربة المستخدم من خلال النص.",
                  style: MainTextStyle.mediumTextStyle(
                    fontSize: 12,
                  ),
                ),
                8.ph,
                SizedBox(
                  height: 105.h,
                  width: 375.w,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ImageContainer(
                      containerWidth: 104.h,
                      containerHeight: 84.w,
                      radius: 8.r,
                    ),
                    separatorBuilder: (context, index) => 8.pw,
                    itemCount: 2,
                  ),
                ),
              },
              8.ph,
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  decoration: BoxDecoration(
                    color: MainColors.lightGray,
                    borderRadius: 12.cr,
                  ),
                  height: 40.h,
                  child: const VoiceMessageWidget(
                    backgroundColor: MainColors.transparentColor,
                  ),
                ),
              ),
            ],
          ),
          12.ph,
        ],
      ),
    );
  }
}
