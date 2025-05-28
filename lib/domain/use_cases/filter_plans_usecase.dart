import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/filter_plan_tojson.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/filter_plan_entities.dart';

class FilterPlansUsecase
    extends BaseUsecase<FilterPlansEntity, FilterPlansParameters> {
  final BaseRepository baseRepository;

  FilterPlansUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, FilterPlansEntity>> call(
      {required FilterPlansParameters parameter}) async {
    return await baseRepository.filterPlans(data: parameter.data);
  }
}

class FilterPlansParameters {
  final FilterPlansTojson data;

  FilterPlansParameters({required this.data});
}
