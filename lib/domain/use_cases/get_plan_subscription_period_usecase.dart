import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/get_plan_subscription_period_entity.dart';

class GetPlanSubscriptionPeriodUsecase
    extends BaseUsecase<GetPlanSubscriptionPeriodEntity, NoParameter> {
  final BaseRepository baseRepository;

  GetPlanSubscriptionPeriodUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetPlanSubscriptionPeriodEntity>> call(
      {required NoParameter parameter}) async {
    return await baseRepository.getPlanSubscriptionPeriod();
  }
}
