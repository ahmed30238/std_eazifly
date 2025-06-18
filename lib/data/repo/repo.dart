import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/exceptions/exceptions.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/data_source/remote_data_source.dart';
import 'package:eazifly_student/data/models/auth/login_model.dart';
import 'package:eazifly_student/data/models/children/create_new_child_tojson.dart';
import 'package:eazifly_student/data/models/children/get_my_children_model.dart';
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
import 'package:eazifly_student/data/models/my_programs/get_my_programs_model.dart';
import 'package:eazifly_student/data/models/my_programs/get_program_assignments_model.dart';
import 'package:eazifly_student/data/models/my_programs/get_program_sessions_model.dart';
import 'package:eazifly_student/data/models/my_programs/get_session_details_model.dart';
import 'package:eazifly_student/data/models/my_programs/get_user_reports_model.dart';
import 'package:eazifly_student/data/models/my_programs/join_session_tojson.dart';
import 'package:eazifly_student/data/models/my_programs/show_program_details_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/check_copoun_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/check_copoun_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/create_order_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/filter_plan_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/get_program_payment_methods_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/get_user_orders_model.dart';
import 'package:eazifly_student/data/models/programs/assign_program_review_model.dart';
import 'package:eazifly_student/data/models/programs/assign_program_review_tojson.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/children_entities/create_new_child_entity.dart';
import 'package:eazifly_student/domain/entities/create_order_entities.dart';
import 'package:eazifly_student/domain/entities/filter_plan_entities.dart';
import 'package:eazifly_student/domain/entities/get_all_items_entity.dart';
import 'package:eazifly_student/domain/entities/get_favourite_list_entity.dart';
import 'package:eazifly_student/domain/entities/get_payment_method_details_entities.dart';
import 'package:eazifly_student/domain/entities/get_plan_with_details_entities.dart';
import 'package:eazifly_student/domain/entities/get_plans_entities.dart';
import 'package:eazifly_student/domain/entities/get_program_details_entities.dart';
import 'package:eazifly_student/domain/entities/get_programs_entities.dart';
import 'package:eazifly_student/domain/entities/like_item_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/change_session_status_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_assigned_children_to_program_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/join_session_entity.dart';

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
}
