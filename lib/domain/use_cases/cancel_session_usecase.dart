import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/sessions/cancel_session_tojson.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/sessions/cancel_session_entity.dart';

class CancelSessionUsecase
    extends BaseUsecase<CancelSessionEntity, CancelSessionParameters> {
  final BaseRepository baseRepository;

  CancelSessionUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, CancelSessionEntity>> call({
    required CancelSessionParameters parameter,
  }) async {
    return await baseRepository.cancelSession(data: parameter.data);
  }
}

class CancelSessionParameters {
  final CancelSessionTojson data;

  CancelSessionParameters({required this.data});
}
