import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_program_sessions_entity.dart';

class GetProgramSessionsUsecase
    extends BaseUsecase<GetProgramSessionsEntity, GetProgramSessionParameters> {
  final BaseRepository baseRepository;

  GetProgramSessionsUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetProgramSessionsEntity>> call({
    required GetProgramSessionParameters parameter,
  }) async {
    return await baseRepository.getProgramSessions(
      programId: parameter.programId,
      userId: parameter.userId,
    );
  }
}

class GetProgramSessionParameters {
  final int programId;
  final int userId;

  GetProgramSessionParameters({required this.programId, required this.userId});
}
