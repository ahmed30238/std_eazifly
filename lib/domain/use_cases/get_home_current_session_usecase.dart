import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/home/get_home_current_session_entity.dart';

class GetHomeCurrentSessionUsecase extends BaseUsecase<
    GetHomeCurrentSessionEntity, GetHomeCurrentSessionParameters> {
  final BaseRepository baseRepository;

  GetHomeCurrentSessionUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetHomeCurrentSessionEntity>> call(
      {required GetHomeCurrentSessionParameters parameter}) async {
    return await baseRepository.getHomeCurrentSession(userId: parameter.userId);
  }
}

class GetHomeCurrentSessionParameters {
  final int userId;

  GetHomeCurrentSessionParameters({required this.userId});
}
