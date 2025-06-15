import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/get_plan_with_details_entities.dart';

class GetPlanWithDetailsUsecase extends BaseUsecase<GetPlansWithDetailsEntity,
    GetPlansWithDetailsParameters> {
  final BaseRepository baseRepository;

  GetPlanWithDetailsUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetPlansWithDetailsEntity>> call(
      {required GetPlansWithDetailsParameters parameter}) async {
    return await baseRepository.getPlansWithDetails(
      programId: parameter.programId,
      days: parameter.days,
    );
  }
}

class GetPlansWithDetailsParameters {
  final int programId;
  final int days;

  GetPlansWithDetailsParameters({required this.programId, required this.days});
}
