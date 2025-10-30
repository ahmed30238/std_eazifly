import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/get_program_details_entities.dart';

class GetProgramDetailsUsecase
    extends BaseUsecase<GetProgramDetailsEntity, ProgramDetailsParameters> {
  final BaseRepository baseRepository;

  GetProgramDetailsUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetProgramDetailsEntity>> call({
    required ProgramDetailsParameters parameter,
  }) async {
    return await baseRepository.getProgramDetails(
      programId: parameter.programId,
    );
  }
}

class ProgramDetailsParameters {
  final int programId;

  ProgramDetailsParameters({required this.programId});
}
