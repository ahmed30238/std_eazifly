import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eazifly_student/core/exceptions/exceptions.dart';
import 'package:eazifly_student/core/network/end_points.dart';
import 'package:eazifly_student/core/network/error_message_model.dart';
import 'package:eazifly_student/core/network/networkcall.dart';
import 'package:eazifly_student/data/models/auth/login_model.dart';
import 'package:eazifly_student/data/models/auth/logout_model.dart';
import 'package:eazifly_student/data/models/auth/reset_password_model.dart';
import 'package:eazifly_student/data/models/auth/reset_password_tojson.dart';
import 'package:eazifly_student/data/models/auth/update_fcm_token_model.dart';
import 'package:eazifly_student/data/models/change_instructor/change_instructor_model.dart';
import 'package:eazifly_student/data/models/change_instructor/change_instructor_tojson.dart';
import 'package:eazifly_student/data/models/change_instructor/get_change_instructor_reasons_model.dart';
import 'package:eazifly_student/data/models/change_instructor/get_remaining_program_sessions_model.dart';
import 'package:eazifly_student/data/models/change_instructor/get_user_subscription_data_model.dart';
import 'package:eazifly_student/data/models/chat_model/check_chat_model.dart';
import 'package:eazifly_student/data/models/chat_model/check_chat_tojson.dart';
import 'package:eazifly_student/data/models/chat_model/get_messages_model.dart';
import 'package:eazifly_student/data/models/chat_model/get_my_chats_model.dart';
import 'package:eazifly_student/data/models/chat_model/send_messages_model.dart';
import 'package:eazifly_student/data/models/chat_model/send_messages_tojson.dart';
import 'package:eazifly_student/data/models/children/create_new_child_model.dart';
import 'package:eazifly_student/data/models/children/create_new_child_tojson.dart';
import 'package:eazifly_student/data/models/children/get_my_children_model.dart';
import 'package:eazifly_student/data/models/find_instructor/request_to_find_instructor_model.dart';
import 'package:eazifly_student/data/models/find_instructor/request_to_find_instructor_tojson.dart';
import 'package:eazifly_student/data/models/geidea_settings_model/get_geidea_data_model.dart';
import 'package:eazifly_student/data/models/home/get_home_assigments_model.dart';
import 'package:eazifly_student/data/models/home/get_home_closest_sessions_model.dart';
import 'package:eazifly_student/data/models/home/get_home_current_session_model.dart';
import 'package:eazifly_student/data/models/home/get_home_library_model.dart';
import 'package:eazifly_student/data/models/home/get_home_quizzes_model.dart';
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
import 'package:eazifly_student/data/models/my_programs/content/get_program_content_model.dart';
import 'package:eazifly_student/data/models/my_programs/get_assigned_children_to_program_model.dart';
import 'package:eazifly_student/data/models/my_programs/get_assignment_details_model.dart';
import 'package:eazifly_student/data/models/my_programs/get_my_programs_model.dart';
import 'package:eazifly_student/data/models/my_programs/get_program_assignments_model.dart';
import 'package:eazifly_student/data/models/my_programs/get_program_sessions_model.dart';
import 'package:eazifly_student/data/models/my_programs/get_report_questions_model.dart';
import 'package:eazifly_student/data/models/my_programs/get_session_details_model.dart';
import 'package:eazifly_student/data/models/my_programs/get_user_feedbacks_model.dart';
import 'package:eazifly_student/data/models/my_programs/get_user_reports_model.dart';
import 'package:eazifly_student/data/models/my_programs/join_session_model.dart';
import 'package:eazifly_student/data/models/my_programs/join_session_tojson.dart';
import 'package:eazifly_student/data/models/my_programs/post_assignment_model.dart';
import 'package:eazifly_student/data/models/my_programs/post_assignment_tojson.dart';
import 'package:eazifly_student/data/models/my_programs/quizzes/get_quiz_questions_model.dart';
import 'package:eazifly_student/data/models/my_programs/quizzes/get_user_quizzes_model.dart';
import 'package:eazifly_student/data/models/my_programs/quizzes/submit_quiz_model.dart';
import 'package:eazifly_student/data/models/my_programs/quizzes/submit_quiz_to_json.dart';
import 'package:eazifly_student/data/models/my_programs/show_program_details_model.dart';
import 'package:eazifly_student/data/models/notification/get_latest_notification_model.dart';
import 'package:eazifly_student/data/models/notification/read_notification_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/add_note_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/add_note_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/assign_appointments/add_weekly_appointments_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/assign_appointments/add_weekly_appointments_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/assign_appointments/create_meeting_sessions_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/assign_appointments/create_meeting_sessions_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/assign_appointments/get_instructors_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/assign_appointments/get_order_details_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/check_copoun_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/check_copoun_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/create_order_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/create_order_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/filter_plan_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/filter_plans_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/get_instructors_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/get_payment_method_details_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/get_plan_with_details_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/get_plans_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/get_program_payment_methods_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/get_user_orders_model.dart';
import 'package:eazifly_student/data/models/programs/assign_program_review_model.dart';
import 'package:eazifly_student/data/models/programs/assign_program_review_tojson.dart';
import 'package:eazifly_student/data/models/programs/get_program_details_model.dart';
import 'package:eazifly_student/data/models/programs/get_programs_model.dart';
import 'package:eazifly_student/data/models/sessions/cancel_session_model.dart';
import 'package:eazifly_student/data/models/sessions/cancel_session_tojson.dart';
import 'package:eazifly_student/data/models/sessions/change_session_date_model.dart';
import 'package:eazifly_student/data/models/sessions/change_session_date_tojson.dart';
import 'package:eazifly_student/data/models/sessions/get_cancel_session_reason_model.dart';
import 'package:eazifly_student/data/models/sessions/get_instructor_availabilities_model.dart';
import 'package:eazifly_student/data/models/subscription_management/cancel_subscription_model.dart';
import 'package:eazifly_student/data/models/subscription_management/get_library_subscription_model.dart';
import 'package:eazifly_student/data/models/subscription_management/get_program_subscription_model.dart';
import 'package:eazifly_student/data/models/subscription_management/remove_assigned_student_model.dart';
import 'package:eazifly_student/data/models/subscription_management/renew_subscription_model.dart';
import 'package:eazifly_student/data/models/subscription_management/renew_subscription_tojson.dart';
import 'package:eazifly_student/data/models/subscription_management/show_plan_model.dart';
import 'package:eazifly_student/data/models/subscription_management/upgrade_order_model.dart';
import 'package:eazifly_student/data/models/user/copoun_history_model.dart';
import 'package:eazifly_student/data/models/user/delete_account_model.dart';
import 'package:eazifly_student/data/models/user/update_profile_model.dart';
import 'package:eazifly_student/data/models/user/update_profile_tojson.dart';

import '../models/auth/forgot_password_model.dart';
import '../models/auth/login_tojson.dart';
import '../models/auth/register_model.dart';
import '../models/auth/register_tojson.dart';

abstract class BaseRemoteDataSource {
  Future<LoginModel> login({required LoginToJson data});

  Future<RegisterModel> register({required RegisterToJson data});

  Future<ForgotPasswordModel> forgotPassword(String email);

  Future<ResetPasswordModel> resetPassword({required ResetPasswordToJson data});

  Future<GetProgramsModel> getPrograms();

  Future<GetProgramDetailsModel> getProgramDetails({required int programId});

  Future<AssignProgramReviewModel> assignProgramReview(
      {required AssignProgramReviewTojson data});

  Future<GetPlansWithDetailsModel> getPlansWithDetails({
    required int programId,
    required int days,
  });

  Future<GetPlansModel> getPlans({required int programId});

  Future<GetGeideaDataModel> getGeideaData({required String key});

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

  Future<GetHomeCurrentSessionModel> getHomeCurrentSession({
    required int userId,
  });

  Future<GetHomeClosestSessionsModel> getHomeClosestSessions({
    required int userId,
  });

  Future<GetHomeQuizzesModel> getHomeQuizzes({
    required int userId,
  });

  Future<GetHomeAssignmentsModel> getHomeAssignments({
    required int userId,
  });

  Future<GetHomeLibraryModel> getHomeLibrary();

  Future<GetChapterLessonsModel> getChapterLessons({
    required int chapterId,
  });

  Future<CompleteChapterLessonModel> completeChapterLesson({
    required int lessonId,
  });

  Future<SubmitQuizModel> submitQuiz({
    required SubmitQuizTojson data,
  });

  Future<GetQuizQuestionsModel> getQuizQuestions({
    required int userId,
    required int quizId,
    required int programId,
  });

  Future<GetUserQuizzesModel> getUserQuizzes({
    required int userId,
    required int programId,
  });

  Future<GetAssignmentDetailsModel> getAssignmentDetails({
    required int userId,
    required int assignmentId,
  });

  Future<GetMessagesModel> getMessages({
    required int chatId,
    required int offset,
  });

  Future<SendMessagesModel> sendMessages({
    required SendMessagesTojson data,
  });

  Future<PostAssignmentModel> postAssignment({
    required PostAssignmentTojson data,
  });

  Future<GetProgramSubscriptionModel> getProgramSubscriptions();

  Future<GetLibrarySubscriptionModel> getLibrarySubscription();

  Future<CancelSubscriptionModel> cancelSubscription({
    required int mainId,
  });

  Future<RenewSubscriptionModel> renewSubscription({
    required RenewSubscriptionTojson data,
  });

  Future<ShowPlanModel> showPlan({
    required int planId,
  });

  Future<UpgradeOrderModel> upgradeOrder({
    required RenewSubscriptionTojson data,
  });

  Future<CreateMeetingSessionsModel> createMeetingSessions({
    required CreateMeetingSessionsTojson data,
  });

  Future<GetOrderDetailsModel> getOrderDetails({required int orderId});

  Future<AddWeeklyAppontmentsModel> addWeeklyAppointments({
    required AddWeeklyAppointmentsTojson data,
  });

  Future<GetInstructorsModel> getInstructors({
    required GetInstructorsTojson data,
  });

  Future<GetProgramContentModel> getProgramContent({
    required int programId,
  });

  Future<GetReportQuestionsModel> getReportQuestions({
    required String reportMakerType,
    required String reportForType,
    required int reportMakerId,
    required int reportForId,
    required int meetingSessionId,
  });

  Future<AddNoteModel> addNote({
    required AddNoteTojson data,
  });

  Future<GetCancelSessionReasonModel> getCancelSessionReasons();

  Future<GetInstructorAvailabilitiesModel> getInstructorAvailabilities({
    required int instructorId,
    required int duration,
  });

  Future<CancelSessionModel> cancelSession({
    required CancelSessionTojson data,
  });

  Future<ChangeSessionDateModel> changeSessionDate({
    required ChangeSessionDateTojson data,
    required int sessionId,
  });

  Future<GetRemainingProgramSessionsModel> getRemainingProgramSessions({
    required int programId,
    required int userId,
  });

  Future<GetUserSubscriptionDataModel> getUserSubscriptionData({
    required int programId,
    required int userId,
  });

  Future<ChangeInstructorModel> changeInstructor({
    required ChangeInstructorTojson data,
    required bool isNewDates,
  });

  Future<GetChangeInstructorReasonsModel> getChangeInstructorReasons();

  Future<UpdateProfileModel> updateProfile({
    required int userId,
    required UpdateProfileTojson data,
  });

  Future<RemoveAssignedStudentModel> removeAssignedStudent({
    required int userId,
    required int programId,
  });

  Future<GetMyChatsModel> getMyChats({
    required String type,
  });

  Future<UpdateFcmTokenModel> updateFcmToken({required String fcmToken});

  Future<GetLatestNotificationModel> getLatestNotification(
      {required int offset, required String type});

  Future<ReadNotificationModel> readNotification({required int notificationId});

  Future<LogoutModel> logout();

  Future<DeleteAccountModel> deleteAccount({required int userId});

  Future<CheckChatModel> checkChat({required CheckChatTojson data});

  Future<RequestToFindInstructorModel> findInstructor(
      {required RequestToFindInstructorTojson data});

  Future<CopounHistoryModel> copounHistory();
}

class RemoteDataSource extends BaseRemoteDataSource {
  @override
  Future<LoginModel> login({required LoginToJson data}) async {
    var response = await NetworkCall()
        .post(path: EndPoints.login, data: FormData.fromMap(data.toJson()));
    log("$response ${data.loginCredential?.key} ${data.loginCredential?.value}");
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
      if (data.startDate != null) {
        for (var date in data.startDate!) {
          formData.fields.add(MapEntry("start_date[]", date.toString()));
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

  @override
  Future<GetQuizQuestionsModel> getQuizQuestions(
      {required int userId,
      required int quizId,
      required int programId}) async {
    var response = await NetworkCall().get(
      path: EndPoints.getQuizQuestions(
        userId: userId,
        programId: programId,
        quizId: quizId,
      ),
    );
    if (response?.statusCode == 200) {
      return GetQuizQuestionsModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetUserQuizzesModel> getUserQuizzes(
      {required int userId, required int programId}) async {
    var response = await NetworkCall().get(
      path: EndPoints.getUserQuizzes(
        programId: programId,
        userId: userId,
      ),
    );
    if (response?.statusCode == 200) {
      return GetUserQuizzesModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<SubmitQuizModel> submitQuiz({required SubmitQuizTojson data}) async {
    var response = await NetworkCall().post(
        path: EndPoints.submitQuiz, data: FormData.fromMap(data.toJson()));
    if (response?.statusCode == 200) {
      return SubmitQuizModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetAssignmentDetailsModel> getAssignmentDetails(
      {required int userId, required int assignmentId}) async {
    var response = await NetworkCall().get(
      path: EndPoints.getAssignmntDetails(
        assignmentId: assignmentId,
        userId: userId,
      ),
    );
    if (response?.statusCode == 200) {
      return GetAssignmentDetailsModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetMessagesModel> getMessages(
      {required int chatId, required int offset}) async {
    var response = await NetworkCall().get(
      path: EndPoints.getMessages(chatId: chatId, offset: offset),
    );
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return GetMessagesModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<SendMessagesModel> sendMessages(
      {required SendMessagesTojson data}) async {
    FormData formData = FormData();
    formData.fields.addAll([
      MapEntry("message", data.message),
      MapEntry("receiver_id", data.receiverId),
      MapEntry("receiver_type", data.receiverType),
      MapEntry("sender_id", data.senderId),
      MapEntry("sender_type", data.senderType),
    ]);
    if (data.file != null) {
      if (data.file!.isNotEmpty) {
        final File fileFile = File(data.file ?? "");
        if (await fileFile.exists()) {
          formData.files.add(
            MapEntry(
              "file",
              await MultipartFile.fromFile(
                data.file ?? "",
                filename: data.file?.split('/').last,
              ),
            ),
          );
          log('file added to FormData: ${data.file?.split('/').last}');
        } else {
          throw Exception('file file does not exist at path: ${data.file}');
        }
      }
    }
    log('FormData fields: ${formData.fields.length}');
    log('FormData files: ${formData.files.length}');
    var response = await NetworkCall().post(
      data: formData,
      path: EndPoints.sendMessages,
    );
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return SendMessagesModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<PostAssignmentModel> postAssignment(
      {required PostAssignmentTojson data}) async {
    var formData = await data.toFormData();

    var response = await NetworkCall().post(
      data: FormData.fromMap(formData),
      path: EndPoints.postAssignment,
    );

    if (response?.statusCode == 200) {
      log("${response?.data}");
      return PostAssignmentModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetProgramSubscriptionModel> getProgramSubscriptions() async {
    var response = await NetworkCall().get(
      path: EndPoints.getProgramSubscriptions,
    );
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return GetProgramSubscriptionModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetLibrarySubscriptionModel> getLibrarySubscription() async {
    var response = await NetworkCall().get(
      path: EndPoints.getLibrarySubscriptions,
    );
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return GetLibrarySubscriptionModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<CancelSubscriptionModel> cancelSubscription({
    required int mainId,
  }) async {
    var response = await NetworkCall().post(
      path: EndPoints.cancelSubscription(
        mainId: mainId,
      ),
    );
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return CancelSubscriptionModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<RenewSubscriptionModel> renewSubscription(
      {required RenewSubscriptionTojson data}) async {
    try {
      FormData formData = FormData();
      if (data.code.isNotEmpty) {
        formData.fields.add(MapEntry("code", data.code));
      }

      for (var id in data.planId) {
        formData.fields.add(MapEntry("plan_id[]", id.toString()));
      }

      for (var id in data.programId) {
        formData.fields.add(MapEntry("program_id[]", id.toString()));
      }

      for (var number in data.studentNumber) {
        formData.fields.add(MapEntry("student_number[]", number.toString()));
      }
      // for (var date in data.startDate) {
      //   formData.fields.add(MapEntry("start_date[]", date.toString()));
      // }

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
          log('order image added to FormData: ${data.image!.split('/').last}');
        } else {
          throw Exception(
              'Profile image file does not exist at path: ${data.image}');
        }
      }
//
      log('FormData fields: ${formData.fields.length}');
      log('FormData files: ${formData.files.length}');

      var response = await NetworkCall().post(
        path: EndPoints.renewOrder,
        data: formData, // استخدم formData بدلاً من data.toJson()
        isMultipart: true,
      );

      if (response?.statusCode == 200) {
        return RenewSubscriptionModel.fromJson(response?.data);
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
  Future<ShowPlanModel> showPlan({required int planId}) async {
    var response =
        await NetworkCall().get(path: EndPoints.showPlan(planId: planId));
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return ShowPlanModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<UpgradeOrderModel> upgradeOrder(
      {required RenewSubscriptionTojson data}) async {
    try {
      FormData formData = FormData();
      if (data.code.isNotEmpty) {
        formData.fields.add(MapEntry("code", data.code));
      }

      for (var id in data.planId) {
        formData.fields.add(MapEntry("plan_id[]", id.toString()));
      }

      for (var id in data.programId) {
        formData.fields.add(MapEntry("program_id[]", id.toString()));
      }

      for (var number in data.studentNumber) {
        formData.fields.add(MapEntry("student_number[]", number.toString()));
      }

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
          log('order image added to FormData: ${data.image!.split('/').last}');
        } else {
          throw Exception(
              'Profile image file does not exist at path: ${data.image}');
        }
      }
//
      log('FormData fields: ${formData.fields.length}');
      log('FormData files: ${formData.files.length}');

      var response = await NetworkCall().post(
        path: EndPoints.upgradeOrder,
        data: formData, // استخدم formData بدلاً من data.toJson()
        isMultipart: true,
      );

      if (response?.statusCode == 200) {
        return UpgradeOrderModel.fromJson(response?.data);
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
  Future<GetReportQuestionsModel> getReportQuestions({
    required String reportMakerType,
    required String reportForType,
    required int reportMakerId,
    required int reportForId,
    required int meetingSessionId,
  }) async {
    var response = await NetworkCall().get(
        path: EndPoints.getReportQuestions(
      meetingSessionId: meetingSessionId,
      reportForId: reportForId,
      reportForType: reportForType,
      reportMakerId: reportMakerId,
      reportMakerType: reportMakerType,
    ));
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return GetReportQuestionsModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<AddWeeklyAppontmentsModel> addWeeklyAppointments(
      {required AddWeeklyAppointmentsTojson data}) async {
    var response = await NetworkCall().post(
      data: data.toJson(),
      path: EndPoints.addWeeklyAppointments,
    );
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return AddWeeklyAppontmentsModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<CreateMeetingSessionsModel> createMeetingSessions(
      {required CreateMeetingSessionsTojson data}) async {
    var response = await NetworkCall().post(
      data: FormData.fromMap(data.toJson()),
      path: EndPoints.createMeetingSession,
    );
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return CreateMeetingSessionsModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetOrderDetailsModel> getOrderDetails({required int orderId}) async {
    var response = await NetworkCall().get(
      path: EndPoints.getOrderDetails(
        orderId: orderId,
      ),
    );
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return GetOrderDetailsModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetInstructorsModel> getInstructors(
      {required GetInstructorsTojson data}) async {
    var response = await NetworkCall().post(
      data: data.toJson(),
      path: EndPoints.getInstructors,
    );
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return GetInstructorsModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetProgramContentModel> getProgramContent(
      {required int programId}) async {
    var response = await NetworkCall().get(
      path: EndPoints.getProgramContent(programId: programId),
    );
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return GetProgramContentModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<AddNoteModel> addNote({required AddNoteTojson data}) async {
    try {
      FormData formData = FormData();
      formData.fields.addAll([
        MapEntry("title", data.title),
        MapEntry("description", data.description),
        MapEntry("order_id", data.orderId),
        MapEntry("user_id", data.userId),
      ]);
      if (data.image != null) {
        if (data.image!.isNotEmpty) {
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
      }
//
      log('FormData fields: ${formData.fields.length}');
      log('FormData files: ${formData.files.length}');

      var response = await NetworkCall().post(
        path: EndPoints.addNote,
        data: formData,
        isMultipart: true,
      );

      if (response?.statusCode == 200) {
        return AddNoteModel.fromJson(response?.data);
      } else {
        log('Error response: ${response?.data}');
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response?.data),
        );
      }
    } catch (e) {
      log('Error in add note remote: $e');
      rethrow;
    }
  }

  @override
  Future<CancelSessionModel> cancelSession(
      {required CancelSessionTojson data}) async {
    var response = await NetworkCall().post(
      data: data.tojson(),
      path: EndPoints.cancelSession,
    );
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return CancelSessionModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<ChangeSessionDateModel> changeSessionDate(
      {required ChangeSessionDateTojson data, required int sessionId}) async {
    var response = await NetworkCall().post(
      data: data.tojson(),
      path: EndPoints.changeSessionDate(sessionId: sessionId),
    );
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return ChangeSessionDateModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetCancelSessionReasonModel> getCancelSessionReasons() async {
    var response = await NetworkCall().get(
      path: EndPoints.getReasons,
    );
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return GetCancelSessionReasonModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetInstructorAvailabilitiesModel> getInstructorAvailabilities(
      {required int instructorId, required int duration}) async {
    var response = await NetworkCall().get(
      path: EndPoints.getInstructorAvailablities(
        instructorId: instructorId,
        duration: duration,
      ),
    );
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return GetInstructorAvailabilitiesModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<ChangeInstructorModel> changeInstructor({
    required ChangeInstructorTojson data,
    required bool isNewDates,
  }) async {
    log("isNewDates $isNewDates");
    var response = await NetworkCall().post(
      data: data.toJson(),
      path: isNewDates
          ? EndPoints.changeInstructorWithNewDates
          : EndPoints.changeInstructor,
    );
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return ChangeInstructorModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetRemainingProgramSessionsModel> getRemainingProgramSessions(
      {required int programId, required int userId}) async {
    var response = await NetworkCall()
        .post(path: EndPoints.getRemainingProgramSessions, data: {
      "user_id": userId,
      "program_id": programId,
    });
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return GetRemainingProgramSessionsModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetUserSubscriptionDataModel> getUserSubscriptionData(
      {required int programId, required int userId}) async {
    var response = await NetworkCall().get(
      path: EndPoints.getUserSubscriptionData(
        programId: programId,
        userId: userId,
      ),
    );
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return GetUserSubscriptionDataModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetChangeInstructorReasonsModel> getChangeInstructorReasons() async {
    var response =
        await NetworkCall().get(path: EndPoints.getChangeInstructorReasons);
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return GetChangeInstructorReasonsModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<UpdateProfileModel> updateProfile({
    required UpdateProfileTojson data,
    required int userId,
  }) async {
    try {
      FormData formData = FormData();

      // إضافة جميع الحقول النصية
      formData.fields.addAll([
        MapEntry("age", data.age),
        MapEntry("whats_app", data.whatsApp),
        MapEntry("gender", data.gender),
        MapEntry("email", data.email),
        MapEntry("phone", data.phone),
        MapEntry("parent_id", data.parentId),
        MapEntry("user_name", data.userName),
        MapEntry("first_name", data.firstName),
        MapEntry("last_name", data.lastName),
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
        path: EndPoints.updateProfile(userId: userId),
        data: formData,
        isMultipart: true,
      );

      if (response?.statusCode == 200) {
        return UpdateProfileModel.fromJson(response?.data);
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
  Future<RemoveAssignedStudentModel> removeAssignedStudent({
    required int userId,
    required int programId,
  }) async {
    var response =
        await NetworkCall().post(path: EndPoints.removeAssignedStudent, data: {
      "program_id": programId,
      "user_id": userId,
    });
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return RemoveAssignedStudentModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetHomeClosestSessionsModel> getHomeClosestSessions(
      {required int userId}) async {
    var response = await NetworkCall().get(
      path: EndPoints.getHomeClosestSessions(userId: userId),
    );
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return GetHomeClosestSessionsModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetHomeCurrentSessionModel> getHomeCurrentSession(
      {required int userId}) async {
    var response = await NetworkCall().get(
      path: EndPoints.getHomeCurrentSession(userId: userId),
    );
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return GetHomeCurrentSessionModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetHomeLibraryModel> getHomeLibrary() async {
    var response = await NetworkCall().get(path: EndPoints.getHomeLibrary);
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return GetHomeLibraryModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetHomeAssignmentsModel> getHomeAssignments(
      {required int userId}) async {
    var response = await NetworkCall()
        .get(path: EndPoints.getHomeAssignments(userId: userId));
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return GetHomeAssignmentsModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetHomeQuizzesModel> getHomeQuizzes({required int userId}) async {
    var response =
        await NetworkCall().get(path: EndPoints.getHomeQuizzes(userId: userId));
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return GetHomeQuizzesModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetMyChatsModel> getMyChats({required String type}) async {
    var response =
        await NetworkCall().get(path: EndPoints.getMyChats(type: type));
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return GetMyChatsModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<UpdateFcmTokenModel> updateFcmToken({required String fcmToken}) async {
    var response = await NetworkCall().post(
      data: FormData.fromMap({
        "fcm_token": fcmToken,
      }),
      path: EndPoints.updateFcmToken,
    );
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return UpdateFcmTokenModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetLatestNotificationModel> getLatestNotification(
      {required int offset, required String type}) async {
    var response = await NetworkCall().get(
      path: EndPoints.getLatestNotification(type: type, offset: offset),
    );
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return GetLatestNotificationModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<ReadNotificationModel> readNotification(
      {required int notificationId}) async {
    var response = await NetworkCall().post(
      path: EndPoints.readNotification(notificationID: notificationId),
    );
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return ReadNotificationModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<LogoutModel> logout() async {
    var response = await NetworkCall().post(
      path: EndPoints.logout,
    );
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return LogoutModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<DeleteAccountModel> deleteAccount({required int userId}) async {
    var response = await NetworkCall().post(
      path: EndPoints.deleteAccount(userId: userId),
    );
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return DeleteAccountModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<CheckChatModel> checkChat({required CheckChatTojson data}) async {
    var response = await NetworkCall().post(
      path: EndPoints.checkChat,
      data: data.toJson(),
    );
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return CheckChatModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<RequestToFindInstructorModel> findInstructor(
      {required RequestToFindInstructorTojson data}) async {
    var response = await NetworkCall().post(
      path: EndPoints.requestToFindInstrcutor,
      data: data.toJson(),
    );
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return RequestToFindInstructorModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<CopounHistoryModel> copounHistory() async {
    var response = await NetworkCall().get(path: EndPoints.copounHistory);
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return CopounHistoryModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<RegisterModel> register({required RegisterToJson data}) async {
    var response = await NetworkCall()
        .post(path: EndPoints.register, data: FormData.fromMap(data.toJson()));
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return RegisterModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<ForgotPasswordModel> forgotPassword(String email) async {
    var response = await NetworkCall().post(
      path: EndPoints.forgotPassword,
      data: FormData.fromMap(
        {
          "email": email,
        },
      ),
    );
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return ForgotPasswordModel.fromJson(response?.data);
    } else if (response?.statusCode == 422) {
      throw ServerException(
        errorMessageModel: ErrorMessageModel(
          statusMessage: _extractErrorMessage(response?.data['message']),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel(
          statusMessage: "حدث خطأ غير متوقع",
        ),
      );
    }
  }

  @override
  Future<ResetPasswordModel> resetPassword(
      {required ResetPasswordToJson data}) async {
    var response = await NetworkCall().post(
        path: EndPoints.resetPassword, data: FormData.fromMap(data.toJson()));
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return ResetPasswordModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<GetGeideaDataModel> getGeideaData({required String key}) async {
    var response =
        await NetworkCall().get(path: EndPoints.geideaData(key: key));
    if (response?.statusCode == 200) {
      log("${response?.data}");
      return GetGeideaDataModel.fromJson(response?.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(
          response?.data,
        ),
      );
    }
  }
}

String _extractErrorMessage(dynamic message) {
  if (message == null) return "حدث خطأ غير متوقع";

  if (message is String) return message;

  if (message is Map<String, dynamic>) {
    for (var value in message.values) {
      if (value is List && value.isNotEmpty) {
        return value.first.toString(); // أول خطأ في أول قائمة
      } else if (value is String) {
        return value;
      }
    }
  }

  return "حدث خطأ غير متوقع";
}
