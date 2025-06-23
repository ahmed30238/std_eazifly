import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/subscription_management/cancel_subscription_entity.dart';

class CancelSubscriptionUsecase extends BaseUsecase<CancelSubscriptionEntity,
    CancelSubscriptionParameters> {
  final BaseRepository baseRepository;

  CancelSubscriptionUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, CancelSubscriptionEntity>> call(
      {required CancelSubscriptionParameters parameter}) async {
    return await baseRepository.cancelSubscription(mainId: parameter.mainId);
  }
}

class CancelSubscriptionParameters {
  final int mainId;

  CancelSubscriptionParameters({required this.mainId});
}
