import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/sessions/get_instructor_availabilities_entity.dart';

class GetInstructorAvailabilitiesUsecase
    extends
        BaseUsecase<
          GetInstructorAvailabilitiesEntity,
          GetInstructorAvailabilitiesParameters
        > {
  final BaseRepository baseRepository;

  GetInstructorAvailabilitiesUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetInstructorAvailabilitiesEntity>> call({
    required GetInstructorAvailabilitiesParameters parameter,
  }) async {
    return await baseRepository.getInstructorAvailabilities(
      instructorId: parameter.instructorId,
      expireDate: parameter.expireDate,
      duration: parameter.duration,
    );
  }
}

class GetInstructorAvailabilitiesParameters {
  final int instructorId;
  final int duration;
  final String expireDate;

  GetInstructorAvailabilitiesParameters({
    required this.instructorId,
    required this.duration,
    required this.expireDate,
  });
}
