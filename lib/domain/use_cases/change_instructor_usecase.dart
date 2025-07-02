// 2. Change Instructor Use Case
import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/change_instructor/change_instructor_tojson.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/change_instructor/change_instructor_entity.dart';

class ChangeInstructorUsecase extends BaseUsecase<ChangeInstructorEntity,
    ChangeInstructorParameters> {
  final BaseRepository baseRepository;
  
  ChangeInstructorUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, ChangeInstructorEntity>> call(
      {required ChangeInstructorParameters parameter}) async {
    return await baseRepository.changeInstructor(
      data: parameter.data,
    );
  }
}

class ChangeInstructorParameters {
  final ChangeInstructorTojson data;
  
  ChangeInstructorParameters({required this.data});
}