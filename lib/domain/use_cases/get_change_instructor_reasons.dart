import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/change_instructor/get_change_instructor_reasons_entity.dart';

class GetChangeInstructorReasonsUsecase
    extends BaseUsecase<GetChangeInstructorReasonsEntity, NoParameter> {
  final BaseRepository baseRepository;

  GetChangeInstructorReasonsUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetChangeInstructorReasonsEntity>> call({
    required NoParameter parameter,
  }) async {
    return await baseRepository.getChangeInstructorReasons();
  }
}
