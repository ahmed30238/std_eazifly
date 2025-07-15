import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/find_instructor/request_to_find_instructor_tojson.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/find_instructor/request_to_find_instructor_entity.dart';

class RequestToFindInstructorUsecase extends BaseUsecase<
    RequestToFindInstructorEntity, RequestToFindInstructorParameters> {
  final BaseRepository baseRepository;

  RequestToFindInstructorUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, RequestToFindInstructorEntity>> call(
      {required RequestToFindInstructorParameters parameter}) async {
    return await baseRepository.findInstructor(data: parameter.data);
  }
}

class RequestToFindInstructorParameters {
  final RequestToFindInstructorTojson data;

  RequestToFindInstructorParameters({required this.data});
}
