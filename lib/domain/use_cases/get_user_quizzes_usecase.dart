import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/my_programs/quizzes/get_user_quizzes_entity.dart';
class GetUserQuizzesUsecase
    extends BaseUsecase<GetUserQuizzesEntity, GetUserQuizzesParameters> {
  final BaseRepository baseRepository;
  
  GetUserQuizzesUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetUserQuizzesEntity>> call(
      {required GetUserQuizzesParameters parameter}) async {
    return await baseRepository.getUserQuizzes(
      userId: parameter.userId,
      programId: parameter.programId,
    );
  }
}

class GetUserQuizzesParameters {
  final int userId;
  final int programId;
  
  GetUserQuizzesParameters({
    required this.userId,
    required this.programId,
  });
}