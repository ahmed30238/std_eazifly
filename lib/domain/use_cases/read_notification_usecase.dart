import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/notification/read_notification_entities.dart';


class ReadNotificationUsecase
    extends BaseUsecase<ReadNotificationEntities, ReadNotificationParameters> {
  final BaseRepository baseRepository;

  ReadNotificationUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, ReadNotificationEntities>> call(
      {required ReadNotificationParameters parameter}) async {
    return await baseRepository.readNotification(
      notificationId: parameter.notificationId,
    );
  }
}

class ReadNotificationParameters {
  final int notificationId;

  ReadNotificationParameters({required this.notificationId});
}
