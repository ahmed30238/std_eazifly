import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/auth/register_tojson.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/auth/register_entities.dart';

class RegisterUsecase extends BaseUsecase<RegisterEntity, RegisterParameters> {
  final BaseRepository baseRepository;

  RegisterUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, RegisterEntity>> call(
      {required RegisterParameters parameter}) async {
    return await baseRepository.register(
      data: parameter.data,
    );
  }
}

class RegisterParameters {
  final RegisterToJson data;

  RegisterParameters({required this.data});
}
