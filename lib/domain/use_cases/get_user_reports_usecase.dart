import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_user_reports_entity.dart';

class GetUserReportsUsecase
    extends BaseUsecase<GetUserReportsEntity, GetUserReportsParameters> {
  final BaseRepository baseRepository;

  GetUserReportsUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetUserReportsEntity>> call(
      {required GetUserReportsParameters parameter}) async {
    return await baseRepository.getUserReports(userId: parameter.userId);
  }
}

class GetUserReportsParameters {
  final int userId;

  GetUserReportsParameters({required this.userId});
}
