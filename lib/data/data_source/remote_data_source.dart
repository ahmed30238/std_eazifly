import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eazifly_student/core/exceptions/exceptions.dart';
import 'package:eazifly_student/core/network/end_points.dart';
import 'package:eazifly_student/core/network/error_message_model.dart';
import 'package:eazifly_student/core/network/networkcall.dart';
import 'package:eazifly_student/data/models/auth/login_model.dart';
import 'package:eazifly_student/data/models/children/create_new_child_model.dart';
import 'package:eazifly_student/data/models/children/create_new_child_tojson.dart';
import 'package:eazifly_student/data/models/children/get_my_children_model.dart';
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
import 'package:eazifly_student/data/models/library/library_order_and_subscribe_tojson.dart';
import 'package:eazifly_student/data/models/library/library_order_and_subscription_model.dart';
import 'package:eazifly_student/data/models/library/like_item_model.dart';
import 'package:eazifly_student/data/models/library/plans/get_library_plans_model.dart';
import 'package:eazifly_student/data/models/library/plans/get_plan_subscription_period_model.dart';
import 'package:eazifly_student/data/models/library/show_library_item_model.dart';
import 'package:eazifly_student/data/models/my_programs/change_session_status_model.dart';
import 'package:eazifly_student/data/models/my_programs/change_session_status_tojson.dart';
import 'package:eazifly_student/data/models/my_programs/content/complete_chapter_lesson_model.dart';
import 'package:eazifly_student/data/models/my_programs/content/get_chapter_lessons_model.dart';
import 'package:eazifly_student/data/models/my_programs/content/get_content_chapter_model.dart';
import 'package:eazifly_student/data/models/my_programs/get_assigned_children_to_program_model.dart';
import 'package:eazifly_student/data/models/my_programs/get_my_programs_model.dart';
import 'package:eazifly_student/data/models/my_programs/get_program_assignments_model.dart';
import 'package:eazifly_student/data/models/my_programs/get_program_sessions_model.dart';
import 'package:eazifly_student/data/models/my_programs/get_session_details_model.dart';
import 'package:eazifly_student/data/models/my_programs/get_user_feedbacks_model.dart';
import 'package:eazifly_student/data/models/my_programs/get_user_reports_model.dart';
import 'package:eazifly_student/data/models/my_programs/join_session_model.dart';
import 'package:eazifly_student/data/models/my_programs/join_session_tojson.dart';
import 'package:eazifly_student/data/models/my_programs/show_program_details_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/check_copoun_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/check_copoun_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/create_order_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/create_order_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/filter_plan_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/filter_plans_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/get_payment_method_details_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/get_plan_with_details_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/get_plans_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/get_program_payment_methods_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/get_user_orders_model.dart';
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
  Future<GetPlansWithDetailsModel> getPlansWithDetails({
    required int programId,
    required int days,
  });
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
  Future<LikeItemModel> likeItem({
    required int itemId,
    required bool status,
  });
  Future<GetMyChildrenModel> getMyChildren({required bool childresStatus});
  Future<CreateNewChildModel> createNewChild(
      {required CreateNewChildTojson data});
  Future<ShowLibraryItemModel> showLibraryItem({required int itemId});
  Future<GetPlanSubscriptionPeriodModel> getPlanSubscriptionPeriod();
  Future<GetLibraryPlansModel> getLibraryPlans({required int days});
  Future<LibraryOrderAndSubscriptionModel> libraryOrderAndSubscription(
      {required LibraryOrderAndSubscribeTojson data});
  Future<GetMyProgramsModel> getMyPrograms();
  Future<GetSessionDetailsModel> getSessionDetails({required int sessionId});
  Future<JoinSessionModel> joinSession({required JoinSessionTojson data});
  Future<GetAssignedChildrenToProgramModel> getAssignedChildrenToProgram(
      {required int programId});
  Future<ChangeSessionStatusModel> changeSessionStatus(
      {required ChangeSessionStatusToJson data});
  Future<ShowProgramDetailsModel> showProgramDetails({required int programId});
  Future<GetProgramSessionsModel> getProgramSessions({
    required int programId,
    required int userId,
  });
  Future<GetProgramAssignmentsModel> getProgramAssignments({
    required int programId,
    required int userId,
  });
  Future<GetUserReportsModel> getUserReports({
    required int userId,
  });
  Future<GetUserFeedbacksModel> getUserFeedbacks({
    required int userId,
  });
  Future<GetContentChapterModel> getContentChapter({
    required int userId,
  });
  Future<GetChapterLessonsModel> getChapterLessons({
    required int chapterId,
  });
  Future<CompleteChapterLessonModel> completeChapterLesson({
    required int lessonId,
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
      {required int programId, required int days}) async {
    var response = await NetworkCall().get(
      path: EndPoints.getPlansWithDetails(
        programId: programId,
        days: days,
      ),
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

  @override
  Future<LikeItemModel> likeItem(
      {required int itemId, required bool status}) async {
    var response = await NetworkCall().post(
      path: EndPoints.likeItem(
        itemId: itemId,
        status: status,
      ),
    );
    if (response?.statusCode == 200) {
      return LikeItemModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetMyChildrenModel> getMyChildren(
      {required bool childresStatus}) async {
    var response = await NetworkCall().get(
      path: EndPoints.getMyChildren(
        childrensStatus: childresStatus,
      ),
    );
    if (response?.statusCode == 200) {
      return GetMyChildrenModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<CreateNewChildModel> createNewChild(
      {required CreateNewChildTojson data}) async {
    try {
      FormData formData = FormData();

      // إضافة جميع الحقول النصية
      formData.fields.addAll([
        MapEntry("password_confirmation", data.passwordConfirmation),
        MapEntry("user_name", data.userName),
        MapEntry("first_name", data.firstName),
        MapEntry("last_name", data.lastName),
        MapEntry("email", data.email),
        MapEntry("phone", data.phone),
        MapEntry("whats_app", data.whatsApp),
        MapEntry("gender", data.gender),
        MapEntry("password", data.password),
        MapEntry("age", data.age),
      ]);

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
          log('Profile image added to FormData: ${data.image!.split('/').last}');
        } else {
          throw Exception(
              'Profile image file does not exist at path: ${data.image}');
        }
      }

      log('UpdateProfile FormData fields: ${formData.fields.length}');
      log('UpdateProfile FormData files: ${formData.files.length}');

      var response = await NetworkCall().post(
        path: EndPoints.createNewChild,
        data: formData,
        isMultipart: true,
      );

      if (response?.statusCode == 200) {
        return CreateNewChildModel.fromJson(response?.data);
      } else {
        log('UpdateProfile Error response: ${response?.data}');
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response?.data),
        );
      }
    } catch (e) {
      log('Error in updateProfile remote: $e');
      rethrow;
    }
  }

  @override
  Future<ShowLibraryItemModel> showLibraryItem({required int itemId}) async {
    var response = await NetworkCall().get(
      path: EndPoints.showLibraryItem(
        itemId: itemId,
      ),
    );
    if (response?.statusCode == 200) {
      return ShowLibraryItemModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetPlanSubscriptionPeriodModel> getPlanSubscriptionPeriod() async {
    var response = await NetworkCall().get(
      path: EndPoints.getPlanSubscriptionPeriod,
    );
    if (response?.statusCode == 200) {
      return GetPlanSubscriptionPeriodModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetLibraryPlansModel> getLibraryPlans({required int days}) async {
    var response = await NetworkCall().get(
      path: EndPoints.getLibraryPlans(days: days),
    );
    if (response?.statusCode == 200) {
      return GetLibraryPlansModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<LibraryOrderAndSubscriptionModel> libraryOrderAndSubscription(
      {required LibraryOrderAndSubscribeTojson data}) async {
    FormData formData = FormData();
    formData.fields.add(
      MapEntry(
        "library_plan_id",
        data.libraryPlanId,
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
        log('Profile image added to FormData: ${data.image!.split('/').last}');
      } else {
        throw Exception(
            'Profile image file does not exist at path: ${data.image}');
      }
    }

    log('UpdateProfile FormData fields: ${formData.fields.length}');
    log('UpdateProfile FormData files: ${formData.files.length}');
    var response = await NetworkCall()
        .post(path: EndPoints.libraryOrderAndSubscription, data: formData);
    if (response?.statusCode == 200) {
      return LibraryOrderAndSubscriptionModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetMyProgramsModel> getMyPrograms() async {
    var response = await NetworkCall().get(
      path: EndPoints.getMyPrograms,
    );
    if (response?.statusCode == 200) {
      return GetMyProgramsModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetSessionDetailsModel> getSessionDetails(
      {required int sessionId}) async {
    var response = await NetworkCall().get(
      path: EndPoints.getSessionDetails(sessionId: sessionId),
    );
    if (response?.statusCode == 200) {
      return GetSessionDetailsModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<JoinSessionModel> joinSession(
      {required JoinSessionTojson data}) async {
    var response = await NetworkCall().post(
      path: EndPoints.joinSession,
      data: FormData.fromMap(data.toJson()),
    );
    if (response?.statusCode == 200) {
      return JoinSessionModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetAssignedChildrenToProgramModel> getAssignedChildrenToProgram(
      {required int programId}) async {
    var response = await NetworkCall().get(
      path: EndPoints.getAssignedChildrenToProgram(programId: programId),
    );
    if (response?.statusCode == 200) {
      return GetAssignedChildrenToProgramModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<ChangeSessionStatusModel> changeSessionStatus(
      {required ChangeSessionStatusToJson data}) async {
    var response = await NetworkCall().get(
      path: EndPoints.changeSessionStatus,
    );
    if (response?.statusCode == 200) {
      return ChangeSessionStatusModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<ShowProgramDetailsModel> showProgramDetails(
      {required int programId}) async {
    var response = await NetworkCall().get(
      path: EndPoints.showProgramDetails(programId: programId),
    );
    if (response?.statusCode == 200) {
      return ShowProgramDetailsModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetProgramSessionsModel> getProgramSessions(
      {required int programId, required int userId}) async {
    var response = await NetworkCall().get(
      path: EndPoints.getProgramSessions(
        programId: programId,
        userId: userId,
      ),
    );
    if (response?.statusCode == 200) {
      return GetProgramSessionsModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetProgramAssignmentsModel> getProgramAssignments(
      {required int programId, required int userId}) async {
    var response = await NetworkCall().get(
      path: EndPoints.getProgramAssignments(
        programId: programId,
        userId: userId,
      ),
    );
    if (response?.statusCode == 200) {
      return GetProgramAssignmentsModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetUserReportsModel> getUserReports({required int userId}) async {
    var response = await NetworkCall().get(
      path: EndPoints.getUserReports(
        userId: userId,
      ),
    );
    if (response?.statusCode == 200) {
      return GetUserReportsModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetUserFeedbacksModel> getUserFeedbacks({required int userId}) async {
    var response = await NetworkCall().get(
      path: EndPoints.getUserFeedbacks(
        userId: userId,
      ),
    );
    if (response?.statusCode == 200) {
      return GetUserFeedbacksModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetContentChapterModel> getContentChapter(
      {required int userId}) async {
    var response = await NetworkCall().get(
      path: EndPoints.getContentChapter(
        userId: userId,
      ),
    );
    if (response?.statusCode == 200) {
      return GetContentChapterModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetChapterLessonsModel> getChapterLessons(
      {required int chapterId}) async {
    var response = await NetworkCall().get(
      path: EndPoints.getChapterLessons(
        chapterId: chapterId,
      ),
    );
    if (response?.statusCode == 200) {
      return GetChapterLessonsModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<CompleteChapterLessonModel> completeChapterLesson(
      {required int lessonId}) async {
    var response = await NetworkCall().post(
      path: EndPoints.completeChapterLesson(
        lessonId: lessonId,
      ),
    );
    if (response?.statusCode == 200) {
      return CompleteChapterLessonModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }
}
