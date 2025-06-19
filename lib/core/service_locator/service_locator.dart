import 'package:eazifly_student/data/data_source/remote_data_source.dart';
import 'package:eazifly_student/data/repo/repo.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/use_cases/add_single_item_to_fav_usecase.dart';
import 'package:eazifly_student/domain/use_cases/change_session_status_usecase.dart';
import 'package:eazifly_student/domain/use_cases/check_copoun_usecase.dart';
import 'package:eazifly_student/domain/use_cases/complete_chapter_lesson_usecase.dart';
import 'package:eazifly_student/domain/use_cases/create_new_child_usecase.dart';
import 'package:eazifly_student/domain/use_cases/create_order_usecase.dart';
import 'package:eazifly_student/domain/use_cases/filter_plans_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_all_items_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_all_library_lists_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_assigned_children_to_program_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_chapter_lessons_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_children_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_content_chapter_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_favourite_list_item_using_list_id_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_favourite_list_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_library_categories_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_library_plans_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_list_items_using_list_id_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_my_programs_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_payment_method_details_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_plan_subscription_period_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_plan_with_details_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_plans_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_program_assignments_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_program_details_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_program_payment_methods_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_program_sessions_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_programs_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_session_details_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_user_feedback_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_user_orders_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_user_reports_usecase.dart';
import 'package:eazifly_student/domain/use_cases/join_session_usecase.dart';
import 'package:eazifly_student/domain/use_cases/library_order_and_subscription_usecase.dart';
import 'package:eazifly_student/domain/use_cases/like_item_usecase.dart';
import 'package:eazifly_student/domain/use_cases/login_usecase.dart';
import 'package:eazifly_student/domain/use_cases/show_library_item_usecase.dart';
import 'package:eazifly_student/domain/use_cases/show_program_details_usecase.dart';
import 'package:eazifly_student/domain/use_cases/store_favourite_list_usecase.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/controller/payment_controller/payment_cubit.dart';
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
    sl.registerLazySingleton(
        () => GetListItemsUsingListIdUsecase(baseRepository: sl()));
    sl.registerLazySingleton(() => LikeItemUsecase(baseRepository: sl()));
    sl.registerLazySingleton(() => GetChildrenUsecase(baseRepository: sl()));
    sl.registerLazySingleton(() => CreateNewChildUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => ShowLibraryItemUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => GetPlanSubscriptionPeriodUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => GetLibraryPlansUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => LibraryOrderAndSubscriptionUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => GetPlanWithDetailsUsecase(baseRepository: sl()));
    sl.registerLazySingleton(() => GetMyProgramsUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => GetSessionDetailsUsecase(baseRepository: sl()));
    sl.registerLazySingleton(() => JoinSessionUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => GetAssignedChildrenToProgramUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => ChangeSessionStatusUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => ShowProgramDetailsUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => GetProgramSessionsUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => GetProgramAssignmentsUsecase(baseRepository: sl()));
    sl.registerLazySingleton(() => GetUserReportsUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => GetUserFeedbackUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => GetContentChapterUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => GetChapterLessonsUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => CompleteChapterLessonUsecase(baseRepository: sl()));

    // Registering the Factories
    sl.registerLazySingleton<PaymentCubit>(() => PaymentCubit(
          getProgramPaymentMethodsUsecase: sl(),
        ));
    sl.registerFactory<MyProgramsCubit>(
      () => MyProgramsCubit(
        getMyProgramsUsecase: sl(),
        changeSessionStatusUsecase: sl(),
        getSessionDetailsUsecase: sl(),
        joinSessionUsecase: sl(),
        getAssignedChildrenToProgramUsecase: sl(),
      ),
    );
  }
}
