import 'package:eazifly_student/presentation/controller/lecture_quiz_details_controller/lecturequiz_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class AnswerFieldArea extends StatefulWidget {
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

  @override
  State<AnswerFieldArea> createState() => _AnswerFieldAreaState();
}

class _AnswerFieldAreaState extends State<AnswerFieldArea> {
  static const Map<String, String> _normalizedTypes = {
    "مقالي": "text",
    "text": "text",
    "صح وخطأ": "true_false",
    "true_false": "true_false",
    "أختيار من متعدد": "multiple_choice",
    "اختيار من متعدد": "multiple_choice",
    "multiple_choice": "multiple_choice",
  };

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeAnswerArrays();
    });
  }

  void _initializeAnswerArrays() {
    LecturequizCubit cubit = LecturequizCubit.get(context);

    // تأكد من أن المصفوفات مُهيأة بالحجم الصحيح
    while (cubit.trueFalseIndex.length <= widget.qIndex) {
      cubit.trueFalseIndex.add(0);
    }

    while (cubit.mulipleChoiceOptionIndex.length <= widget.qIndex) {
      cubit.mulipleChoiceOptionIndex.add(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    LecturequizCubit cubit = LecturequizCubit.get(context);
    final normalizedType =
        _normalizedTypes[widget.type.trim().toLowerCase()] ?? "unknown";

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
              borderColor: MainColors.background,
              hintText: "   أدخل الإجابة هنا............",
              filledColor: MainColors.background,
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
                    bool isSelected =
                        cubit.trueFalseIndex.length > widget.qIndex &&
                        index == cubit.trueFalseIndex[widget.qIndex];
                    return InkWell(
                      onTap: () => cubit.changeTrueFalse(index, widget.qIndex),
                      child: Container(
                        width: 165.w,
                        height: 44.h,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? MainColors.surface
                              : MainColors.background,
                          borderRadius: 8.cr,
                          border: Border.all(
                            width: 2.w,
                            color: isSelected
                                ? MainColors.primary
                                : MainColors.outline,
                          ),
                        ),
                        child: Text(
                          index == 0 ? "صح" : "خطأ",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 12,
                            color: isSelected
                                ? MainColors.primary
                                : MainColors.onPrimary,
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
                    color: MainColors.primary,
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
                    bool isSelected =
                        cubit.mulipleChoiceOptionIndex.length > widget.qIndex &&
                        index == cubit.mulipleChoiceOptionIndex[widget.qIndex];
                    return InkWell(
                      onTap: () =>
                          cubit.changeMulipleChoice(index, widget.qIndex),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        width: 76.75.w,
                        height: 44.h,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? MainColors.surface
                              : MainColors.background,
                          borderRadius: 8.cr,
                          border: Border.all(
                            width: 2.w,
                            color: isSelected
                                ? MainColors.primary
                                : MainColors.outline,
                          ),
                        ),
                        child: Text(
                          widget.choicesText?[index] ?? "",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 12,
                            color: isSelected
                                ? MainColors.primary
                                : MainColors.onPrimary,
                          ),
                        ).center(),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => 12.pw,
                  itemCount: widget.optionsLength,
                ),
              ),
              12.ph,
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "يمكن تعديل الاجابة بالضغط عليها",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 11,
                    color: MainColors.primary,
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
          textColor: MainColors.onError,
          containerColor: MainColors.error,
          radius: 16.r,
        );
    }
  }
}
