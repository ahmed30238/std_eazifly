import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/home/get_home_quizzes_entity.dart';

class GetHomeQuizzesUsecase
    extends BaseUsecase<GetHomeQuizzesEntity, GetHomeQuizzesParameters> {
  final BaseRepository baseRepository;

  GetHomeQuizzesUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetHomeQuizzesEntity>> call(
      {required GetHomeQuizzesParameters parameter}) async {
    return await baseRepository.getHomeQuizzes(userId: parameter.userId);
  }
}

class GetHomeQuizzesParameters {
  final int userId;

  GetHomeQuizzesParameters({required this.userId});
}
