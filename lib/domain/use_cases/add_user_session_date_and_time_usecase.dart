import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/user/add_user_session_date_and_time_tojson.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/user/add_user_session_date_and_time_entity.dart';

class AddUserSessionDateAndTimeUseCase
    extends
        BaseUsecase<
          AddUserSessionDateAndTimeEntity,
          AddUserSessionDateAndTimeParameters
        > {
  final BaseRepository baseRepository;

  AddUserSessionDateAndTimeUseCase({required this.baseRepository});

  @override
  Future<Either<Failure, AddUserSessionDateAndTimeEntity>> call({
    required AddUserSessionDateAndTimeParameters parameter,
  }) async {
    return await baseRepository.addUserSessionDateAndTime(data: parameter.data);
  }
}

class AddUserSessionDateAndTimeParameters {
  final AddUserSessionDateAndTimeToJson data;

  AddUserSessionDateAndTimeParameters({required this.data});
}
