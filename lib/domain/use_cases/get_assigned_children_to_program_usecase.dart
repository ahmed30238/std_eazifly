import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_assigned_children_to_program_entity.dart';

class GetAssignedChildrenToProgramUsecase extends BaseUsecase<
    GetAssignedChildrenToProgramEntity,
    GetAssignedChildrenToProgramParameters> {
  final BaseRepository baseRepository;

  GetAssignedChildrenToProgramUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetAssignedChildrenToProgramEntity>> call(
      {required GetAssignedChildrenToProgramParameters parameter}) async {
    return await baseRepository.getAssignedChildrenToProgram(
        programId: parameter.programId);
  }
}

class GetAssignedChildrenToProgramParameters {
  final int programId;

  GetAssignedChildrenToProgramParameters({required this.programId});
}
