import 'package:eazifly_student/presentation/controller/lecture_quiz_details_controller/lecturequiz_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class AnswerFieldArea extends StatelessWidget {
  final String type;
  final List<String>? choicesText;
  final int optionsLength;
  final int qIndex;

  const AnswerFieldArea({
    super.key,
    required this.type,
    this.choicesText,
    required this.optionsLength,
    required this.qIndex,
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
            child: CustomTextFormField(
              controller: cubit.essayAnswerController,
              enabledBorder: InputBorder.none,
              vPadding: 0,
              borderRadius: 0.cr,
              borderColor: MainColors.white,
              hintText: "   أدخل الإجابة هنا............",
              filledColor: MainColors.white,
            ),
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
                    for (var i = 0; i < optionsLength; i++) {
                      cubit.trueFalseIndex.add(0);
                    }
                    bool isSelected = index == cubit.trueFalseIndex[qIndex];
                    return InkWell(
                      onTap: () => cubit.changeTrueFalse(index, qIndex),
                      child: Container(
                        width: 165.w,
                        height: 44.h,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? MainColors.lightblue
                              : MainColors.white,
                          borderRadius: 8.cr,
                          border: Border.all(
                            width: 2.w,
                            color: isSelected
                                ? MainColors.blueTextColor
                                : MainColors.grayBorderColor,
                          ),
                        ),
                        child: Text(
                          index == 0 ? "صح" : "خطأ",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 12,
                            color: isSelected
                                ? MainColors.blueTextColor
                                : MainColors.black,
                          ),
                        ).center(),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => 12.pw,
                  itemCount: 2,
                ),
              ),
              12.ph,
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "يمكن تعديل الاجابة بالضغط عليها",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 11,
                    color: MainColors.blueTextColor,
                  ),
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
                    for (var i = 0; i < optionsLength; i++) {
                      cubit.mulipleChoiceOptionIndex.add(0);
                    }
                    bool isSelected =
                        index == cubit.mulipleChoiceOptionIndex[qIndex];
                    return InkWell(
                      onTap: () => cubit.changeMulipleChoice(index, qIndex),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        width: 76.75.w,
                        height: 44.h,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? MainColors.lightblue
                              : MainColors.white,
                          borderRadius: 8.cr,
                          border: Border.all(
                            width: 2.w,
                            color: isSelected
                                ? MainColors.blueTextColor
                                : MainColors.grayBorderColor,
                          ),
                        ),
                        child: Text(
                          choicesText?[index] ?? "",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 12,
                            color: isSelected
                                ? MainColors.blueTextColor
                                : MainColors.black,
                          ),
                        ).center(),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => 12.pw,
                  itemCount: optionsLength,
                ),
              ),
              12.ph,
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "يمكن تعديل الاجابة بالضغط عليها",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 11,
                    color: MainColors.blueTextColor,
                  ),
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
