import 'package:eazifly_student/data/models/my_programs/quizzes/submit_quiz_to_json.dart';
import 'package:eazifly_student/domain/entities/my_programs/quizzes/get_quiz_questions_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/quizzes/submit_quiz_entity.dart';
import 'package:eazifly_student/domain/use_cases/get_quiz_qustions_usecase.dart';
import 'package:eazifly_student/domain/use_cases/submit_quiz_usecase.dart';
import 'package:eazifly_student/presentation/controller/lecture_quiz_details_controller/lecturequiz_state.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class LecturequizCubit extends Cubit<LecturequizState> {
  LecturequizCubit({
    required this.getQuizQuestionsUsecase,
    required this.submitQuizUsecase,
  }) : super(LecturequizInitial());
  static LecturequizCubit get(context) => BlocProvider.of(context);
  List<int> trueFalseIndex = [];
  void changeTrueFalse(int index,int qIndex) {
    trueFalseIndex[qIndex] = index;
    emit(ChangeTrueFalseIndexState());
  }

  TextEditingController? essayAnswerController = TextEditingController();
  List<int> mulipleChoiceOptionIndex = [];
  void changeMulipleChoice(int index, int questionIndex) {
    mulipleChoiceOptionIndex[questionIndex] = index;
    emit(ChangeMulipleChoiceIndexState());
  }

  // متغيرات getQuizQuestions
  bool getQuizQuestionsLoader = false;
  GetQuizQuestionsEntity? getQuizQuestionsEntity;
  final GetQuizQuestionsUsecase getQuizQuestionsUsecase;
  final SubmitQuizUsecase submitQuizUsecase;

  Future<void> getQuizQuestions({
    required int quizId,
    required int programId,
    required int userId,
  }) async {
    getQuizQuestionsLoader = true;
    emit(GetQuizQuestionsLoadingState());

    final result = await getQuizQuestionsUsecase.call(
      parameter: GetQuizQuestionsParameters(
        userId: userId,
        quizId: quizId,
        programId: programId,
      ),
    );

    result.fold(
      (failure) {
        getQuizQuestionsLoader = false;
        emit(GetQuizQuestionsErrorState(errorMessage: failure.message));
      },
      (data) {
        getQuizQuestionsLoader = false;
        getQuizQuestionsEntity = data;
        emit(GetQuizQuestionsSuccessState());
      },
    );
  }

  // متغيرات submitQuiz
  bool submitQuizLoader = false;
  SubmitQuizEntity? submitQuizEntity;

  Future<void> submitQuiz({
    required int quizId,
    required int qIndex,
  }) async {
    int questionOptionId = -1;
    // mulipleChoiceIndex =

    List<QuizAnswer> quizAnswer = List.generate(
      getQuizQuestionsEntity?.data?.questions?.length ?? 0,
      (index) {
        var question = getQuizQuestionsEntity?.data?.questions?[index];
        switch (question?.type) {
          case "true_false":
            questionOptionId = question?.options?[trueFalseIndex[qIndex]].id ?? -1;
            break;
          case "text":
            break;
          case "multiple_choice":
            // int optionId = mulipleChoiceOptionIndex.
            questionOptionId =
                question?.options?[mulipleChoiceOptionIndex[qIndex]].id ?? -1;

            break;
          default:
        }

        return QuizAnswer(
          questionId: question?.id ?? -1,
          answer: essayAnswerController?.text, // في حالة ان السؤال مقالي
          questionOptionId: questionOptionId,
        );
      },
    );
    SubmitQuizTojson data = SubmitQuizTojson(
      quizId: quizId,
      answers: quizAnswer,
    );
    submitQuizLoader = true;
    emit(SubmitQuizLoadingState());

    final result = await submitQuizUsecase.call(
      parameter: SubmitQuizParameters(
        data: data,
      ),
    );

    result.fold(
      (failure) {
        submitQuizLoader = false;
        emit(SubmitQuizErrorState(errorMessage: failure.message));
      },
      (data) {
        submitQuizLoader = false;
        submitQuizEntity = data;
        clearAfterSubmit();
        emit(SubmitQuizSuccessState());
      },
    );
  }

  void clearAfterSubmit() {
    essayAnswerController?.clear();
    for (var element in mulipleChoiceOptionIndex) {
      element = 0;
    }
  }

  @override
  Future<void> close() {
    essayAnswerController?.dispose();
    return super.close();
  }
}
