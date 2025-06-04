import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/exceptions/exceptions.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/data_source/remote_data_source.dart';
import 'package:eazifly_student/data/models/auth/login_model.dart';
import 'package:eazifly_student/data/models/library/favourite_list/add_single_item_to_fav_list_model.dart';
import 'package:eazifly_student/data/models/library/favourite_list/add_single_item_to_fav_tojson.dart';
import 'package:eazifly_student/data/models/library/favourite_list/get_favourite_list_items_using_list_id_model.dart';
import 'package:eazifly_student/data/models/library/favourite_list/store_favourite_list_model.dart';
import 'package:eazifly_student/data/models/library/favourite_list/store_favourite_list_tojson.dart';
import 'package:eazifly_student/data/models/library/get_all_library_lists_model.dart';
import 'package:eazifly_student/data/models/library/get_library_categories_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/check_copoun_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/check_copoun_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/create_order_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/filter_plan_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/get_program_payment_methods_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/get_user_orders_model.dart';
import 'package:eazifly_student/data/models/programs/assign_program_review_model.dart';
import 'package:eazifly_student/data/models/programs/assign_program_review_tojson.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/create_order_entities.dart';
import 'package:eazifly_student/domain/entities/filter_plan_entities.dart';
import 'package:eazifly_student/domain/entities/get_all_items_entity.dart';
import 'package:eazifly_student/domain/entities/get_favourite_list_entity.dart';
import 'package:eazifly_student/domain/entities/get_payment_method_details_entities.dart';
import 'package:eazifly_student/domain/entities/get_plan_with_details_entities.dart';
import 'package:eazifly_student/domain/entities/get_plans_entities.dart';
import 'package:eazifly_student/domain/entities/get_program_details_entities.dart';
import 'package:eazifly_student/domain/entities/get_programs_entities.dart';

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
      {required int planId}) async {
    try {
      final result =
          await baseRemoteDataSource.getPlansWithDetails(planId: planId);
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
}
