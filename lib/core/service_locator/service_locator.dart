import 'package:eazifly_student/data/data_source/remote_data_source.dart';
import 'package:eazifly_student/data/repo/repo.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/use_cases/add_single_item_to_fav_usecase.dart';
import 'package:eazifly_student/domain/use_cases/check_copoun_usecase.dart';
import 'package:eazifly_student/domain/use_cases/create_order_usecase.dart';
import 'package:eazifly_student/domain/use_cases/filter_plans_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_all_items_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_all_library_lists_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_favourite_list_item_using_list_id_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_favourite_list_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_library_categories_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_payment_method_details_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_plans_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_program_details_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_program_payment_methods_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_programs_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_user_orders_usecase.dart';
import 'package:eazifly_student/domain/use_cases/login_usecase.dart';
import 'package:eazifly_student/domain/use_cases/store_favourite_list_usecase.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

class ServiceLocator {
  init() {
    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
    sl.registerLazySingleton<BaseRepository>(
        () => Repository(baseRemoteDataSource: sl()));
    sl.registerLazySingleton(() => LoginUsecase(baseRepository: sl()));
    sl.registerLazySingleton(() => GetProgramsUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => GetProgramDetailsUsecase(baseRepository: sl()));
    sl.registerLazySingleton(() => GetPlansUsecase(baseRepository: sl()));
    sl.registerLazySingleton(() => FilterPlansUsecase(baseRepository: sl()));
    sl.registerLazySingleton(() => CreateOrderUsecase(baseRepository: sl()));
    sl.registerLazySingleton(() => CheckCopounUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => GetPaymentMethodDetailsUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => GetProgramPaymentMethodsUsecase(baseRepository: sl()));
    sl.registerLazySingleton(() => GetUserOrdersUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => GetLibraryCategoriesUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => GetAllLibraryListsUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => StoreFavouriteListUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => GetFavouriteListUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => GetFavouriteListItemUsingListIdUsecase(baseRepository: sl()));
    sl.registerLazySingleton(() => GetAllItemsUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => AddSingleItemToFavUsecase(baseRepository: sl()));
  }
}
