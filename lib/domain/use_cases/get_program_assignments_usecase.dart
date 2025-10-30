import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_program_assignments_entity.dart';

class GetProgramAssignmentsUsecase
    extends
        BaseUsecase<
          GetProgramAssignmentsEntity,
          GetProgramAssignmentsParameters
        > {
  final BaseRepository baseRepository;

  GetProgramAssignmentsUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetProgramAssignmentsEntity>> call({
    required GetProgramAssignmentsParameters parameter,
  }) async {
    return await baseRepository.getProgramAssignments(
      programId: parameter.programId,
      userId: parameter.userId,
    );
  }
}

class GetProgramAssignmentsParameters {
  final int programId;
  final int userId;

  GetProgramAssignmentsParameters({
    required this.programId,
    required this.userId,
  });
}
