import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/get_geidea_settings/get_geidea_data_entity.dart';

class GetGeideaDataUsecase
    extends BaseUsecase<GetGeideaDataEntity, GetGeideaDataParameters> {
  final BaseRepository baseRepository;

  GetGeideaDataUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetGeideaDataEntity>> call(
      {required GetGeideaDataParameters parameter}) async {
    return await baseRepository.geideaData(key: parameter.key);
  }
}

class GetGeideaDataParameters {
  final String key;

  GetGeideaDataParameters({required this.key});
}
