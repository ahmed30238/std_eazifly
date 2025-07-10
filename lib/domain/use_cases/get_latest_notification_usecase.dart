import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/notification/get_latest_notifications_entities.dart';


class GetLatestNotificationUsecase extends BaseUsecase<
    GetLatestNotificationsEntities, GetLatestNotificationParameters> {
  final BaseRepository baseRepository;

  GetLatestNotificationUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetLatestNotificationsEntities>> call(
      {required GetLatestNotificationParameters parameter}) async {
    return await baseRepository.getLatestNotification(
      offset: parameter.offset,
      type: parameter.type,
    );
  }
}

class GetLatestNotificationParameters {
  final int offset;
  final String type;

  GetLatestNotificationParameters({
    required this.offset,
    required this.type,
  });
}
