import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/my_programs/quizzes/get_quiz_questions_entity.dart';

class GetQuizQuestionsUsecase
    extends BaseUsecase<GetQuizQuestionsEntity, GetQuizQuestionsParameters> {
  final BaseRepository baseRepository;

  GetQuizQuestionsUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetQuizQuestionsEntity>> call({
    required GetQuizQuestionsParameters parameter,
  }) async {
    return await baseRepository.getQuizQuestions(
      userId: parameter.userId,
      quizId: parameter.quizId,
      programId: parameter.programId,
    );
  }
}

class GetQuizQuestionsParameters {
  final int userId;
  final int quizId;
  final int programId;

  GetQuizQuestionsParameters({
    required this.userId,
    required this.quizId,
    required this.programId,
  });
}
