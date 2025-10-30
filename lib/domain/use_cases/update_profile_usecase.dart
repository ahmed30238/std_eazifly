import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/user/update_profile_tojson.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/user/update_profile_entity.dart';

class UpdateProfileUsecase
    extends BaseUsecase<UpdateProfileEntity, UpdateProfileParameters> {
  final BaseRepository baseRepository;

  UpdateProfileUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, UpdateProfileEntity>> call({
    required UpdateProfileParameters parameter,
  }) async {
    return await baseRepository.updateProfile(
      data: parameter.data,
      userId: parameter.userId,
    );
  }
}

class UpdateProfileParameters {
  final UpdateProfileTojson data;
  final int userId;
  UpdateProfileParameters({required this.data, required this.userId});
}
