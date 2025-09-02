import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/change_instructor/change_instructor_tojson.dart';
import 'package:eazifly_student/data/models/chat_model/check_chat_tojson.dart';
import 'package:eazifly_student/data/models/chat_model/send_messages_tojson.dart';
import 'package:eazifly_student/data/models/children/create_new_child_tojson.dart';
import 'package:eazifly_student/data/models/find_instructor/request_to_find_instructor_tojson.dart';
import 'package:eazifly_student/data/models/library/favourite_list/add_single_item_to_fav_tojson.dart';
import 'package:eazifly_student/data/models/library/favourite_list/store_favourite_list_tojson.dart';
import 'package:eazifly_student/data/models/library/library_order_and_subscribe_tojson.dart';
import 'package:eazifly_student/data/models/my_programs/change_session_status_tojson.dart';
import 'package:eazifly_student/data/models/my_programs/join_session_tojson.dart';
import 'package:eazifly_student/data/models/my_programs/post_assignment_tojson.dart';
import 'package:eazifly_student/data/models/my_programs/quizzes/submit_quiz_to_json.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/add_note_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/assign_appointments/add_weekly_appointments_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/assign_appointments/create_meeting_sessions_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/assign_appointments/get_instructors_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/check_copoun_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/create_order_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/filter_plan_tojson.dart';
import 'package:eazifly_student/data/models/programs/assign_program_review_tojson.dart';
import 'package:eazifly_student/data/models/sessions/cancel_session_tojson.dart';
import 'package:eazifly_student/data/models/sessions/change_session_date_tojson.dart';
import 'package:eazifly_student/data/models/subscription_management/renew_subscription_tojson.dart';
import 'package:eazifly_student/data/models/user/update_profile_tojson.dart';
import 'package:eazifly_student/domain/entities/add_note_entity.dart';
import 'package:eazifly_student/domain/entities/add_single_item_to_fav_list_entity.dart';
import 'package:eazifly_student/domain/entities/add_weekly_appointments_entity.dart';
import 'package:eazifly_student/domain/entities/assign_program_review_entities.dart';
import 'package:eazifly_student/domain/entities/auth/register_entities.dart';
import 'package:eazifly_student/domain/entities/change_instructor/change_instructor_entity.dart';
import 'package:eazifly_student/domain/entities/change_instructor/get_change_instructor_reasons_entity.dart';
import 'package:eazifly_student/domain/entities/change_instructor/get_remaining_program_sessions_entity.dart';
import 'package:eazifly_student/domain/entities/change_instructor/get_user_subscription_data_entity.dart';
import 'package:eazifly_student/domain/entities/chat/check_chat_entity.dart';
import 'package:eazifly_student/domain/entities/chat/get_messages_entities.dart';
import 'package:eazifly_student/domain/entities/chat/get_my_chats_entity.dart';
import 'package:eazifly_student/domain/entities/chat/send_messages_entities.dart';
import 'package:eazifly_student/domain/entities/check_copoun_entities.dart';
import 'package:eazifly_student/domain/entities/children_entities/create_new_child_entity.dart';
import 'package:eazifly_student/domain/entities/children_entities/get_my_children_entity.dart';
import 'package:eazifly_student/domain/entities/create_meeting_sessions_entity.dart';
import 'package:eazifly_student/domain/entities/create_order_entities.dart';
import 'package:eazifly_student/domain/entities/filter_plan_entities.dart';
import 'package:eazifly_student/domain/entities/find_instructor/request_to_find_instructor_entity.dart';
import 'package:eazifly_student/domain/entities/get_all_items_entity.dart';
import 'package:eazifly_student/domain/entities/get_all_library_lists_entity.dart';
import 'package:eazifly_student/domain/entities/get_favourite_list_entity.dart';
import 'package:eazifly_student/domain/entities/get_favourite_list_items_using_list_id_entity.dart';
import 'package:eazifly_student/domain/entities/get_instructors_entity.dart';
import 'package:eazifly_student/domain/entities/get_library_category_entity.dart';
import 'package:eazifly_student/domain/entities/get_library_plans_entity.dart';
import 'package:eazifly_student/domain/entities/get_list_items_using_list_id_entity.dart';
import 'package:eazifly_student/domain/entities/get_order_details_entity.dart';
import 'package:eazifly_student/domain/entities/get_payment_method_details_entities.dart';
import 'package:eazifly_student/domain/entities/get_plan_subscription_period_entity.dart';
import 'package:eazifly_student/domain/entities/get_plan_with_details_entities.dart';
import 'package:eazifly_student/domain/entities/get_plans_entities.dart';
import 'package:eazifly_student/domain/entities/get_program_details_entities.dart';
import 'package:eazifly_student/domain/entities/get_program_payment_methods_entities.dart';
import 'package:eazifly_student/domain/entities/get_programs_entities.dart';
import 'package:eazifly_student/domain/entities/get_user_orders_entities.dart';
import 'package:eazifly_student/domain/entities/home/get_home_assigments_entity.dart';
import 'package:eazifly_student/domain/entities/home/get_home_closest_sessions_entity.dart';
import 'package:eazifly_student/domain/entities/home/get_home_current_session_entity.dart';
import 'package:eazifly_student/domain/entities/home/get_home_library_entity.dart';
import 'package:eazifly_student/domain/entities/home/get_home_quizzes_entity.dart';
import 'package:eazifly_student/domain/entities/library_order_and_subscription_entity.dart';
import 'package:eazifly_student/domain/entities/like_item_entity.dart';
import 'package:eazifly_student/domain/entities/login_entities.dart';
import 'package:eazifly_student/domain/entities/my_programs/change_session_status_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/content/complete_chapter_lesson_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/content/get_chapter_lessons_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/content/get_content_chapter.dart';
import 'package:eazifly_student/domain/entities/my_programs/content/get_program_content_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_assigned_children_to_program_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_assignment_details_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_my_programs_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_program_assignments_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_program_sessions_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_report_questions_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_session_details_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_user_feedbacks_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_user_reports_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/join_session_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/post_assignment_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/quizzes/get_quiz_questions_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/quizzes/get_user_quizzes_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/quizzes/submit_quiz_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/show_program_details_entity.dart';
import 'package:eazifly_student/domain/entities/notification/auth/logout_entity.dart';
import 'package:eazifly_student/domain/entities/notification/get_latest_notifications_entities.dart';
import 'package:eazifly_student/domain/entities/notification/read_notification_entities.dart';
import 'package:eazifly_student/domain/entities/sessions/cancel_session_entity.dart';
import 'package:eazifly_student/domain/entities/sessions/change_session_date_entity.dart';
import 'package:eazifly_student/domain/entities/sessions/get_cancel_session_reason_entity.dart';
import 'package:eazifly_student/domain/entities/sessions/get_instructor_availabilities_entity.dart';
import 'package:eazifly_student/domain/entities/show_library_item_entity.dart';
import 'package:eazifly_student/domain/entities/store_favourite_list_entity.dart';
import 'package:eazifly_student/domain/entities/subscription_management/cancel_subscription_entity.dart';
import 'package:eazifly_student/domain/entities/subscription_management/get_library_subscription_entity.dart';
import 'package:eazifly_student/domain/entities/subscription_management/get_program_subscription_entity.dart';
import 'package:eazifly_student/domain/entities/subscription_management/remove_assigned_student_entity.dart';
import 'package:eazifly_student/domain/entities/subscription_management/renew_subscription_entity.dart';
import 'package:eazifly_student/domain/entities/subscription_management/show_plan_entity.dart';
import 'package:eazifly_student/domain/entities/subscription_management/upgrade_order_entity.dart';
import 'package:eazifly_student/domain/entities/update_fcm_token_entity.dart';
import 'package:eazifly_student/domain/entities/user/copoun_history_entity.dart';
import 'package:eazifly_student/domain/entities/user/delete_account_entity.dart';
import 'package:eazifly_student/domain/entities/user/update_profile_entity.dart';

import '../../data/models/auth/login_tojson.dart';
import '../../data/models/auth/register_tojson.dart';
import '../../data/models/auth/reset_password_tojson.dart';
import '../entities/auth/forgot_password_entity.dart';
import '../entities/auth/reset_password_entity.dart';
import '../entities/get_geidea_settings/get_geidea_data_entity.dart';

abstract class BaseRepository {
  Future<Either<Failure, LoginEntity>> login({
    required LoginToJson data,
  });

  Future<Either<Failure, RegisterEntity>> register(
      {required RegisterToJson data});

  Future<Either<Failure, ForgotPasswordEntity>> forgotPassword(
      {required String email});

  Future<Either<Failure, ResetPasswordEntity>> resetPassword(
      {required ResetPasswordToJson data});

  Future<Either<Failure, GetProgramsEntity>> getPrograms();
  Future<Either<Failure, GetGeideaDataEntity>> geideaData({required String key});

  Future<Either<Failure, GetProgramDetailsEntity>> getProgramDetails(
      {required int programId});

  Future<Either<Failure, AssignProgramReviewEntity>> assignProgramReview(
      {required AssignProgramReviewTojson data});

  Future<Either<Failure, GetPlansWithDetailsEntity>> getPlansWithDetails(
      {required int programId, required int days});

  Future<Either<Failure, GetPlansEntity>> getPlans({required int programId});

  Future<Either<Failure, FilterPlansEntity>> filterPlans(
      {required FilterPlansTojson data});

  Future<Either<Failure, CreateOrderEntity>> createOrder(
      {required CreateOrderTojson data});

  Future<Either<Failure, CheckCopounEntity>> checkCopoun(
      {required CheckCopounTojson data});

  Future<Either<Failure, GetProgramPaymentMethodsEntity>>
      getProgramPaymentMethods({required int programId});

  Future<Either<Failure, GetPaymentMethodDetailsEntity>>
      getPaymentMethodDetails({required int programId, required int methodId});

  Future<Either<Failure, GetUserOrdersEntity>> getUserOrders();

  Future<Either<Failure, GetLibraryCategoriesEntity>> getLibraryCategories(
      {String? type});

  Future<Either<Failure, GetAllLibraryListsEntity>> getAllLibraryLists();

  Future<Either<Failure, StoreFavouriteListEntity>> storeFavouriteList(
      {required StoreFavouriteListTojson data});

  Future<Either<Failure, GetFavouriteListEntity>> getFavouriteList();

  Future<Either<Failure, GetFavouriteListItemsUsingListIdEntity>>
      getFavouriteListItemsUsinListId({required int listId});

  Future<Either<Failure, GetAllItemsEntity>> getAllItems();

  Future<Either<Failure, AddSingleItemToFavListEntity>> addSingleItemToFavList(
      {required AddSingleItemToFavListTojson data});

  Future<Either<Failure, GetListItemsUsingListIdEntity>>
      getListItemsUsingListId({required int listId});

  Future<Either<Failure, LikeItemEntity>> likeItem({
    required int itemId,
    required bool status,
  });

  Future<Either<Failure, GetMyChildrenEntity>> getMyChildren(
      {required bool childrensStatus});

  Future<Either<Failure, CreateNewChildEntity>> createNewChild(
      {required CreateNewChildTojson data});

  Future<Either<Failure, ShowLibraryItemEntity>> showLibraryItem(
      {required int itemId});

  Future<Either<Failure, GetPlanSubscriptionPeriodEntity>>
      getPlanSubscriptionPeriod();

  Future<Either<Failure, GetLibraryPlansEntity>> getLibraryPlans(
      {required int days});

  Future<Either<Failure, LibraryOrderAndSubscriptionEntity>>
      libraryOrderAndSubscribe({required LibraryOrderAndSubscribeTojson data});

  Future<Either<Failure, GetMyProgramsEntity>> getMyPrograms();

  Future<Either<Failure, GetSessionDetailsEntity>> getSessionDetails({
    required int sessionId,
  });

  Future<Either<Failure, JoinSessionEntity>> joinSession({
    required JoinSessionTojson data,
  });

  Future<Either<Failure, GetAssignedChildrenToProgramEntity>>
      getAssignedChildrenToProgram({
    required int programId,
  });

  Future<Either<Failure, ChangeSessionStatusEntity>> changeSessionStatus({
    required ChangeSessionStatusToJson data,
  });

  Future<Either<Failure, ShowProgramDetailsEntity>> showProgramDetails({
    required int programId,
  });

  Future<Either<Failure, GetProgramSessionsEntity>> getProgramSessions({
    required int programId,
    required int userId,
  });

  Future<Either<Failure, GetProgramAssignmentsEntity>> getProgramAssignments({
    required int programId,
    required int userId,
  });

  Future<Either<Failure, GetUserReportsEntity>> getUserReports({
    required int userId,
  });

  Future<Either<Failure, GetUserFeedbacksEntity>> getUserFeedbacks({
    required int userId,
  });

  Future<Either<Failure, GetContentChapterEntity>> getContentChapters({
    required int userId,
  });

  Future<Either<Failure, GetChapterLessonsEntity>> getChapterLessons({
    required int chapterId,
  });

  Future<Either<Failure, CompleteChapterLessonEntity>> completeChapterLesson({
    required int lessonId,
  });

  Future<Either<Failure, GetUserQuizzesEntity>> getUserQuizzes({
    required int userId,
    required int programId,
  });

  Future<Either<Failure, GetQuizQuestionsEntity>> getQuizQuestions({
    required int userId,
    required int quizId,
    required int programId,
  });

  Future<Either<Failure, SubmitQuizEntity>> submitQuiz({
    required SubmitQuizTojson data,
  });

  Future<Either<Failure, GetAssignmentDetailsEntity>> getAssignmentDetails({
    required int assignmentId,
    required int userId,
  });

  Future<Either<Failure, GetMessagesEntities>> getMessages(
      {required int chatId, required int offset});

  Future<Either<Failure, SendMessagesEntities>> sendMessages(
      {required SendMessagesTojson data});

  Future<Either<Failure, PostAssignmentEntity>> postAssignment(
      {required PostAssignmentTojson data});

  Future<Either<Failure, GetProgramSubscriptionEntity>>
      getProgramSubscription();

  Future<Either<Failure, GetLibrarySubscriptionEntity>>
      getLibrarySubscription();

  Future<Either<Failure, CancelSubscriptionEntity>> cancelSubscription({
    required int mainId,
  });

  Future<Either<Failure, RenewSubscriptionEntity>> renewSubscription({
    required RenewSubscriptionTojson data,
  });

  Future<Either<Failure, ShowPlanEntity>> showPlan({
    required int planId,
  });

  Future<Either<Failure, UpgradeOrderEntity>> upgradeOrder({
    required RenewSubscriptionTojson data,
  });

  Future<Either<Failure, GetReportQuestionsEntity>> getReportQuestions({
    required String reportMakerType,
    required String reportForType,
    required int reportMakerId,
    required int reportForId,
    required int meetingSessionId,
  });

  Future<Either<Failure, GetOrderDetailsEntity>> getOrderDetails(
      {required int orderId});

  Future<Either<Failure, AddWeeklyAppontmentsEntity>> addWeeklyAppointments({
    required AddWeeklyAppointmentsTojson data,
  });

  Future<Either<Failure, CreateMeetingSessionsEntity>> createMeetingSessions({
    required CreateMeetingSessionsTojson data,
  });

  Future<Either<Failure, GetInstructorsEntity>> getInstructors({
    required GetInstructorsTojson data,
  });

  Future<Either<Failure, GetProgramContentEntity>> getProgramContent({
    required int programId,
  });

  Future<Either<Failure, AddNoteEntity>> addNote({
    required AddNoteTojson data,
  });

  Future<Either<Failure, GetCancelSessionReasonEntity>>
      gettCancelSessionReasons();

  Future<Either<Failure, GetInstructorAvailabilitiesEntity>>
      getInstructorAvailabilities({
    required int instructorId,
    required int duration,
  });

  Future<Either<Failure, ChangeSessionDateEntity>> changeSessionDate({
    required ChangeSessionDateTojson data,
    required int sessionId,
  });

  Future<Either<Failure, CancelSessionEntity>> cancelSession({
    required CancelSessionTojson data,
  });

  Future<Either<Failure, GetRemainingProgramSessionsEntity>>
      getRemainingProgramSessions({
    required int userId,
    required int programId,
  });

  Future<Either<Failure, ChangeInstructorEntity>> changeInstructor({
    required ChangeInstructorTojson data,
    required bool isNewDates,
  });

  Future<Either<Failure, GetUserSubscriptionDataEntity>>
      getUserSubscriptionData({
    required int programId,
    required int userId,
  });

  Future<Either<Failure, GetChangeInstructorReasonsEntity>>
      getChangeInstructorReasons();

  Future<Either<Failure, UpdateProfileEntity>> updateProfile({
    required int userId,
    required UpdateProfileTojson data,
  });

  Future<Either<Failure, RemoveAssignedStudentEntity>> removeAssignedStudent({
    required int userId,
    required int programId,
  });

  Future<Either<Failure, GetHomeCurrentSessionEntity>> getHomeCurrentSession({
    required int userId,
  });

  Future<Either<Failure, GetHomeLibraryEntity>> getHomeLibrary();

  Future<Either<Failure, GetHomeClosestSessionsEntity>> getHomeClosestSessions({
    required int userId,
  });

  Future<Either<Failure, GetHomeAssignmentsEntity>> getHomeAssigments(
      {required int userId});

  Future<Either<Failure, GetHomeQuizzesEntity>> getHomeQuizzes({
    required int userId,
  });

  Future<Either<Failure, GetMyChatsEntity>> getMyChats({
    required String type,
  });

  Future<Either<Failure, UpdateFcmTokenEntity>> updateFcmToken(
      {required String fcmToken});

  Future<Either<Failure, GetLatestNotificationsEntities>> getLatestNotification(
      {required String type, required int offset});

  Future<Either<Failure, ReadNotificationEntities>> readNotification(
      {required int notificationId});

  Future<Either<Failure, LogoutEntity>> logout();

  Future<Either<Failure, DeleteAccountEntity>> deleteAccount(
      {required int userId});

  Future<Either<Failure, CheckChatEntity>> checkChat(
      {required CheckChatTojson data});

  Future<Either<Failure, RequestToFindInstructorEntity>> findInstructor(
      {required RequestToFindInstructorTojson data});

  Future<Either<Failure, CopounHistoryEntity>> copounHistory();
}
