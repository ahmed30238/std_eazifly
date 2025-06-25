import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_report_questions_entity.dart';

class GetReportQuestionsUsecase
    extends BaseUsecase<GetReportQuestionsEntity, GetQuizQuestionsParameters> {
  final BaseRepository baseRepository;

  GetReportQuestionsUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetReportQuestionsEntity>> call(
      {required GetQuizQuestionsParameters parameter}) async {
    return await baseRepository.getReportQuestions(
      meetingSessionId: parameter.meetingSessionId,
      reportForId: parameter.reportForId,
      reportForType: parameter.reportForType,
      reportMakerId: parameter.reportMakerId,
      reportMakerType: parameter.reportMakerType,
    );
  }
}

class GetQuizQuestionsParameters {
  final int meetingSessionId;
  final int reportForId;
  final String reportForType;
  final int reportMakerId;
  final String reportMakerType;

  GetQuizQuestionsParameters({
    required this.meetingSessionId,
    required this.reportForId,
    required this.reportForType,
    required this.reportMakerId,
    required this.reportMakerType,
  });
}
