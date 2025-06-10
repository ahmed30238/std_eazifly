import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/library/favourite_list/add_single_item_to_fav_tojson.dart';
import 'package:eazifly_student/data/models/library/favourite_list/store_favourite_list_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/check_copoun_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/create_order_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/filter_plan_tojson.dart';
import 'package:eazifly_student/data/models/programs/assign_program_review_tojson.dart';
import 'package:eazifly_student/domain/entities/add_single_item_to_fav_list_entity.dart';
import 'package:eazifly_student/domain/entities/assign_program_review_entities.dart';
import 'package:eazifly_student/domain/entities/check_copoun_entities.dart';
import 'package:eazifly_student/domain/entities/create_order_entities.dart';
import 'package:eazifly_student/domain/entities/filter_plan_entities.dart';
import 'package:eazifly_student/domain/entities/get_all_items_entity.dart';
import 'package:eazifly_student/domain/entities/get_all_library_lists_entity.dart';
import 'package:eazifly_student/domain/entities/get_favourite_list_entity.dart';
import 'package:eazifly_student/domain/entities/get_favourite_list_items_using_list_id_entity.dart';
import 'package:eazifly_student/domain/entities/get_library_category_entity.dart';
import 'package:eazifly_student/domain/entities/get_list_items_using_list_id_entity.dart';
import 'package:eazifly_student/domain/entities/get_payment_method_details_entities.dart';
import 'package:eazifly_student/domain/entities/get_plan_with_details_entities.dart';
import 'package:eazifly_student/domain/entities/get_plans_entities.dart';
import 'package:eazifly_student/domain/entities/get_program_details_entities.dart';
import 'package:eazifly_student/domain/entities/get_program_payment_methods_entities.dart';
import 'package:eazifly_student/domain/entities/get_programs_entities.dart';
import 'package:eazifly_student/domain/entities/get_user_orders_entities.dart';
import 'package:eazifly_student/domain/entities/login_entities.dart';
import 'package:eazifly_student/domain/entities/store_favourite_list_entity.dart';

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
  Future<Either<Failure, GetPlansWithDetailsEntity>> getPlansWithDetails(
      {required int planId});
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
}
