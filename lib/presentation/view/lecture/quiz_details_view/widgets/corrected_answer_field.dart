import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class CorrectedAnswerField extends StatelessWidget {
  final String type;
  final List<String>? choicesText;
  final int optionsLength;
  final String essayAnswer;
  final int qIndex;
  final bool isMultiTrue;
  final List<bool> optionsCorrectness; 
  final int? userSelectedOptionIndex; 

  const CorrectedAnswerField({
    super.key,
    required this.type,
    this.choicesText,
    required this.optionsLength,
    required this.qIndex,
    required this.essayAnswer,
    required this.isMultiTrue,
    required this.optionsCorrectness,
    this.userSelectedOptionIndex,
  });

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
  Widget build(BuildContext context) {
    final normalizedType = _normalizedTypes[type.trim().toLowerCase()] ?? "unknown";
    
    switch (normalizedType) {
      case "text":
        return Container(
          padding: EdgeInsets.all(12.r),
          width: double.infinity,
          decoration: BoxDecoration(
            color: isMultiTrue ? MainColors.onSuccess : MainColors.error,
            borderRadius: 8.cr,
            border: Border.all(
              width: 1.w,
              color: isMultiTrue ? MainColors.success : MainColors.onError,
            ),
          ),
          child: Text(
            essayAnswer.isEmpty ? "لم يتم الإجابة" : essayAnswer,
            style: MainTextStyle.mediumTextStyle(
              fontSize: 12,
              color: isMultiTrue ? MainColors.success : MainColors.onError,
            ),
          ),
        );
        
      case "true_false":
        return Column(
          children: [
            SizedBox(
              width: 343.w,
              height: 44.h,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  bool isCorrectOption = optionsCorrectness[index];
                  bool isUserSelected = userSelectedOptionIndex == index;
                  
                  // تحديد اللون والحالة
                  Color backgroundColor;
                  Color borderColor;
                  Color textColor;
                  
                  if (isUserSelected) {
                    // الخيار اللي اختاره المستخدم
                    backgroundColor = isCorrectOption ? MainColors.onSuccess : MainColors.error;
                    borderColor = isCorrectOption ? MainColors.success : MainColors.onError;
                    textColor = isCorrectOption ? MainColors.success : MainColors.onError;
                  } else if (isCorrectOption) {
                    // الإجابة الصحيحة (لو المستخدم ماختارهاش)
                    backgroundColor = MainColors.onSuccess;
                    borderColor = MainColors.success;
                    textColor = MainColors.success;
                  } else {
                    // خيار عادي مش مختار ومش صحيح
                    backgroundColor = MainColors.background;
                    borderColor = MainColors.outline;
                    textColor = MainColors.onPrimary;
                  }
                  
                  return Container(
                    width: 165.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: 8.cr,
                      border: Border.all(width: 2.w, color: borderColor),
                    ),
                    child: Text(
                      index == 0 ? "صح" : "خطأ",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 12,
                        color: textColor,
                      ),
                    ).center(),
                  );
                },
                separatorBuilder: (context, index) => 12.pw,
                itemCount: 2,
              ),
            ),
          ],
        );
        
      case "multiple_choice":
        return Column(
          children: [
            SizedBox(
              width: 343.w,
              height: 44.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  bool isCorrectOption = optionsCorrectness[index];
                  bool isUserSelected = userSelectedOptionIndex == index;
                  
                  // تحديد اللون والحالة
                  Color backgroundColor;
                  Color borderColor;
                  Color textColor;
                  
                  if (isUserSelected) {
                    // الخيار اللي اختاره المستخدم
                    backgroundColor = isCorrectOption ? MainColors.onSuccess : MainColors.error;
                    borderColor = isCorrectOption ? MainColors.success : MainColors.onError;
                    textColor = isCorrectOption ? MainColors.success : MainColors.onError;
                  } else if (isCorrectOption) {
                    // الإجابة الصحيحة (لو المستخدم ماختارهاش)
                    backgroundColor = MainColors.onSuccess;
                    borderColor = MainColors.success;
                    textColor = MainColors.success;
                  } else {
                    // خيار عادي مش مختار ومش صحيح
                    backgroundColor = MainColors.background;
                    borderColor = MainColors.outline;
                    textColor = MainColors.onPrimary;
                  }
                  
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    width: 76.75.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: 8.cr,
                      border: Border.all(width: 2.w, color: borderColor),
                    ),
                    child: Text(
                      choicesText?[index] ?? "",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 12,
                        color: textColor,
                      ),
                    ).center(),
                  );
                },
                separatorBuilder: (context, index) => 12.pw,
                itemCount: optionsLength,
              ),
            ),
          ],
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