import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/get_library_plans_entity.dart';

class GetLibraryPlansUsecase
    extends BaseUsecase<GetLibraryPlansEntity, GetLibraryPlansParameters> {
  final BaseRepository baseRepository;

  GetLibraryPlansUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetLibraryPlansEntity>> call(
      {required GetLibraryPlansParameters parameter}) async {
    return await baseRepository.getLibraryPlans(days: parameter.days);
  }
}

class GetLibraryPlansParameters {
  final int days;

  GetLibraryPlansParameters({required this.days});
}
