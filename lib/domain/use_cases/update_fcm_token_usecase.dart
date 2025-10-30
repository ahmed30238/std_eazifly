import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/update_fcm_token_entity.dart';

class UpdateFcmTokenUsecase
    extends BaseUsecase<UpdateFcmTokenEntity, UpdateFcmTokenParameter> {
  final BaseRepository baseRepository;
  UpdateFcmTokenUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, UpdateFcmTokenEntity>> call({
    required UpdateFcmTokenParameter parameter,
  }) async {
    return await baseRepository.updateFcmToken(fcmToken: parameter.fcmToken);
  }
}

class UpdateFcmTokenParameter {
  final String fcmToken;
  UpdateFcmTokenParameter({required this.fcmToken});
}
