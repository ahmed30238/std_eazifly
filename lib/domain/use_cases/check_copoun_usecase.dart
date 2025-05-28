import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/check_copoun_tojson.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/check_copoun_entities.dart';

class CheckCopounUsecase
    extends BaseUsecase<CheckCopounEntity, CheckCopounDataParameters> {
  final BaseRepository baseRepository;

  CheckCopounUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, CheckCopounEntity>> call(
      {required CheckCopounDataParameters parameter}) async {
    return await baseRepository.checkCopoun(data: parameter.data);
  }
}

class CheckCopounDataParameters {
  final CheckCopounTojson data;

  CheckCopounDataParameters({required this.data});
}
