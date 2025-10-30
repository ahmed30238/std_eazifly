import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/subscription_management/remove_assigned_student_entity.dart';

class RemoveAssignedStudentUsecase
    extends
        BaseUsecase<
          RemoveAssignedStudentEntity,
          RemoveAssignedStudetParameters
        > {
  final BaseRepository baseRepository;

  RemoveAssignedStudentUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, RemoveAssignedStudentEntity>> call({
    required RemoveAssignedStudetParameters parameter,
  }) async {
    return await baseRepository.removeAssignedStudent(
      userId: parameter.userId,
      programId: parameter.programId,
    );
  }
}

class RemoveAssignedStudetParameters {
  final int userId;
  final int programId;

  RemoveAssignedStudetParameters({
    required this.programId,
    required this.userId,
  });
}
