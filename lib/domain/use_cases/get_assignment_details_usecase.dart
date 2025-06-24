import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_assignment_details_entity.dart';

class GetAssignmentDetailsUsecase extends BaseUsecase<
    GetAssignmentDetailsEntity, GetAssignmentDetailsParameters> {
  final BaseRepository baseRepository;

  GetAssignmentDetailsUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetAssignmentDetailsEntity>> call(
      {required GetAssignmentDetailsParameters parameter}) async {
    return await baseRepository.getAssignmentDetails(
        assignmentId: parameter.assignmentId, userId: parameter.userId);
  }
}

class GetAssignmentDetailsParameters {
  final int assignmentId;
  final int userId;

  GetAssignmentDetailsParameters(
      {required this.assignmentId, required this.userId});
}
