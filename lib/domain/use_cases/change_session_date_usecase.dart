import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/sessions/change_session_date_tojson.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/sessions/change_session_date_entity.dart';

class ChangeSessionDateUsecase
    extends BaseUsecase<ChangeSessionDateEntity, ChangeSessionDateParameters> {
  final BaseRepository baseRepository;

  ChangeSessionDateUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, ChangeSessionDateEntity>> call(
      {required ChangeSessionDateParameters parameter}) async {
    return await baseRepository.changeSessionDate(
      data: parameter.data,
      sessionId: parameter.sessionId,
    );
  }
}

class ChangeSessionDateParameters {
  final ChangeSessionDateTojson data;
  final int sessionId;

  ChangeSessionDateParameters({
    required this.data,
    required this.sessionId,
  });
}
