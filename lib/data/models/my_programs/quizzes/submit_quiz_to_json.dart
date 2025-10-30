class SubmitQuizTojson {
  final int quizId;
  final List<QuizAnswer> answers;

  SubmitQuizTojson({required this.quizId, required this.answers});

  // تحويل البيانات إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'quiz_id': quizId,
      'answers': answers.map((answer) => answer.toJson()).toList(),
    };
  }
}

class QuizAnswer {
  final int questionId;
  final int? questionOptionId; // اختياري للأسئلة المتعددة الخيارات
  final String? answer; // اختياري للأسئلة النصية

  QuizAnswer({required this.questionId, this.questionOptionId, this.answer});

  // تحويل البيانات إلى JSON
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {'question_id': questionId};

    // إضافة question_option_id إذا كان موجود
    if (questionOptionId != null) {
      json['question_option_id'] = questionOptionId;
    }

    // إضافة answer إذا كان موجود
    if (answer != null) {
      json['answer'] = answer;
    }

    return json;
  }
}
