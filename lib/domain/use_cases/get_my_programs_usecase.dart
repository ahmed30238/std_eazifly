import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_my_programs_entity.dart';

class GetMyProgramsUsecase
    extends BaseUsecase<GetMyProgramsEntity, NoParameter> {
  final BaseRepository baseRepository;

  GetMyProgramsUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetMyProgramsEntity>> call({
    required NoParameter parameter,
  }) async {
    return baseRepository.getMyPrograms();
  }
}
