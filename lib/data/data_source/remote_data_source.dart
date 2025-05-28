import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:eazifly_student/core/exceptions/exceptions.dart';
import 'package:eazifly_student/core/network/end_points.dart';
import 'package:eazifly_student/core/network/error_message_model.dart';
import 'package:eazifly_student/core/network/networkcall.dart';
import 'package:eazifly_student/data/models/auth/login_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/check_copoun_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/check_copoun_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/create_order_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/create_order_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/filter_plan_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/filter_plans_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/get_plan_with_details_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/get_plans_model.dart';
import 'package:eazifly_student/data/models/programs/assign_program_review_model.dart';
import 'package:eazifly_student/data/models/programs/assign_program_review_tojson.dart';
import 'package:eazifly_student/data/models/programs/get_program_details_model.dart';
import 'package:eazifly_student/data/models/programs/get_programs_model.dart';

abstract class BaseRemoteDataSource {
  Future<LoginModel> login(String email, String password);
  Future<GetProgramsModel> getPrograms();
  Future<GetProgramDetailsModel> getProgramDetails({required int programId});
  Future<AssignProgramReviewModel> assignProgramReview(
      {required AssignProgramReviewTojson data});
  Future<GetPlansWithDetailsModel> getPlansWithDetails({required int planId});
  Future<GetPlansModel> getPlans({required int programId});
  Future<FilterPlansModel> filterPlans({required FilterPlansTojson data});
  Future<CreateOrderModel> createOrder({required CreateOrderTojson data});
  Future<CheckCopounModel> checkCopoun({required CheckCopounTojson data});
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

  @override
  Future<GetPlansWithDetailsModel> getPlansWithDetails(
      {required int planId}) async {
    var response = await NetworkCall().get(
      path: EndPoints.getPlansWithDetails(planId: planId),
    );
    if (response?.statusCode == 200) {
      return GetPlansWithDetailsModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetPlansModel> getPlans({required int programId}) async {
    var response = await NetworkCall().get(
      path: EndPoints.getPlans(programId: programId),
    );
    if (response?.statusCode == 200) {
      return GetPlansModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<FilterPlansModel> filterPlans(
      {required FilterPlansTojson data}) async {
    var response = await NetworkCall().post(
        path: EndPoints.filterPlan, data: FormData.fromMap(data.tojson()));
    if (response?.statusCode == 200) {
      return FilterPlansModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<CreateOrderModel> createOrder(
      {required CreateOrderTojson data}) async {
    var response = await NetworkCall()
        .post(path: EndPoints.createOrder, data: data.toJson());
    if (response?.statusCode == 200) {
      return CreateOrderModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<CheckCopounModel> checkCopoun(
      {required CheckCopounTojson data}) async {
    var response = await NetworkCall().post(
      path: EndPoints.checkCopoun,
      data: FormData.fromMap(data.toJson()),
    );
    if (response?.statusCode == 200) {
      return CheckCopounModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }
}
