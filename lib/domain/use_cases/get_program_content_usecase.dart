import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/my_programs/content/get_program_content_entity.dart';

class GetProgramContentUsecase
    extends BaseUsecase<GetProgramContentEntity, GetProgramContentParameters> {
  final BaseRepository baseRepository;

  GetProgramContentUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetProgramContentEntity>> call({
    required GetProgramContentParameters parameter,
  }) async {
    return await baseRepository.getProgramContent(
      programId: parameter.programId,
    );
  }
}

class GetProgramContentParameters {
  final int programId;

  GetProgramContentParameters({required this.programId});
}
