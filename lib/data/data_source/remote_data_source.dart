import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:eazifly_student/core/exceptions/exceptions.dart';
import 'package:eazifly_student/core/network/end_points.dart';
import 'package:eazifly_student/core/network/error_message_model.dart';
import 'package:eazifly_student/core/network/networkcall.dart';
import 'package:eazifly_student/data/models/auth/login_model.dart';
import 'package:eazifly_student/data/models/programs/assign_program_review_model.dart';
import 'package:eazifly_student/data/models/programs/assign_program_review_tojson.dart';
import 'package:eazifly_student/data/models/programs/get_program_details_model.dart';
import 'package:eazifly_student/data/models/programs/get_programs_model.dart';

abstract class BaseRemoteDataSource {
  // Define methods that will be implemented by the RemoteDataSource class
  // For example:
  // Future<LoginModel> login(String email, String password);

  Future<LoginModel> login(String email, String password);
  Future<GetProgramsModel> getPrograms();
  Future<GetProgramDetailsModel> getProgramDetails({required int programId});
  Future<AssignProgramReviewModel> assignProgramReview(
      {required AssignProgramReviewTojson data});
}

class RemoteDataSource extends BaseRemoteDataSource {
  @override
  Future<LoginModel> login(String email, String password) async {
    var response = await NetworkCall().post(
        path: EndPoints.login,
        data: FormData.fromMap({
          "user_name": email,
          "password": password,
        }));
    log("$response $email $password");
    if (response?.statusCode == 200) {
      return LoginModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetProgramsModel> getPrograms() async {
    var response = await NetworkCall().get(
      path: EndPoints.getPrograms,
    );
    if (response?.statusCode == 200) {
      return GetProgramsModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetProgramDetailsModel> getProgramDetails(
      {required int programId}) async {
    var response = await NetworkCall().get(
      path: EndPoints.getProgramDetails(programId: programId),
    );
    if (response?.statusCode == 200) {
      return GetProgramDetailsModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<AssignProgramReviewModel> assignProgramReview(
      {required AssignProgramReviewTojson data}) async {
    var response = await NetworkCall().post(
        path: EndPoints.assignProgramReview,
        data: FormData.fromMap(data.toJson()));
    if (response?.statusCode == 200) {
      return AssignProgramReviewModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }
}
