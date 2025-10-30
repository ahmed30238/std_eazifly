import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/my_programs/join_session_tojson.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/my_programs/join_session_entity.dart';

class JoinSessionUsecase
    extends BaseUsecase<JoinSessionEntity, JoinSessionParatmeters> {
  final BaseRepository baseRepository;

  JoinSessionUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, JoinSessionEntity>> call({
    required JoinSessionParatmeters parameter,
  }) async {
    return await baseRepository.joinSession(data: parameter.data);
  }
}

class JoinSessionParatmeters {
  final JoinSessionTojson data;

  JoinSessionParatmeters({required this.data});
}
