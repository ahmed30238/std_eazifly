import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/get_program_payment_methods_entities.dart';

class GetProgramPaymentMethodsUsecase
    extends
        BaseUsecase<
          GetProgramPaymentMethodsEntity,
          GetProgramPaymentMethodsParameters
        > {
  final BaseRepository baseRepository;

  GetProgramPaymentMethodsUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetProgramPaymentMethodsEntity>> call({
    required GetProgramPaymentMethodsParameters parameter,
  }) async {
    return await baseRepository.getProgramPaymentMethods(
      programId: parameter.programId,
    );
  }
}

class GetProgramPaymentMethodsParameters {
  final int programId;

  GetProgramPaymentMethodsParameters({required this.programId});
}
