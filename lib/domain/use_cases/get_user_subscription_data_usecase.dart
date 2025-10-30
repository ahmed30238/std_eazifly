import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/change_instructor/get_user_subscription_data_entity.dart';

class GetUserSubscriptionDataUsecase
    extends
        BaseUsecase<
          GetUserSubscriptionDataEntity,
          GetUserSubscriptionDataParameters
        > {
  final BaseRepository baseRepository;

  GetUserSubscriptionDataUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetUserSubscriptionDataEntity>> call({
    required GetUserSubscriptionDataParameters parameter,
  }) async {
    return await baseRepository.getUserSubscriptionData(
      programId: parameter.programId,
      userId: parameter.userId,
    );
  }
}

class GetUserSubscriptionDataParameters {
  final int programId;
  final int userId;

  GetUserSubscriptionDataParameters({
    required this.programId,
    required this.userId,
  });
}
