import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_session_details_entity.dart';

class GetSessionDetailsUsecase
    extends BaseUsecase<GetSessionDetailsEntity, GetSessionDetailsParameters> {
  final BaseRepository baseRepository;

  GetSessionDetailsUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetSessionDetailsEntity>> call(
      {required GetSessionDetailsParameters parameter}) async {
    return await baseRepository.getSessionDetails(
        sessionId: parameter.sessionId);
  }
}

class GetSessionDetailsParameters {
  final int sessionId;

  GetSessionDetailsParameters({required this.sessionId});
}
