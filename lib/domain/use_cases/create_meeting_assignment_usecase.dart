import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/assign_appointments/create_meeting_sessions_tojson.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/create_meeting_sessions_entity.dart';

class CreateMeetingSessionsUsecase extends BaseUsecase<
    CreateMeetingSessionsEntity, CreateMeetingSessionsParameters> {
  final BaseRepository baseRepository;

  CreateMeetingSessionsUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, CreateMeetingSessionsEntity>> call(
      {required CreateMeetingSessionsParameters parameter}) async {
    return await baseRepository.createMeetingSessions(
      data: parameter.data,
    );
  }
}

class CreateMeetingSessionsParameters {
  final CreateMeetingSessionsTojson data;

  CreateMeetingSessionsParameters({required this.data});
}
