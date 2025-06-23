import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/subscription_management/renew_subscription_tojson.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/subscription_management/renew_subscription_entity.dart';

class RenewSubscriptionUsecase
    extends BaseUsecase<RenewSubscriptionEntity, RenewSubscriptionDataParameters> {
  final BaseRepository baseRepository;

  RenewSubscriptionUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, RenewSubscriptionEntity>> call(
      {required RenewSubscriptionDataParameters parameter}) async {
    return await baseRepository.renewSubscription(data: parameter.data);
  }
}

class RenewSubscriptionDataParameters {
  final RenewSubscriptionTojson data;

  RenewSubscriptionDataParameters({required this.data});
}
