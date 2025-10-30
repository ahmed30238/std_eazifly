import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/subscription_management/show_plan_entity.dart';

class ShowPlanUsecase extends BaseUsecase<ShowPlanEntity, ShowPlanParameters> {
  final BaseRepository baseRepository;

  ShowPlanUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, ShowPlanEntity>> call({
    required ShowPlanParameters parameter,
  }) async {
    return await baseRepository.showPlan(planId: parameter.planId);
  }
}

class ShowPlanParameters {
  final int planId;

  ShowPlanParameters({required this.planId});
}
