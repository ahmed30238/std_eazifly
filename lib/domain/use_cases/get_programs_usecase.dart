import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/get_programs_entities.dart';

class GetProgramsUsecase extends BaseUsecase<GetProgramsEntity, NoParameter> {
  final BaseRepository baseRepository;

  GetProgramsUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetProgramsEntity>> call({
    NoParameter? parameter,
  }) async {
    return await baseRepository.getPrograms();
  }
}
