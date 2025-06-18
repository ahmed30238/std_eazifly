import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/my_programs/show_program_details_entity.dart';

class ShowProgramDetailsUsecase extends BaseUsecase<ShowProgramDetailsEntity,
    ShowProgramDetailsParameters> {
  final BaseRepository baseRepository;

  ShowProgramDetailsUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, ShowProgramDetailsEntity>> call(
      {required ShowProgramDetailsParameters parameter}) async {
    return await baseRepository.showProgramDetails(
        programId: parameter.programId);
  }
}

class ShowProgramDetailsParameters {
  final int programId;

  ShowProgramDetailsParameters({required this.programId});
}
