import 'package:eazifly_student/presentation/controller/lecture_quiz_details_controller/lecturequiz_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class CorrectedAnswerField extends StatelessWidget {
  final String type;
  final List<String>? choicesText;
  final int optionsLength;
  final String essayAnswer;
  final int qIndex;
  final bool isMultiTrue;

  const CorrectedAnswerField({
    super.key,
    required this.type,
    this.choicesText,
    required this.optionsLength,
    required this.qIndex,
    required this.essayAnswer, required this.isMultiTrue,
  });

  static const Map<String, String> _normalizedTypes = {
    "مقالي": "text",
    "text": "text",
    "صح وخطأ": "true_false",
    "true_false": "true_false",
    "أختيار من متعدد": "multiple_choice",
    "اختيار من متعدد": "multiple_choice", // بدون همزة
    "multiple_choice": "multiple_choice",
  };
  @override
  Widget build(BuildContext context) {
    LecturequizCubit cubit = LecturequizCubit.get(context);
    final normalizedType =
        _normalizedTypes[type.trim().toLowerCase()] ?? "unknown";
    switch (normalizedType) {
      case "text":
        return Material(
          elevation: 1,
          child: SizedBox(
            height: 44.h,
            width: double.infinity,
            child: Text(essayAnswer),
          ),
        );
      case "true_false":
        return BlocBuilder(
          bloc: cubit,
          builder: (context, state) => Column(
            children: [
              SizedBox(
                width: 343.w,
                height: 44.h,
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    bool isTrue = index == cubit.trueFalseIndex[qIndex];
                    return Container(
                      width: 165.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                        color: isTrue
                            ? MainColors.lightgreenTeal
                            : MainColors.lightRed,
                        borderRadius: 8.cr,
                        border: Border.all(
                          width: 2.w,
                          color: isTrue ? MainColors.greenTeal : MainColors.red,
                        ),
                      ),
                      child: Text(
                        index == 0 ? "صح" : "خطأ",
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 12,
                          color: isTrue ? MainColors.greenTeal : MainColors.red,
                        ),
                      ).center(),
                    );
                  },
                  separatorBuilder: (context, index) => 12.pw,
                  itemCount: 2,
                ),
              ),
            ],
          ),
        );
      case "multiple_choice":
        return BlocBuilder(
          bloc: cubit,
          builder: (context, state) => Column(
            children: [
              SizedBox(
                width: 343.w,
                height: 44.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    bool isTrue = isMultiTrue;
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      width: 76.75.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                        color: isTrue ? MainColors.lightgreenTeal : MainColors.lightRed,
                        borderRadius: 8.cr,
                        border: Border.all(
                          width: 2.w,
                          color: isTrue
                              ? MainColors.greenTeal
                              : MainColors.red,
                        ),
                      ),
                      child: Text(
                        choicesText?[index] ?? "",
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 12,
                          color: isTrue
                              ? MainColors.greenTeal
                              : MainColors.red,
                        ),
                      ).center(),
                    );
                  },
                  separatorBuilder: (context, index) => 12.pw,
                  itemCount: optionsLength,
                ),
              ),
            ],
          ),
        );
      default:
        return TextedContainer(
          width: 117.w,
          height: 28.h,
          text: "نوع غير معرف",
          textColor: MainColors.red,
          containerColor: MainColors.lightRed,
          radius: 16.r,
        );
    }
  }
}
