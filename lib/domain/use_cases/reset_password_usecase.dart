import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/auth/reset_password_tojson.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/auth/reset_password_entity.dart';

class ResetPasswordUsecase
    extends BaseUsecase<ResetPasswordEntity, ResetPasswordParameters> {
  final BaseRepository baseRepository;

  ResetPasswordUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, ResetPasswordEntity>> call({
    required ResetPasswordParameters parameter,
  }) async {
    return await baseRepository.resetPassword(data: parameter.data);
  }
}

class ResetPasswordParameters {
  final ResetPasswordToJson data;

  ResetPasswordParameters({required this.data});
}
