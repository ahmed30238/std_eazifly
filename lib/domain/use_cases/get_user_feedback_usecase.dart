import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_user_feedbacks_entity.dart';

class GetUserFeedbackUsecase
    extends BaseUsecase<GetUserFeedbacksEntity, GetUserFeedbackParameters> {
  final BaseRepository baseRepository;

  GetUserFeedbackUsecase({required this.baseRepository});
  @override
  Future<Either<Failure, GetUserFeedbacksEntity>> call(
      {required GetUserFeedbackParameters parameter}) async {
    return await baseRepository.getUserFeedbacks(userId: parameter.userId);
  }
}

class GetUserFeedbackParameters {
  final int userId;

  GetUserFeedbackParameters({required this.userId});
}
