import 'package:eazifly_student/data/data_source/remote_data_source.dart';
import 'package:eazifly_student/data/repo/repo.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/use_cases/add_note_usecase.dart';
import 'package:eazifly_student/domain/use_cases/add_single_item_to_fav_usecase.dart';
import 'package:eazifly_student/domain/use_cases/add_weekly_appointments_usecase.dart';
import 'package:eazifly_student/domain/use_cases/cancel_session_usecase.dart';
import 'package:eazifly_student/domain/use_cases/cancel_subscription_usecase.dart';
import 'package:eazifly_student/domain/use_cases/change_instructor_usecase.dart';
import 'package:eazifly_student/domain/use_cases/change_session_date_usecase.dart';
import 'package:eazifly_student/domain/use_cases/change_session_status_usecase.dart';
import 'package:eazifly_student/domain/use_cases/check_copoun_usecase.dart';
import 'package:eazifly_student/domain/use_cases/complete_chapter_lesson_usecase.dart';
import 'package:eazifly_student/domain/use_cases/create_meeting_assignment_usecase.dart';
import 'package:eazifly_student/domain/use_cases/create_new_child_usecase.dart';
import 'package:eazifly_student/domain/use_cases/create_order_usecase.dart';
import 'package:eazifly_student/domain/use_cases/filter_plans_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_all_items_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_all_library_lists_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_assigned_children_to_program_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_assignment_details_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_cancel_session_reasons_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_change_instructor_reasons.dart';
import 'package:eazifly_student/domain/use_cases/get_chapter_lessons_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_children_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_content_chapter_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_favourite_list_item_using_list_id_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_favourite_list_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_instructor_availabilities_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_instructors_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_library_categories_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_library_plans_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_library_subscription_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_list_items_using_list_id_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_messages_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_my_programs_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_order_details_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_payment_method_details_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_plan_subscription_period_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_plan_with_details_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_plans_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_program_assignments_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_program_content_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_program_details_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_program_payment_methods_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_program_sessions_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_program_subscriptions_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_programs_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_quiz_qustions_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_remaining_program_sessions_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_report_questions_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_session_details_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_user_feedback_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_user_orders_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_user_quizzes_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_user_reports_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_user_subscription_data_usecase.dart';
import 'package:eazifly_student/domain/use_cases/join_session_usecase.dart';
import 'package:eazifly_student/domain/use_cases/library_order_and_subscription_usecase.dart';
import 'package:eazifly_student/domain/use_cases/like_item_usecase.dart';
import 'package:eazifly_student/domain/use_cases/login_usecase.dart';
import 'package:eazifly_student/domain/use_cases/post_assignment_usecase.dart';
import 'package:eazifly_student/domain/use_cases/renew_subscription_usecase.dart';
import 'package:eazifly_student/domain/use_cases/send_messages_usecase.dart';
import 'package:eazifly_student/domain/use_cases/show_library_item_usecase.dart';
import 'package:eazifly_student/domain/use_cases/show_plan_usecase.dart';
import 'package:eazifly_student/domain/use_cases/show_program_details_usecase.dart';
import 'package:eazifly_student/domain/use_cases/store_favourite_list_usecase.dart';
import 'package:eazifly_student/domain/use_cases/submit_quiz_usecase.dart';
import 'package:eazifly_student/domain/use_cases/upgrade_order_usecase.dart';
import 'package:eazifly_student/presentation/controller/add_new_student_data_to_program_controller/add_new_student_data_to_program_cubit.dart';
import 'package:eazifly_student/presentation/controller/cancel_session_controller/cancelsession_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/controller/payment_controller/payment_cubit.dart';
import 'package:eazifly_student/presentation/controller/programs_under_review/programs_under_review_cubit.dart';
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
    sl.registerLazySingleton(
        () => GetQuizQuestionsUsecase(baseRepository: sl()));
    sl.registerLazySingleton(() => GetUserQuizzesUsecase(baseRepository: sl()));
    sl.registerLazySingleton(() => SubmitQuizUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => GetAssignmentDetailsUsecase(baseRepository: sl()));
    sl.registerLazySingleton(() => SendMessagesUsecase(baseRepository: sl()));
    sl.registerLazySingleton(() => GetMessagesUsecase(baseRepository: sl()));
    sl.registerLazySingleton(() => PostAssignmentUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => GetLibrarySubscriptionUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => GetProgramSubscriptionsUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => CancelSubscriptionUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => RenewSubscriptionUsecase(baseRepository: sl()));
    sl.registerLazySingleton(() => ShowPlanUsecase(baseRepository: sl()));
    sl.registerLazySingleton(() => UpgradeOrderUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => GetReportQuestionsUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => AddWeeklyAppointmentsUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => CreateMeetingSessionsUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => GetOrderDetailsUsecase(baseRepository: sl()));
    sl.registerLazySingleton(() => GetInstructorsUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => GetProgramContentUsecase(baseRepository: sl()));
    sl.registerLazySingleton(() => AddNoteUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => GetInstructorAvailabilitiesUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => GetCancelSessionReasonsUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => ChangeSessionDateUsecase(baseRepository: sl()));
    sl.registerLazySingleton(() => CancelSessionUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => GetUserSubscriptionDataUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => GetRemainingProgramSessionsUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => ChangeInstructorUsecase(baseRepository: sl()));
    sl.registerLazySingleton(
        () => GetChangeInstructorReasonsUsecase(baseRepository: sl()));

    // Registering the Factories
    sl.registerLazySingleton<PaymentCubit>(() => PaymentCubit(
          getProgramPaymentMethodsUsecase: sl(),
        ));
    sl.registerLazySingleton<AddNewStudentDataToProgramCubit>(
      () => AddNewStudentDataToProgramCubit(
        createNewChildUsecase: sl<CreateNewChildUsecase>(),
      ),
    );
    sl.registerLazySingleton<ProgramsUnderReviewCubit>(
      () => ProgramsUnderReviewCubit(
        getUserOrdersUsecase: sl(),
        // addNoteUsecase: sl(),
      ),
    );
    sl.registerFactory<MyProgramsCubit>(
      () => MyProgramsCubit(
        getMyProgramsUsecase: sl(),
        changeSessionStatusUsecase: sl(),
        getSessionDetailsUsecase: sl(),
        joinSessionUsecase: sl(),
        getAssignedChildrenToProgramUsecase: sl(),
      ),
    );
    sl.registerFactory<CancelSessionCubit>(
      () => CancelSessionCubit(
        cancelSessionUsecase: sl(),
        changeSessionDateUsecase: sl(),
        getCancelSessionReasonsUsecase: sl(),
        getInstructorAvailabilitiesUsecase: sl(),
      ),
    );
  }
}
