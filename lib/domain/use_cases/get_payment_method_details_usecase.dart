import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/get_payment_method_details_entities.dart';

class GetPaymentMethodDetailsUsecase
    extends
        BaseUsecase<
          GetPaymentMethodDetailsEntity,
          GetPaymentMethodDetailsParameters
        > {
  final BaseRepository baseRepository;

  GetPaymentMethodDetailsUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetPaymentMethodDetailsEntity>> call({
    required GetPaymentMethodDetailsParameters parameter,
  }) async {
    return await baseRepository.getPaymentMethodDetails(
      methodId: parameter.methodId,
      programId: parameter.programId,
    );
  }
}

class GetPaymentMethodDetailsParameters {
  final int methodId;
  final int programId;

  GetPaymentMethodDetailsParameters({
    required this.methodId,
    required this.programId,
  });
}
