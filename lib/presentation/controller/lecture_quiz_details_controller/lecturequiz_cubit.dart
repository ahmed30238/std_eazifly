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
  int trueFalseIndex = 0;
  void changeTrueFalse(int index) {
    trueFalseIndex = index;
    emit(ChangeTrueFalseIndexState());
  }

  TextEditingController essayAnswerController = TextEditingController();
  int mulipleChoiceIndex = 0;
  void changeMulipleChoice(int index) {
    mulipleChoiceIndex = index;
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
  }) async {
    int questionOptionId = -1;

    List<QuizAnswer> quizAnswer = List.generate(
      getQuizQuestionsEntity?.data?.questions?.length ?? 0,
      (index) {
        var question = getQuizQuestionsEntity?.data?.questions?[index];
        switch (question?.type) {
          case "true_false":
            questionOptionId = question?.options?[trueFalseIndex].id ?? -1;
            break;
          case "text":
            break;
          case "multiple_choice":
            questionOptionId = question?.options?[mulipleChoiceIndex].id ?? -1;

            break;
          default:
        }

        return QuizAnswer(
          questionId: question?.id ?? -1,
          answer: essayAnswerController.text, // في حالة ان السؤال مقالي
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
        emit(SubmitQuizSuccessState());
      },
    );
  }
}
