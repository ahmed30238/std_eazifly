import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/user/copoun_history_entity.dart';

class CopounHistoryUsecase
    extends BaseUsecase<CopounHistoryEntity, NoParameter> {
  final BaseRepository baseRepository;

  CopounHistoryUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, CopounHistoryEntity>> call(
      {required NoParameter parameter}) async {
    return await baseRepository.copounHistory();
  }
}
