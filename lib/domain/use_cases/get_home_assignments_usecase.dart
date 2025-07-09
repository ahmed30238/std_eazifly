import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/home/get_home_assigments_entity.dart';

class GetHomeAssignmentsUsecase extends BaseUsecase<GetHomeAssignmentsEntity,
    GetHomeAssignmentsParameters> {
  final BaseRepository baseRepository;

  GetHomeAssignmentsUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetHomeAssignmentsEntity>> call(
      {required GetHomeAssignmentsParameters parameter}) async {
    return await baseRepository.getHomeAssigments(userId: parameter.userId);
  }
}

class GetHomeAssignmentsParameters {
  final int userId;

  GetHomeAssignmentsParameters({required this.userId});
}
