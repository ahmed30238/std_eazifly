import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/subscription_management/get_program_subscription_entity.dart';

class GetProgramSubscriptionsUsecase
    extends BaseUsecase<GetProgramSubscriptionEntity, NoParameter> {
  final BaseRepository baseRepository;

  GetProgramSubscriptionsUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetProgramSubscriptionEntity>> call({
    NoParameter? parameter,
  }) async {
    return await baseRepository.getProgramSubscription();
  }
}
