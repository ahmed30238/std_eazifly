import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/get_plans_entities.dart';

class GetPlansUsecase extends BaseUsecase<GetPlansEntity, GetPlansParameters> {
  final BaseRepository baseRepository;

  GetPlansUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetPlansEntity>> call({
    required GetPlansParameters parameter,
  }) async {
    return await baseRepository.getPlans(programId: parameter.programId);
  }
}

class GetPlansParameters {
  final int programId;

  GetPlansParameters({required this.programId});
}
