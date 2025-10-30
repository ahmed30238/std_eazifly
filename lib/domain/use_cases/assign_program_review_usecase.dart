import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/programs/assign_program_review_tojson.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/assign_program_review_entities.dart';
import 'package:equatable/equatable.dart';

class AssignProgramReviewUsecase
    extends
        BaseUsecase<AssignProgramReviewEntity, AssignProgramReviewParameter> {
  final BaseRepository baseRepository;
  AssignProgramReviewUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, AssignProgramReviewEntity>> call({
    required AssignProgramReviewParameter parameter,
  }) async {
    return await baseRepository.assignProgramReview(data: parameter.data);
  }
}

class AssignProgramReviewParameter extends Equatable {
  final AssignProgramReviewTojson data;

  const AssignProgramReviewParameter({required this.data});

  @override
  List<Object> get props => [data];
}
