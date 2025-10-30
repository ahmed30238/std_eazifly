import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/my_programs/quizzes/submit_quiz_to_json.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/my_programs/quizzes/submit_quiz_entity.dart';

class SubmitQuizUsecase
    extends BaseUsecase<SubmitQuizEntity, SubmitQuizParameters> {
  final BaseRepository baseRepository;

  SubmitQuizUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, SubmitQuizEntity>> call({
    required SubmitQuizParameters parameter,
  }) async {
    return await baseRepository.submitQuiz(data: parameter.data);
  }
}

class SubmitQuizParameters {
  final SubmitQuizTojson data;

  SubmitQuizParameters({required this.data});
}
