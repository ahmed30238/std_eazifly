import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/sessions/get_cancel_session_reason_entity.dart';

class GetCancelSessionReasonsUsecase
    extends BaseUsecase<GetCancelSessionReasonEntity, NoParameter> {
  final BaseRepository baseRepository;

  GetCancelSessionReasonsUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetCancelSessionReasonEntity>> call(
      {required NoParameter parameter}) async {
    return await baseRepository.gettCancelSessionReasons();
  }
}