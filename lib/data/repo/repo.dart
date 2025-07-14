import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/exceptions/exceptions.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/data_source/remote_data_source.dart';
import 'package:eazifly_student/data/models/auth/login_model.dart';
import 'package:eazifly_student/data/models/auth/update_fcm_token_model.dart';
import 'package:eazifly_student/data/models/change_instructor/change_instructor_model.dart';
import 'package:eazifly_student/data/models/change_instructor/change_instructor_tojson.dart';
import 'package:eazifly_student/data/models/change_instructor/get_change_instructor_reasons_model.dart';
import 'package:eazifly_student/data/models/change_instructor/get_remaining_program_sessions_model.dart';
import 'package:eazifly_student/data/models/change_instructor/get_user_subscription_data_model.dart';
import 'package:eazifly_student/data/models/chat_model/check_chat_tojson.dart';
import 'package:eazifly_student/data/models/chat_model/get_my_chats_model.dart';
import 'package:eazifly_student/data/models/chat_model/send_messages_tojson.dart';
import 'package:eazifly_student/data/models/children/create_new_child_tojson.dart';
import 'package:eazifly_student/data/models/children/get_my_children_model.dart';
import 'package:eazifly_student/data/models/home/get_home_closest_sessions_model.dart';
import 'package:eazifly_student/data/models/home/get_home_current_session_model.dart';
import 'package:eazifly_student/data/models/library/favourite_list/add_single_item_to_fav_list_model.dart';
import 'package:eazifly_student/data/models/library/favourite_list/add_single_item_to_fav_tojson.dart';
import 'package:eazifly_student/data/models/library/favourite_list/get_favourite_list_items_using_list_id_model.dart';
import 'package:eazifly_student/data/models/library/favourite_list/store_favourite_list_model.dart';
import 'package:eazifly_student/data/models/library/favourite_list/store_favourite_list_tojson.dart';
import 'package:eazifly_student/data/models/library/get_all_library_lists_model.dart';
import 'package:eazifly_student/data/models/library/get_library_categories_model.dart';
import 'package:eazifly_student/data/models/library/get_list_items_using_list_id_model.dart';
import 'package:eazifly_student/data/models/library/library_order_and_subscribe_tojson.dart';
import 'package:eazifly_student/data/models/library/library_order_and_subscription_model.dart';
import 'package:eazifly_student/data/models/library/plans/get_library_plans_model.dart';
import 'package:eazifly_student/data/models/library/plans/get_plan_subscription_period_model.dart';
import 'package:eazifly_student/data/models/library/show_library_item_model.dart';
import 'package:eazifly_student/data/models/my_programs/change_session_status_tojson.dart';
import 'package:eazifly_student/data/models/my_programs/content/complete_chapter_lesson_model.dart';
import 'package:eazifly_student/data/models/my_programs/content/get_chapter_lessons_model.dart';
import 'package:eazifly_student/data/models/my_programs/content/get_content_chapter_model.dart';
import 'package:eazifly_student/data/models/my_programs/content/get_program_content_model.dart';
import 'package:eazifly_student/data/models/my_programs/get_assignment_details_model.dart';
import 'package:eazifly_student/data/models/my_programs/get_my_programs_model.dart';
import 'package:eazifly_student/data/models/my_programs/get_program_assignments_model.dart';
import 'package:eazifly_student/data/models/my_programs/get_program_sessions_model.dart';
import 'package:eazifly_student/data/models/my_programs/get_report_questions_model.dart';
import 'package:eazifly_student/data/models/my_programs/get_session_details_model.dart';
import 'package:eazifly_student/data/models/my_programs/get_user_feedbacks_model.dart';
import 'package:eazifly_student/data/models/my_programs/get_user_reports_model.dart';
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
import 'package:eazifly_student/data/models/order_and_subscribe/add_note_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/assign_appointments/add_weekly_appointments_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/assign_appointments/add_weekly_appointments_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/assign_appointments/create_meeting_sessions_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/assign_appointments/get_instructors_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/check_copoun_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/check_copoun_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/create_order_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/filter_plan_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/get_instructors_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/get_program_payment_methods_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/get_user_orders_model.dart';
import 'package:eazifly_student/data/models/programs/assign_program_review_model.dart';
import 'package:eazifly_student/data/models/programs/assign_program_review_tojson.dart';
import 'package:eazifly_student/data/models/sessions/cancel_session_tojson.dart';
import 'package:eazifly_student/data/models/sessions/change_session_date_tojson.dart';
import 'package:eazifly_student/data/models/subscription_management/cancel_subscription_model.dart';
import 'package:eazifly_student/data/models/subscription_management/get_library_subscription_model.dart';
import 'package:eazifly_student/data/models/subscription_management/remove_assigned_student_model.dart';
import 'package:eazifly_student/data/models/subscription_management/renew_subscription_model.dart';
import 'package:eazifly_student/data/models/subscription_management/renew_subscription_tojson.dart';
import 'package:eazifly_student/data/models/subscription_management/show_plan_model.dart';
import 'package:eazifly_student/data/models/subscription_management/upgrade_order_model.dart';
import 'package:eazifly_student/data/models/user/delete_account_model.dart';
import 'package:eazifly_student/data/models/user/update_profile_model.dart';
import 'package:eazifly_student/data/models/user/update_profile_tojson.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/add_note_entity.dart';
import 'package:eazifly_student/domain/entities/chat/check_chat_entity.dart';
import 'package:eazifly_student/domain/entities/chat/get_messages_entities.dart';
import 'package:eazifly_student/domain/entities/chat/send_messages_entities.dart';
import 'package:eazifly_student/domain/entities/children_entities/create_new_child_entity.dart';
import 'package:eazifly_student/domain/entities/create_meeting_sessions_entity.dart';
import 'package:eazifly_student/domain/entities/create_order_entities.dart';
import 'package:eazifly_student/domain/entities/filter_plan_entities.dart';
import 'package:eazifly_student/domain/entities/get_all_items_entity.dart';
import 'package:eazifly_student/domain/entities/get_favourite_list_entity.dart';
import 'package:eazifly_student/domain/entities/get_order_details_entity.dart';
import 'package:eazifly_student/domain/entities/get_payment_method_details_entities.dart';
import 'package:eazifly_student/domain/entities/get_plan_with_details_entities.dart';
import 'package:eazifly_student/domain/entities/get_plans_entities.dart';
import 'package:eazifly_student/domain/entities/get_program_details_entities.dart';
import 'package:eazifly_student/domain/entities/get_programs_entities.dart';
import 'package:eazifly_student/domain/entities/home/get_home_assigments_entity.dart';
import 'package:eazifly_student/domain/entities/home/get_home_library_entity.dart';
import 'package:eazifly_student/domain/entities/home/get_home_quizzes_entity.dart';
import 'package:eazifly_student/domain/entities/like_item_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/change_session_status_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_assigned_children_to_program_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/join_session_entity.dart';
import 'package:eazifly_student/domain/entities/notification/auth/logout_entity.dart';
import 'package:eazifly_student/domain/entities/sessions/cancel_session_entity.dart';
import 'package:eazifly_student/domain/entities/sessions/change_session_date_entity.dart';
import 'package:eazifly_student/domain/entities/sessions/get_cancel_session_reason_entity.dart';
import 'package:eazifly_student/domain/entities/sessions/get_instructor_availabilities_entity.dart';
import 'package:eazifly_student/domain/entities/subscription_management/get_program_subscription_entity.dart';

class Repository extends BaseRepository {
  BaseRemoteDataSource baseRemoteDataSource;
  Repository({
    required this.baseRemoteDataSource,
  });

  @override
  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await baseRemoteDataSource.login(email, password);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetProgramsEntity>> getPrograms() async {
    try {
      final result = await baseRemoteDataSource.getPrograms();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetProgramDetailsEntity>> getProgramDetails(
      {required int programId}) async {
    try {
      final result =
          await baseRemoteDataSource.getProgramDetails(programId: programId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, AssignProgramReviewModel>> assignProgramReview(
      {required AssignProgramReviewTojson data}) async {
    try {
      final result = await baseRemoteDataSource.assignProgramReview(data: data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetPlansWithDetailsEntity>> getPlansWithDetails(
      {required int programId, required int days}) async {
    try {
      final result = await baseRemoteDataSource.getPlansWithDetails(
        programId: programId,
        days: days,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetPlansEntity>> getPlans(
      {required int programId}) async {
    try {
      final result = await baseRemoteDataSource.getPlans(programId: programId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, FilterPlansEntity>> filterPlans(
      {required FilterPlansTojson data}) async {
    try {
      final result = await baseRemoteDataSource.filterPlans(data: data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, CreateOrderEntity>> createOrder(
      {required CreateOrderTojson data}) async {
    try {
      final result = await baseRemoteDataSource.createOrder(data: data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, CheckCopounModel>> checkCopoun(
      {required CheckCopounTojson data}) async {
    try {
      final result = await baseRemoteDataSource.checkCopoun(data: data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetProgramPaymentMethodsModel>>
      getProgramPaymentMethods({required int programId}) async {
    try {
      final result = await baseRemoteDataSource.getProgramPaymentMethods(
          programId: programId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetPaymentMethodDetailsEntity>>
      getPaymentMethodDetails(
          {required int programId, required int methodId}) async {
    try {
      final result = await baseRemoteDataSource.getPaymentMethodDetails(
          programId: programId, methodId: methodId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetUserOrdersModel>> getUserOrders() async {
    try {
      final result = await baseRemoteDataSource.getUserOrders();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetLibraryCategoriesModel>> getLibraryCategories(
      {String? type}) async {
    try {
      final result =
          await baseRemoteDataSource.getLibraryCategories(type: type);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetAllLibraryListsModel>> getAllLibraryLists() async {
    try {
      final result = await baseRemoteDataSource.getAllLibraryLists();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, StoreFavouriteListModel>> storeFavouriteList(
      {required StoreFavouriteListTojson data}) async {
    try {
      final result = await baseRemoteDataSource.storeFavouriteList(data: data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetFavouriteListEntity>> getFavouriteList() async {
    try {
      final result = await baseRemoteDataSource.getFavouriteList();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetFavouriteListItemsUsingListIdModel>>
      getFavouriteListItemsUsinListId({required int listId}) async {
    try {
      final result = await baseRemoteDataSource.getFavouriteListItemsUsinListId(
          listId: listId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetAllItemsEntity>> getAllItems() async {
    try {
      final result = await baseRemoteDataSource.getAllItems();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, AddSingleItemToFavListModel>> addSingleItemToFavList(
      {required AddSingleItemToFavListTojson data}) async {
    try {
      final result =
          await baseRemoteDataSource.addSingleItemToFavList(data: data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetListItemsUsingListIdModel>> getListItemsUsingListId(
      {required int listId}) async {
    try {
      final result =
          await baseRemoteDataSource.getListItemsUsingListId(listId: listId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, LikeItemEntity>> likeItem(
      {required int itemId, required bool status}) async {
    try {
      final result =
          await baseRemoteDataSource.likeItem(itemId: itemId, status: status);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetMyChildrenModel>> getMyChildren(
      {required bool childrensStatus}) async {
    try {
      final result = await baseRemoteDataSource.getMyChildren(
        childresStatus: childrensStatus,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, CreateNewChildEntity>> createNewChild(
      {required CreateNewChildTojson data}) async {
    try {
      final result = await baseRemoteDataSource.createNewChild(
        data: data,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, ShowLibraryItemModel>> showLibraryItem(
      {required int itemId}) async {
    try {
      final result = await baseRemoteDataSource.showLibraryItem(
        itemId: itemId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetPlanSubscriptionPeriodModel>>
      getPlanSubscriptionPeriod() async {
    try {
      final result = await baseRemoteDataSource.getPlanSubscriptionPeriod();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetLibraryPlansModel>> getLibraryPlans(
      {required int days}) async {
    try {
      final result = await baseRemoteDataSource.getLibraryPlans(days: days);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, LibraryOrderAndSubscriptionModel>>
      libraryOrderAndSubscribe(
          {required LibraryOrderAndSubscribeTojson data}) async {
    try {
      final result =
          await baseRemoteDataSource.libraryOrderAndSubscription(data: data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetMyProgramsModel>> getMyPrograms() async {
    try {
      final result = await baseRemoteDataSource.getMyPrograms();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetSessionDetailsModel>> getSessionDetails(
      {required int sessionId}) async {
    try {
      final result =
          await baseRemoteDataSource.getSessionDetails(sessionId: sessionId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, JoinSessionEntity>> joinSession(
      {required JoinSessionTojson data}) async {
    try {
      final result = await baseRemoteDataSource.joinSession(
        data: data,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetAssignedChildrenToProgramEntity>>
      getAssignedChildrenToProgram({required int programId}) async {
    try {
      final result = await baseRemoteDataSource.getAssignedChildrenToProgram(
        programId: programId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, ChangeSessionStatusEntity>> changeSessionStatus(
      {required ChangeSessionStatusToJson data}) async {
    try {
      final result = await baseRemoteDataSource.changeSessionStatus(
        data: data,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, ShowProgramDetailsModel>> showProgramDetails(
      {required int programId}) async {
    try {
      final result = await baseRemoteDataSource.showProgramDetails(
        programId: programId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetProgramSessionsModel>> getProgramSessions(
      {required int programId, required int userId}) async {
    try {
      final result = await baseRemoteDataSource.getProgramSessions(
        programId: programId,
        userId: userId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetProgramAssignmentsModel>> getProgramAssignments(
      {required int programId, required int userId}) async {
    try {
      final result = await baseRemoteDataSource.getProgramAssignments(
        programId: programId,
        userId: userId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetUserReportsModel>> getUserReports(
      {required int userId}) async {
    try {
      final result = await baseRemoteDataSource.getUserReports(
        userId: userId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetUserFeedbacksModel>> getUserFeedbacks(
      {required int userId}) async {
    try {
      final result = await baseRemoteDataSource.getUserFeedbacks(
        userId: userId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetContentChapterModel>> getContentChapters(
      {required int userId}) async {
    try {
      final result = await baseRemoteDataSource.getContentChapter(
        userId: userId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetChapterLessonsModel>> getChapterLessons(
      {required int chapterId}) async {
    try {
      final result = await baseRemoteDataSource.getChapterLessons(
        chapterId: chapterId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, CompleteChapterLessonModel>> completeChapterLesson(
      {required int lessonId}) async {
    try {
      final result = await baseRemoteDataSource.completeChapterLesson(
        lessonId: lessonId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetQuizQuestionsModel>> getQuizQuestions({
    required int userId,
    required int quizId,
    required int programId,
  }) async {
    try {
      final result = await baseRemoteDataSource.getQuizQuestions(
        programId: programId,
        quizId: quizId,
        userId: userId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetUserQuizzesModel>> getUserQuizzes(
      {required int userId, required int programId}) async {
    try {
      final result = await baseRemoteDataSource.getUserQuizzes(
        programId: programId,
        userId: userId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, SubmitQuizModel>> submitQuiz(
      {required SubmitQuizTojson data}) async {
    try {
      final result = await baseRemoteDataSource.submitQuiz(
        data: data,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetAssignmentDetailsModel>> getAssignmentDetails(
      {required int assignmentId, required int userId}) async {
    try {
      final result = await baseRemoteDataSource.getAssignmentDetails(
        userId: userId,
        assignmentId: assignmentId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetMessagesEntities>> getMessages(
      {required int chatId, required int offset}) async {
    final result = await baseRemoteDataSource.getMessages(
      chatId: chatId,
      offset: offset,
    );
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, SendMessagesEntities>> sendMessages(
      {required SendMessagesTojson data}) async {
    final result = await baseRemoteDataSource.sendMessages(data: data);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, PostAssignmentModel>> postAssignment(
      {required PostAssignmentTojson data}) async {
    final result = await baseRemoteDataSource.postAssignment(data: data);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetProgramSubscriptionEntity>>
      getProgramSubscription() async {
    try {
      final result = await baseRemoteDataSource.getProgramSubscriptions();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetLibrarySubscriptionModel>>
      getLibrarySubscription() async {
    try {
      final result = await baseRemoteDataSource.getLibrarySubscription();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, CancelSubscriptionModel>> cancelSubscription(
      {required int mainId}) async {
    try {
      final result =
          await baseRemoteDataSource.cancelSubscription(mainId: mainId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, RenewSubscriptionModel>> renewSubscription(
      {required RenewSubscriptionTojson data}) async {
    try {
      final result = await baseRemoteDataSource.renewSubscription(data: data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, ShowPlanModel>> showPlan({required int planId}) async {
    try {
      final result = await baseRemoteDataSource.showPlan(planId: planId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, UpgradeOrderModel>> upgradeOrder(
      {required CreateOrderTojson data}) async {
    try {
      final result = await baseRemoteDataSource.upgradeOrder(data: data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetReportQuestionsModel>> getReportQuestions({
    required String reportMakerType,
    required String reportForType,
    required int reportMakerId,
    required int reportForId,
    required int meetingSessionId,
  }) async {
    try {
      final result = await baseRemoteDataSource.getReportQuestions(
        meetingSessionId: meetingSessionId,
        reportForId: reportForId,
        reportForType: reportForType,
        reportMakerId: reportMakerId,
        reportMakerType: reportMakerType,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(message: e.errorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, AddWeeklyAppontmentsModel>> addWeeklyAppointments(
      {required AddWeeklyAppointmentsTojson data}) async {
    try {
      final result =
          await baseRemoteDataSource.addWeeklyAppointments(data: data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, CreateMeetingSessionsEntity>> createMeetingSessions(
      {required CreateMeetingSessionsTojson data}) async {
    try {
      final result =
          await baseRemoteDataSource.createMeetingSessions(data: data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetOrderDetailsEntity>> getOrderDetails(
      {required int orderId}) async {
    try {
      final result =
          await baseRemoteDataSource.getOrderDetails(orderId: orderId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetInstructorsModel>> getInstructors(
      {required GetInstructorsTojson data}) async {
    try {
      final result = await baseRemoteDataSource.getInstructors(data: data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetProgramContentModel>> getProgramContent(
      {required int programId}) async {
    try {
      final result =
          await baseRemoteDataSource.getProgramContent(programId: programId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, AddNoteEntity>> addNote(
      {required AddNoteTojson data}) async {
    try {
      final result = await baseRemoteDataSource.addNote(data: data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, CancelSessionEntity>> cancelSession(
      {required CancelSessionTojson data}) async {
    try {
      final result = await baseRemoteDataSource.cancelSession(data: data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, ChangeSessionDateEntity>> changeSessionDate(
      {required ChangeSessionDateTojson data, required int sessionId}) async {
    try {
      final result = await baseRemoteDataSource.changeSessionDate(
          data: data, sessionId: sessionId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetInstructorAvailabilitiesEntity>>
      getInstructorAvailabilities(
          {required int instructorId, required int duration}) async {
    try {
      final result = await baseRemoteDataSource.getInstructorAvailabilities(
          instructorId: instructorId, duration: duration);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetCancelSessionReasonEntity>>
      gettCancelSessionReasons() async {
    try {
      final result = await baseRemoteDataSource.getCancelSessionReasons();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, ChangeInstructorModel>> changeInstructor(
      {required ChangeInstructorTojson data}) async {
    try {
      final result = await baseRemoteDataSource.changeInstructor(data: data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetRemainingProgramSessionsModel>>
      getRemainingProgramSessions(
          {required int userId, required int programId}) async {
    try {
      final result = await baseRemoteDataSource.getRemainingProgramSessions(
        userId: userId,
        programId: programId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetUserSubscriptionDataModel>> getUserSubscriptionData(
      {required int programId, required int userId}) async {
    try {
      final result = await baseRemoteDataSource.getUserSubscriptionData(
        userId: userId,
        programId: programId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetChangeInstructorReasonsModel>>
      getChangeInstructorReasons() async {
    try {
      final result = await baseRemoteDataSource.getChangeInstructorReasons();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, UpdateProfileModel>> updateProfile(
      {required int userId, required UpdateProfileTojson data}) async {
    try {
      final result = await baseRemoteDataSource.updateProfile(
        data: data,
        userId: userId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, RemoveAssignedStudentModel>> removeAssignedStudent(
      {required int userId, required int programId}) async {
    try {
      final result = await baseRemoteDataSource.removeAssignedStudent(
        programId: programId,
        userId: userId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetHomeClosestSessionsModel>> getHomeClosestSessions(
      {required int userId}) async {
    try {
      final result = await baseRemoteDataSource.getHomeClosestSessions(
        userId: userId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetHomeCurrentSessionModel>> getHomeCurrentSession(
      {required int userId}) async {
    try {
      final result = await baseRemoteDataSource.getHomeCurrentSession(
        userId: userId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetHomeLibraryEntity>> getHomeLibrary() async {
    try {
      final result = await baseRemoteDataSource.getHomeLibrary();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetHomeAssignmentsEntity>> getHomeAssigments(
      {required int userId}) async {
    try {
      final result =
          await baseRemoteDataSource.getHomeAssignments(userId: userId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetHomeQuizzesEntity>> getHomeQuizzes(
      {required int userId}) async {
    try {
      final result = await baseRemoteDataSource.getHomeQuizzes(
        userId: userId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetMyChatsModel>> getMyChats(
      {required String type}) async {
    try {
      final result = await baseRemoteDataSource.getMyChats(
        type: type,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, UpdateFcmTokenModel>> updateFcmToken(
      {required String fcmToken}) async {
    final result =
        await baseRemoteDataSource.updateFcmToken(fcmToken: fcmToken);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetLatestNotificationModel>> getLatestNotification(
      {required String type, required int offset}) async {
    final result = await baseRemoteDataSource.getLatestNotification(
        type: type, offset: offset);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, ReadNotificationModel>> readNotification(
      {required int notificationId}) async {
    final result = await baseRemoteDataSource.readNotification(
        notificationId: notificationId);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, LogoutEntity>> logout() async {
    final result = await baseRemoteDataSource.logout();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, DeleteAccountModel>> deleteAccount(
      {required int userId}) async {
    final result = await baseRemoteDataSource.deleteAccount(userId: userId);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, CheckChatEntity>> checkChat(
      {required CheckChatTojson data}) async {
    final result = await baseRemoteDataSource.checkChat(data: data);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }
}
