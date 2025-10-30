import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/assign_appointments/get_instructors_tojson.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/get_instructors_entity.dart';

class GetInstructorsUsecase
    extends BaseUsecase<GetInstructorsEntity, GetInstructorsParameters> {
  final BaseRepository baseRepository;

  GetInstructorsUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetInstructorsEntity>> call({
    required GetInstructorsParameters parameter,
  }) async {
    return await baseRepository.getInstructors(data: parameter.data);
  }
}

class GetInstructorsParameters {
  final GetInstructorsTojson data;

  GetInstructorsParameters({required this.data});
}
