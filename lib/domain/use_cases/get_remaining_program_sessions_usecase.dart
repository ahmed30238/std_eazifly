import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/change_instructor/get_remaining_program_sessions_entity.dart';

// 1. Get Remaining Program Sessions Use Case
class GetRemainingProgramSessionsUsecase extends BaseUsecase<
    GetRemainingProgramSessionsEntity, GetRemainingProgramSessionsParameters> {
  final BaseRepository baseRepository;
  
  GetRemainingProgramSessionsUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetRemainingProgramSessionsEntity>> call(
      {required GetRemainingProgramSessionsParameters parameter}) async {
    return await baseRepository.getRemainingProgramSessions(
      userId: parameter.userId,
      programId: parameter.programId,
    );
  }
}

class GetRemainingProgramSessionsParameters {
  final int userId;
  final int programId;
  
  GetRemainingProgramSessionsParameters({
    required this.userId,
    required this.programId,
  });
}