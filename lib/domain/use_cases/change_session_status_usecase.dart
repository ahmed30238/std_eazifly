import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/my_programs/change_session_status_tojson.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/my_programs/change_session_status_entity.dart';

class ChangeSessionStatusUsecase extends BaseUsecase<ChangeSessionStatusEntity,
    ChangeSessionStatusParameters> {
  final BaseRepository baseRepository;

  ChangeSessionStatusUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, ChangeSessionStatusEntity>> call(
      {required ChangeSessionStatusParameters parameter}) async {
    return await baseRepository.changeSessionStatus(data: parameter.data);
  }
}

class ChangeSessionStatusParameters {
  final ChangeSessionStatusToJson data;

  ChangeSessionStatusParameters({required this.data});
}
