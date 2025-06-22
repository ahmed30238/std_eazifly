import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/my_programs/post_assignment_tojson.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/my_programs/post_assignment_entity.dart';

class PostAssignmentUsecase
    extends BaseUsecase<PostAssignmentEntity, PostAssignmentParameters> {
  final BaseRepository baseRepository;

  PostAssignmentUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, PostAssignmentEntity>> call(
      {required PostAssignmentParameters parameter}) async {
    return await baseRepository.postAssignment(
      data: parameter.data,
    );
  }
}

class PostAssignmentParameters {
  final PostAssignmentTojson data;

  PostAssignmentParameters({required this.data});
}
