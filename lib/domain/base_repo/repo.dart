import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/programs/assign_program_review_tojson.dart';
import 'package:eazifly_student/domain/entities/assign_program_review_entities.dart';
import 'package:eazifly_student/domain/entities/get_program_details_entities.dart';
import 'package:eazifly_student/domain/entities/get_programs_entities.dart';
import 'package:eazifly_student/domain/entities/login_entities.dart';

abstract class BaseRepository {
  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, GetProgramsEntity>> getPrograms();
  Future<Either<Failure, GetProgramDetailsEntity>> getProgramDetails(
      {required int programId});
  Future<Either<Failure, AssignProgramReviewEntity>> assignProgramReview(
      {required AssignProgramReviewTojson data});
}
