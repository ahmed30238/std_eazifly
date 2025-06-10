import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eazifly_student/core/exceptions/exceptions.dart';
import 'package:eazifly_student/core/network/end_points.dart';
import 'package:eazifly_student/core/network/error_message_model.dart';
import 'package:eazifly_student/core/network/networkcall.dart';
import 'package:eazifly_student/data/models/auth/login_model.dart';
import 'package:eazifly_student/data/models/library/favourite_list/add_single_item_to_fav_list_model.dart';
import 'package:eazifly_student/data/models/library/favourite_list/add_single_item_to_fav_tojson.dart';
import 'package:eazifly_student/data/models/library/favourite_list/get_favourite_list_items_using_list_id_model.dart';
import 'package:eazifly_student/data/models/library/favourite_list/get_favourite_list_model.dart';
import 'package:eazifly_student/data/models/library/favourite_list/store_favourite_list_model.dart';
import 'package:eazifly_student/data/models/library/favourite_list/store_favourite_list_tojson.dart';
import 'package:eazifly_student/data/models/library/get_all_items_model.dart';
import 'package:eazifly_student/data/models/library/get_all_library_lists_model.dart';
import 'package:eazifly_student/data/models/library/get_library_categories_model.dart';
import 'package:eazifly_student/data/models/library/get_list_items_using_list_id_model.dart';
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
import 'package:eazifly_student/data/models/order_and_subscribe/get_payment_method_details_model.dart';
import 'package:eazifly_student/data/models/programs/get_program_details_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/get_program_payment_methods_model.dart';
import 'package:eazifly_student/data/models/programs/get_programs_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/get_user_orders_model.dart';

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
  Future<GetProgramPaymentMethodsModel> getProgramPaymentMethods(
      {required int programId});
  Future<GetPaymentMethodDetailsModel> getPaymentMethodDetails(
      {required int programId, required int methodId});
  Future<GetUserOrdersModel> getUserOrders();
  Future<GetLibraryCategoriesModel> getLibraryCategories({String? type});
  Future<GetAllLibraryListsModel> getAllLibraryLists();
  Future<StoreFavouriteListModel> storeFavouriteList(
      {required StoreFavouriteListTojson data});
  Future<GetFavouriteListModel> getFavouriteList();
  Future<GetFavouriteListItemsUsingListIdModel> getFavouriteListItemsUsinListId(
      {required int listId});
  Future<GetAllItemsModel> getAllItems();
  Future<AddSingleItemToFavListModel> addSingleItemToFavList({
    required AddSingleItemToFavListTojson data,
  });
  Future<GetListItemsUsingListIdModel> getListItemsUsingListId({
    required int listId,
  });
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
    try {
      FormData formData = FormData();
      // formData.fields.addAll([
      //   MapEntry("code", data.code ?? ""),
      //   MapEntry("plan_id[]", data.planId.toString()),
      //   MapEntry("program_id[]", data.programId.toString()),
      //   // etc...
      // ]);

      if (data.code != null && data.code!.isNotEmpty) {
        formData.fields.add(MapEntry("code", data.code!));
      }

      if (data.planId != null) {
        for (var id in data.planId!) {
          formData.fields.add(MapEntry("plan_id[]", id.toString()));
        }
      }

      if (data.programId != null) {
        for (var id in data.programId!) {
          formData.fields.add(MapEntry("program_id[]", id.toString()));
        }
      }

      if (data.studentNumber != null) {
        for (var number in data.studentNumber!) {
          formData.fields.add(MapEntry("student_number[]", number.toString()));
        }
      }

      if (data.image != null && data.image!.isNotEmpty) {
        final File imageFile = File(data.image ?? "");
        if (await imageFile.exists()) {
          formData.files.add(
            MapEntry(
              "image",
              await MultipartFile.fromFile(
                data.image ?? "",
                filename: data.image?.split('/').last,
              ),
            ),
          );
          log('Image added to FormData: ${data.image?.split('/').last}');
        } else {
          throw Exception('Image file does not exist at path: ${data.image}');
        }
      }
//
      log('FormData fields: ${formData.fields.length}');
      log('FormData files: ${formData.files.length}');

      var response = await NetworkCall().post(
        path: EndPoints.createOrder,
        data: formData, // استخدم formData بدلاً من data.toJson()
        isMultipart: true,
      );

      if (response?.statusCode == 200) {
        return CreateOrderModel.fromJson(response?.data);
      } else {
        log('Error response: ${response?.data}');
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response?.data),
        );
      }
    } catch (e) {
      log('Error in createOrder remote: $e');
      rethrow;
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

  @override
  Future<GetProgramPaymentMethodsModel> getProgramPaymentMethods(
      {required int programId}) async {
    var response = await NetworkCall().get(
      path: EndPoints.getProgramPaymentMethods(programId: programId),
    );
    if (response?.statusCode == 200) {
      return GetProgramPaymentMethodsModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetPaymentMethodDetailsModel> getPaymentMethodDetails(
      {required int programId, required int methodId}) async {
    var response = await NetworkCall().get(
      path: EndPoints.getPaymentMethodDetails(
        methodId: methodId,
        programId: programId,
      ),
    );
    if (response?.statusCode == 200) {
      return GetPaymentMethodDetailsModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetUserOrdersModel> getUserOrders() async {
    var response = await NetworkCall().get(path: EndPoints.getUserOrders);
    if (response?.statusCode == 200) {
      return GetUserOrdersModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetLibraryCategoriesModel> getLibraryCategories({String? type}) async {
    var response = await NetworkCall()
        .get(path: EndPoints.getLibraryCategories(type: type));
    if (response?.statusCode == 200) {
      return GetLibraryCategoriesModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetAllLibraryListsModel> getAllLibraryLists() async {
    var response = await NetworkCall().get(path: EndPoints.getAllLibraryLists);
    if (response?.statusCode == 200) {
      return GetAllLibraryListsModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<StoreFavouriteListModel> storeFavouriteList(
      {required StoreFavouriteListTojson data}) async {
    try {
      FormData formData = FormData();
      for (var item in data.items) {
        formData.fields.add(MapEntry("items[]", item.toString()));
      }
      formData.fields.add(
        MapEntry(
          "title",
          data.title,
        ),
      );

      // إضافة الصورة إذا كانت موجودة
      if (data.image != null && data.image!.isNotEmpty) {
        final File imageFile = File(data.image!);
        if (await imageFile.exists()) {
          formData.files.add(
            MapEntry(
              "image",
              await MultipartFile.fromFile(
                data.image!,
                filename: data.image!.split('/').last,
              ),
            ),
          );
          log('Store image added to FormData: ${data.image!.split('/').last}');
        } else {
          throw Exception(
              'Store image file does not exist at path: ${data.image}');
        }
      }

      log('StreFavImage FormData fields: ${formData.fields.length}');
      log('StreFavImage FormData files: ${formData.files.length}');

      var response = await NetworkCall().post(
        path: EndPoints.storeFavouriteList,
        data: formData,
        isMultipart: true,
      );

      if (response?.statusCode == 200) {
        return StoreFavouriteListModel.fromJson(response?.data);
      } else {
        log('Store Fav Error response: ${response?.data}');
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response?.data),
        );
      }
    } catch (e) {
      log('Error in Store Fav remote: $e');
      rethrow;
    }
  }

  @override
  Future<GetFavouriteListModel> getFavouriteList() async {
    var response = await NetworkCall().get(path: EndPoints.getFavouriteList);
    if (response?.statusCode == 200) {
      return GetFavouriteListModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetFavouriteListItemsUsingListIdModel> getFavouriteListItemsUsinListId(
      {required int listId}) async {
    var response = await NetworkCall()
        .get(path: EndPoints.getFavouriteListItemsUsingListId(listId: listId));
    if (response?.statusCode == 200) {
      return GetFavouriteListItemsUsingListIdModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetAllItemsModel> getAllItems() async {
    var response = await NetworkCall().get(path: EndPoints.getAllItems);
    if (response?.statusCode == 200) {
      return GetAllItemsModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<AddSingleItemToFavListModel> addSingleItemToFavList(
      {required AddSingleItemToFavListTojson data}) async {
    var response = await NetworkCall().post(
        path: EndPoints.addSingleToFavList,
        data: FormData.fromMap(data.toJson()));
    if (response?.statusCode == 200) {
      return AddSingleItemToFavListModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetListItemsUsingListIdModel> getListItemsUsingListId(
      {required int listId}) async {
    var response = await NetworkCall().get(
      path: EndPoints.getListItemsUsingListId(listId: listId),
    );
    if (response?.statusCode == 200) {
      return GetListItemsUsingListIdModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }
}
