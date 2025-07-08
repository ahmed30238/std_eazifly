
import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/home/get_home_closest_sessions_entity.dart';

class GetHomeClosestSessionsUsecase
    extends BaseUsecase<GetHomeClosestSessionsEntity, GetHomeClosestSessionsParameters> {
  final BaseRepository baseRepository;

  GetHomeClosestSessionsUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetHomeClosestSessionsEntity>> call(
      {required GetHomeClosestSessionsParameters parameter}) async {
    return await baseRepository.getHomeClosestSessions(userId: parameter.userId);
  }
}

class GetHomeClosestSessionsParameters {
  final int userId;

  GetHomeClosestSessionsParameters({required this.userId});
}