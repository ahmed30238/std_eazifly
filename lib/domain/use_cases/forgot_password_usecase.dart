import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/auth/forgot_password_entity.dart';

class ForgotPasswordUsecase
    extends BaseUsecase<ForgotPasswordEntity, ForgotPasswordParameters> {
  final BaseRepository baseRepository;

  ForgotPasswordUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, ForgotPasswordEntity>> call({
    required ForgotPasswordParameters parameter,
  }) async {
    return await baseRepository.forgotPassword(email: parameter.email);
  }
}

class ForgotPasswordParameters {
  final String email;

  ForgotPasswordParameters({required this.email});
}
