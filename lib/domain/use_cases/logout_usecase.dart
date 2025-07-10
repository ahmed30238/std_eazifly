import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/notification/auth/logout_entity.dart';

class LogoutUsecase extends BaseUsecase<LogoutEntity, NoParameter> {
  final BaseRepository baseRepository;

  LogoutUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, LogoutEntity>> call(
      {required NoParameter parameter}) async {
    return await baseRepository.logout();
  }
}
