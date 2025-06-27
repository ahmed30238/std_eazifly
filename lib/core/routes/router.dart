import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/core/service_locator/service_locator.dart';
import 'package:eazifly_student/presentation/controller/account_data/accountdata_cubit.dart';
import 'package:eazifly_student/presentation/controller/add_new_student_data_to_program_controller/add_new_student_data_to_program_cubit.dart';
import 'package:eazifly_student/presentation/controller/add_to_library_package_details_controller/addtolibrarypackagedetails_cubit.dart';
import 'package:eazifly_student/presentation/controller/auth/login/login_cubit.dart';
import 'package:eazifly_student/presentation/controller/change_lecturer_controller/changelecturer_cubit.dart';
import 'package:eazifly_student/presentation/controller/chats/chats_cubit.dart';
import 'package:eazifly_student/presentation/controller/children_controller/children_cubit.dart';
import 'package:eazifly_student/presentation/controller/corrected_quiz_controller/correctedquiz_cubit.dart';
import 'package:eazifly_student/presentation/controller/goal_details_controller/goal_details_cubit.dart';
import 'package:eazifly_student/presentation/controller/group_program_management_controller/grouppackagemanagement_cubit.dart';
import 'package:eazifly_student/presentation/controller/home_program_details_controller/programdetails_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture_quiz_details_controller/lecturequiz_cubit.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_cubit.dart';
import 'package:eazifly_student/presentation/controller/meetings_controller/meeting_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_account_controllers/notifications_controller/notification_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_account_controllers/subscriptionmanagement_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/controller/payment_controller/payment_cubit.dart';
import 'package:eazifly_student/presentation/controller/program_subscription_plan/programsubscriptionplan_cubit.dart';
import 'package:eazifly_student/presentation/controller/programs_under_review/programs_under_review_cubit.dart';
import 'package:eazifly_student/presentation/controller/subscription_details_controller/subscriptiondetails_cubit.dart';
import 'package:eazifly_student/presentation/view/account_data/account_data_view.dart';
import 'package:eazifly_student/presentation/view/account_data/edit_profile_view/edit_profile_view.dart';
import 'package:eazifly_student/presentation/view/auth/login/login.dart';
import 'package:eazifly_student/presentation/view/chat/chats_view.dart';
import 'package:eazifly_student/presentation/view/chat/messages_screen/dm_view.dart';
import 'package:eazifly_student/presentation/view/goals_view/goal_details_view/goal_details_view.dart';
import 'package:eazifly_student/presentation/view/goals_view/goals_view.dart';
import 'package:eazifly_student/presentation/view/group_package_management_view/group_package_management_view.dart';
import 'package:eazifly_student/presentation/view/home_meetings_view/home_meetings_view.dart';
import 'package:eazifly_student/presentation/view/layout/home_page/home_notification_view.dart/home_notofication_view.dart';
import 'package:eazifly_student/presentation/view/layout/home_page/navigate_to_lecture_view/navigate_to_lecture_view.dart';
import 'package:eazifly_student/presentation/view/layout/layout.dart';
import 'package:eazifly_student/presentation/view/layout/library/add_to_library_package_details/add_to_library_package_details.dart';
import 'package:eazifly_student/presentation/view/layout/library/audio_playlist_view/audio_playlist_view.dart';
import 'package:eazifly_student/presentation/view/layout/library/fav_playlist_details/fav_playlist_details.dart';
import 'package:eazifly_student/presentation/view/layout/library/payment/complete_payment_process_view/complete_payment_process_view.dart';
import 'package:eazifly_student/presentation/view/layout/library/payment/library_confirm_payment_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/about_app_view/about_app_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/copouns_and_discounts_view/copouns_and_discounts_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/copouns_and_discounts_view/explain_point_view/explain_point_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/notifications_view/notification_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/privacy_policy_and_usage_view/privacy_policy_and_usage_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/reports_and_complaints_view/reports_and_complaints_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/add_new_student_data_view/add_new_student_data_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/lecture_history_view/lecture_history_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/lecture_history_view/lecture_report_view/lecture_report_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/student_management.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/complete_payment_process_view/complete_payment_process_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/confirm_payment_view/confirm_payment_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/general_complete_payment_process_view/general_complete_payment_process_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/general_confirm_payment_view%20copy/general_confirm_payment_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/subscription_management_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/subscription_package_details/subscription_package_details.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/change_lecturer_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/program_goals_view/program_goals_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/selection_of_educational_courses_view/selection_of_educational_courses_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/selection_program_item_details_view/selection_program_item_details_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/session_details_view/session_details_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/subscribed_students_settings_view/subscribed_students_settings_view.dart';
import 'package:eazifly_student/presentation/view/layout/programs/program_details_view/program_details_view.dart';
import 'package:eazifly_student/presentation/view/layout/programs/program_plan_filter/program_plan_filter.dart';
import 'package:eazifly_student/presentation/view/layout/programs/program_subscription_plan_view/program_subscription_plan_view.dart';
import 'package:eazifly_student/presentation/view/leaderboard_view/leaderboard_view.dart';
import 'package:eazifly_student/presentation/view/lecture/assignments_details_view/assignment_details_view.dart';
import 'package:eazifly_student/presentation/view/lecture/corrcected_assignment_details_view/corrcected_assignment_details_view.dart';
import 'package:eazifly_student/presentation/view/lecture/corrected_quiz_details_view/corrected_quiz_details_view.dart';
import 'package:eazifly_student/presentation/view/lecture/joined_lecture_screen/joined_lecture_screen.dart';
import 'package:eazifly_student/presentation/view/lecture/lecture_details_view/lecture_details_view.dart';
import 'package:eazifly_student/presentation/view/lecture/lecture_view.dart';
import 'package:eazifly_student/presentation/view/lecture/quiz_details_view/quiz_details_view.dart';
import 'package:eazifly_student/presentation/view/meeting_data_view/meeting_data_view.dart';
import 'package:eazifly_student/presentation/view/package_details_view/package_details_view.dart';
import 'package:eazifly_student/presentation/view/programs_underreview/programs_under_review_view.dart';
import 'package:eazifly_student/presentation/view/splash_screen/splash_view.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/subscription_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final navKey = GlobalKey<NavigatorState>();
final RouteObserver<PageRoute> navigatorObservers = RouteObserver<PageRoute>();

class AppRouter {
  static Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.layoutPath:
        return createRoute(
          const Layout(),
        );
      case RoutePaths.splashScreen:
        return createRoute(
          const SplashScreen(),
        );
      case RoutePaths.loginPath:
        return createRoute(
          BlocProvider(
            create: (context) => LoginCubit(
              loginUsecase: sl(),
            ),
            child: const Login(),
          ),
        );
      case RoutePaths.accountDataPath:
        return createRoute(
          BlocProvider(
            create: (context) => AccountdataCubit(),
            child: const AccountData(),
          ),
        );
      case RoutePaths.editProfile:
        var cubit = settings.arguments as AccountdataCubit;
        return createRoute(
          BlocProvider.value(
            value: cubit,
            child: const EditProfile(),
          ),
        );
      case RoutePaths.studentManagement:
        return createRoute(
          BlocProvider(
            create: (context) => ChildrenCubit(
              getChildrenUsecase: sl(),
              // createNewChildUsecase: sl(),
            ),
            child: const StudentManagementView(),
          ),
        );
      case RoutePaths.aboutAppPath:
        return createRoute(
          const AboutAppView(),
        );
      case RoutePaths.subscriptionManagmentPath:
        return createRoute(
          BlocProvider(
            create: (context) => SubscriptionmanagementCubit(
              getLibrarySubscriptionUsecase: sl(),
              getProgramSubscriptionUsecase: sl(),
              cancelSubscriptionUsecase: sl(),
              renewSubscriptionUsecase: sl(),
              showPlanUsecase: sl(),
              upgradeOrderUsecase: sl(),
              getPlanSubscriptionUsecase: sl(),
              getPlansUsecase: sl(),
              getPlansWithDetailsUsecase: sl(),
              filterPlansUsecase: sl(),
              checkCopounUsecase: sl(),
              createOrderUsecase: sl(),
              getPaymentMethodDetailsUsecase: sl(),
            ),
            child: const SubscriptionManagmentView(),
          ),
        );
      case RoutePaths.copounsAndDiscountsViewPath:
        return createRoute(
          const CopounsAndDiscountsView(),
        );
      case RoutePaths.reportsAndComplaintsViewPath:
        return createRoute(
          BlocProvider(
            create: (context) =>
                ChatsCubit(getMessagesUsecase: sl(), sendMessagesUsecase: sl()),
            child: const ReportsAndComplaintsView(),
          ),
        );
      case RoutePaths.privacyPolicyAndUsage:
        return createRoute(
          const PrivacyPolicyAndUsageView(),
        );

      case RoutePaths.chatsViewPath:
        return createRoute(
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ChatsCubit(
                  getMessagesUsecase: sl(),
                  sendMessagesUsecase: sl(),
                ),
              ),
            ],
            child: const ChatsView(),
          ),
        );
      case RoutePaths.lectureView:
        var arguments = settings.arguments as Map<String, dynamic>;
        // var nextSessionDate =  arguments["nextSessionDate"] as DateTime;
        var programId = arguments["programId"] as int;
        return createRoute(
          BlocProvider(
            create: (context) => MyProgramsCubit(
              changeSessionStatusUsecase: sl(),
              getAssignedChildrenToProgramUsecase: sl(),
              getMyProgramsUsecase: sl(),
              getSessionDetailsUsecase: sl(),
              joinSessionUsecase: sl(),
            ),
            child: LectureView(
              programId: programId,
            ),
          ),
        );
      case RoutePaths.lectureDetailsView:
        return createRoute(
          const LectureDetailsView(),
        );
      case RoutePaths.lectureHistoryView:
        return createRoute(
          const Lecturehistoryview(),
        );
      case RoutePaths.goalsScreen:
        return createRoute(
          const GoalsView(),
        );
      case RoutePaths.explainPointsSystemView:
        return createRoute(
          const ExplainPointsSystemView(),
        );
      case RoutePaths.lectureReportView:
        var index = settings.arguments as int? ?? -1;
        return createRoute(
          LectureReportView(
            index: index,
          ),
        );
      case RoutePaths.leaderBoardView:
        return createRoute(
          const LeaderBoardView(),
        );
      case RoutePaths.goalDetailsView:
        var arguments = settings.arguments as Map<String, dynamic>;
        int chapterId = arguments["chapterId"] as int? ?? -1;
        String chapterTitle =
            arguments["chapterTitle"] as String? ?? "no title";
        return createRoute(
          BlocProvider(
            create: (context) => GoalDetailsCubit(),
            child: GoalDetailsView(
              chapterId: chapterId,
              chapterTitle: chapterTitle,
            ),
          ),
        );
      case RoutePaths.meetingDataPath:
        return createRoute(
          const MeetingDataView(),
        );
      case RoutePaths.meetings:
        return createRoute(
          BlocProvider(
            create: (context) => MeetingCubit(),
            child: const HomeMeetingsView(),
          ),
        );
      case RoutePaths.joinedLectureScreen:
        return createRoute(
          const JoinedLectureScreen(),
        );
      case RoutePaths.sessionDetailsView:
        return createRoute(
          const SessionDetailsView(),
        );
      case RoutePaths.selectionOfEducationalCoursesView:
        return createRoute(
          const SelectionOfEducationalCoursesView(),
        );
      case RoutePaths.selectionProgramItemDetailsView:
        return createRoute(
          const SelectionProgramItemDetailsView(),
        );
      case RoutePaths.programGoalsView:
        return createRoute(
          const ProgramGoalsView(),
        );
      case RoutePaths.assignmentDetailsView:
        var arguments = settings.arguments as Map<String, dynamic>;
        var cubit = arguments["cubit"] as LectureCubit;
        int assignmentId = arguments["assignmentId"] as int? ?? -1;
        String assignmentTitle =
            arguments["assignmentTitle"] as String? ?? " null title";
        return createRoute(
          BlocProvider.value(
            value: cubit,
            child: AssignmentDetailsView(
              assignmentId: assignmentId,
              assignmentTitle: assignmentTitle,
            ),
          ),
        );
      case RoutePaths.corrcectedAssignmentDetailsView:
        var arguments = settings.arguments as Map<String, dynamic>;
        int assignmentId = arguments["assignmentId"] as int? ?? -1;
        String assignmentTitle =
            arguments["assignmentTitle"] as String? ?? " null title";
        return createRoute(
          CorrcectedAssignmentDetailsView(
            assignmentId: assignmentId,
            assignmentTitle: assignmentTitle,
          ),
        );
      case RoutePaths.lectureQuizzDetailsView:
        var arguments = settings.arguments as Map<String, dynamic>;
        int programId = arguments["programId"] as int? ?? -1;
        int userId = arguments["userId"] as int? ?? -1;
        int quizId = arguments["quizId"] as int? ?? -1;
        String quizTitle = arguments["quizTitle"] as String? ?? "";
        return createRoute(
          BlocProvider(
            create: (context) => LecturequizCubit(
              getQuizQuestionsUsecase: sl(),
              submitQuizUsecase: sl(),
            ),
            child: LectureQuizDetailsView(
              programId: programId,
              quizId: quizId,
              userId: userId,
              quizTitle: quizTitle,
            ),
          ),
        );
      case RoutePaths.correctedQuizDetailsView:
        return createRoute(
          BlocProvider(
            create: (context) => CorrectedquizCubit(),
            child: const CorrectedQuizDetailsView(),
          ),
        );
      case RoutePaths.changeLecturerView:
        return createRoute(
          BlocProvider(
            create: (context) => ChangelecturerCubit(),
            child: const ChangeLecturerView(),
          ),
        );
      case RoutePaths.subscribedStudentsSettingsView:
        return createRoute(
          const SubscribedStudentsSettingsView(),
        );
      // case RoutePaths.setAppointmentsView:
      //   return createRoute(
      //     BlocProvider(
      //       create: (context) => SetappointmentsCubit(),
      //       child: const SetAppointmentsView(),
      //     ),
      //   );
      case RoutePaths.subscriptionDetailsView:
        return createRoute(
          BlocProvider(
            create: (context) => SubscriptiondetailsCubit(),
            child: const SubscriptionDetailsView(),
          ),
        );
      case RoutePaths.packageDetailsView:
        return createRoute(
          const PackageDetailsView(),
        );
      case RoutePaths.programSubscriptionPlan:
        var arguments = settings.arguments as Map<String, dynamic>?;
        int programId = arguments?["programId"] ?? "";
        String programTitle = arguments?["programTitle"] ?? "";
        String programDescription = arguments?["programDescription"] ?? "";
        String programImage = arguments?["programImage"] ?? "";

        return createRoute(
          BlocProvider(
            create: (context) => ProgramsubscriptionplanCubit(
              filterPlansUsecase: sl(),
              getPlansUsecase: sl(),
              createOrderUsecase: sl(),
              checkCopounUsecase: sl(),
              getPlanSubscriptionUsecase: sl(),
              getPlansWithDetailsUsecase: sl(),
              getPaymentMethodDetailsUsecase: sl(),
            ),
            child: Builder(
              builder: (context) {
                return ProgramSubscriptionPlanView(
                  cubit: context.read<ProgramsubscriptionplanCubit>(),
                  programId: programId,
                  programTitle: programTitle,
                  programDescription: programDescription,
                  programImage: programImage,
                );
              },
            ),
          ),
        );
      case RoutePaths.orderSubscriptionPlan:
        var arguments = settings.arguments as Map<String, dynamic>?;
        var cubit = arguments?["cubit"] as SubscriptionmanagementCubit;
        int programId = arguments?["programId"] ?? "";
        String programTitle = arguments?["programTitle"] ?? "";
        String programDescription = arguments?["programDescription"] ?? "";
        String programImage = arguments?["programImage"] ?? "";

        return createRoute(
          BlocProvider.value(
            value: cubit,
            child: Builder(
              builder: (context) {
                return ProgramSubscriptionPlanView(
                  isUpgrade: true,
                  cubit: cubit,
                  programId: programId,
                  programTitle: programTitle,
                  programDescription: programDescription,
                  programImage: programImage,
                );
              },
            ),
          ),
        );
      case RoutePaths.programDetailsView:
        // var argument = settings.arguments as Map<String, dynamic>?;
        int programId = settings.arguments as int;
        return createRoute(
          BlocProvider(
            create: (context) => ProgramDetailsCubit(
              getProgramDetailsUsecase: sl(),
            ),
            child: ProgramDetailsView(
              programId: programId,
            ),
          ),
        );
      case RoutePaths.groupPackageManagement:
        String orderId = settings.arguments as String? ?? "-1";
        return createRoute(
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => GrouppackagemanagementCubit(
                  getChildrenUsecase: sl(),
                  addWeeklyAppointmentsUsecase: sl(),
                  createMeetingSessionsUsecase: sl(),
                  getOrderDetailsUsecase: sl(),
                  getInstructorsUsecase: sl(),
                ),
              ),
              BlocProvider(
                create: (context) => ChildrenCubit(
                  getChildrenUsecase: sl(),
                ),
              ),
            ],
            child: GroupPackageManagementView(
              orderId: orderId,
            ),
          ),
        );
      case RoutePaths.homeNotification:
        return createRoute(
          const HomeNotificationView(),
        );
      case RoutePaths.favPlaylistDetails:
        var arguments = settings.arguments as Map<String, dynamic>?;
        int playlistId = arguments?["playlistId"] as int? ?? 0;
        String playlistName = arguments?["playlistName"] as String? ?? "";
        String playlistImage = arguments?["playlistImage"] as String? ?? "";
        LibraryCubit cubit = arguments?["cubit"] as LibraryCubit;
        return createRoute(
          BlocProvider.value(
            value: cubit,
            child: FavouritePlaylistDetails(
              playlistId: playlistId,
              playlistName: playlistName,
              playlistImage: playlistImage,
            ),
          ),
        );
      case RoutePaths.confirmPaymentView:
        var arguments = settings.arguments as Map<String, dynamic>?;
        int methodId = arguments?["methodId"] as int? ?? 0;
        var cubit = arguments?["cubit"] as ProgramsubscriptionplanCubit;
        return createRoute(
          MultiBlocProvider(
            providers: [
              BlocProvider.value(value: cubit),
            ],
            child: ConfirmPaymentView(
              methodId: methodId,
            ),
          ),
        );
      case RoutePaths.generalConfirmPaymentView:
        var arguments = settings.arguments as Map<String, dynamic>?;
        int methodId = arguments?["methodId"] as int? ?? 0;
        var cubit = arguments?["cubit"] as SubscriptionmanagementCubit;
        return createRoute(
          BlocProvider.value(
            value: cubit,
            child: GeneralConfirmPaymentView(
              isUpgrade: false,
              methodId: methodId,
            ),
          ),
        );
      case RoutePaths.generalConfirmUpgradePaymentView:
        var arguments = settings.arguments as Map<String, dynamic>?;
        int methodId = arguments?["methodId"] as int? ?? 0;
        var cubit = arguments?["cubit"] as SubscriptionmanagementCubit;
        return createRoute(
          BlocProvider.value(
            value: cubit,
            child: GeneralConfirmPaymentView(
              isUpgrade: true,
              methodId: methodId,
            ),
          ),
        );
      case RoutePaths.subscriptionPackageDetails:
        var arguments = settings.arguments as Map<String, dynamic>;
        var cubit = arguments["cubit"] as SubscriptionmanagementCubit;
        int mainId = arguments["mainId"] as int? ?? -1;
        int planId = arguments["planId"] as int? ?? -1;
        return createRoute(
          BlocProvider.value(
            value: cubit,
            child: SubscriptiopnPackageDetails(
              planId: planId,
              mainId: mainId,
            ),
          ),
        );
      case RoutePaths.audioPlayListView:
        var arguments = settings.arguments as Map<String, dynamic>;
        LibraryCubit cubit = arguments["cubit"] as LibraryCubit;
        int listId = arguments["listId"] as int? ?? -1;
        return createRoute(
          BlocProvider.value(
            value: cubit,
            child: AudioPlayListView(
              listId: listId,
            ),
          ),
        );
      case RoutePaths.addToLibraryPackageDetailsView:
        return createRoute(
          BlocProvider(
            create: (context) => AddtolibrarypackagedetailsCubit(
              getPaymentMethodDetailsUsecase: sl(),
              getPlanSubscriptionUsecase: sl(),
              getLibraryPlansUsecase: sl(),
              libraryOrderAndSubscriptionUsecase: sl(),
            ),
            child: const AddToLibraryPackageDetailsView(),
          ),
        );
      case RoutePaths.programPlanFilter:
        var programId = settings.arguments as int?;
        return createRoute(
          BlocProvider(
            create: (context) => ProgramsubscriptionplanCubit(
              filterPlansUsecase: sl(),
              getPlansUsecase: sl(),
              createOrderUsecase: sl(),
              checkCopounUsecase: sl(),
              getPlanSubscriptionUsecase: sl(),
              getPlansWithDetailsUsecase: sl(),
              getPaymentMethodDetailsUsecase: sl(),
            ),
            child: ProgramPlanFilter(
              programId: programId ?? -1,
            ),
          ),
        );
      case RoutePaths.programsUnderReviewView:
        return createRoute(
          BlocProvider(
            create: (context) => ProgramsUnderReviewCubit(
              getUserOrdersUsecase: sl(),
            ),
            child: const ProgramsUnderReviewView(),
          ),
        );
      case RoutePaths.libraryconfirmPaymentView:
        var arguments = settings.arguments as Map<String, dynamic>?;
        int methodId = arguments?["methodId"] as int? ?? 0;
        var cubit = arguments?["cubit"] as AddtolibrarypackagedetailsCubit;
        return createRoute(
          BlocProvider.value(
            value: cubit,
            // create: (context) => AddtolibrarypackagedetailsCubit(
            //   getLibraryPlansUsecase: sl(),
            //   getPlanSubscriptionUsecase: sl(),
            //   libraryOrderAndSubscriptionUsecase: sl(),
            //   getPaymentMethodDetailsUsecase: sl(),
            //   // methodId: methodId,
            //   // getUserOrdersUsecase: sl(),
            // ),
            child: ConfirmLibraryPaymentView(
              methodId: methodId,
            ),
          ),
        );
      case RoutePaths.completePaymentProcessScreen:
        var arguments = settings.arguments as Map<String, dynamic>?;
        var cubit = arguments?["cubit"] as ProgramsubscriptionplanCubit;
        int itemId = arguments?["itemId"] as int;
        return createRoute(
          MultiBlocProvider(
            providers: [
              BlocProvider.value(value: sl<PaymentCubit>()),
              BlocProvider.value(value: cubit),
            ],
            child: CompletePaymentProcessView(
              itemId: itemId,
            ),
          ),
        );
      case RoutePaths.generalCompletePaymentProcessScreen:
        var arguments = settings.arguments as Map<String, dynamic>?;
        var cubit = arguments?["cubit"] as SubscriptionmanagementCubit;
        int itemId = arguments?["itemId"] as int;
        return createRoute(
          MultiBlocProvider(
            providers: [
              BlocProvider.value(value: sl<PaymentCubit>()),
              BlocProvider.value(value: cubit),
            ],
            child: GeneralCompletePaymentProcessView(
              isUpgrade: false,
              itemId: itemId,
            ),
          ),
        );
      case RoutePaths.generalCompleteUpgradePaymentProcessScreen:
        var arguments = settings.arguments as Map<String, dynamic>?;
        var cubit = arguments?["cubit"] as SubscriptionmanagementCubit;
        int itemId = arguments?["itemId"] as int;
        return createRoute(
          MultiBlocProvider(
            providers: [
              BlocProvider.value(value: sl<PaymentCubit>()),
              BlocProvider.value(value: cubit),
            ],
            child: GeneralCompletePaymentProcessView(
              isUpgrade: true,
              itemId: itemId,
            ),
          ),
        );
      case RoutePaths.completeLibraryPaymentProcessScreen:
        var arguments = settings.arguments as Map<String, dynamic>;
        int itemId = arguments["itemId"] as int;
        var cubit = arguments["cubit"] as AddtolibrarypackagedetailsCubit;
        return createRoute(
          MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: sl<PaymentCubit>(),
              ),
              BlocProvider.value(
                value: cubit,
              ),
            ],
            child: CompleteLibraryPaymentProcessView(
              itemId: itemId,
            ),
          ),
        );
      case RoutePaths.navigateToLectureView:
        var arguments = settings.arguments as Map<String, dynamic>;
        int sessionId = arguments["sessionId"] as int;
        MyProgramsCubit cubit = arguments["cubit"] as MyProgramsCubit;
        return createRoute(
          BlocProvider.value(
            value: cubit,
            child: NavigateToLectureView(
              sessionId: sessionId,
            ),
          ),
        );
      case RoutePaths.addNewStudentData:
        // bool isToProgram = settings.arguments as bool? ?? false;
        return createRoute(
          BlocProvider(
            create: (context) => AddNewStudentDataToProgramCubit(
              createNewChildUsecase: sl(),
            ),
            child: const AddNewStudentDataView(
                // isToProgram: isToProgram,
                ),
          ),
        );
      case RoutePaths.dmViewPath:
        var argument = settings.arguments as Map<String, dynamic>?;
        var cubit = argument?["cubit"] as ChatsCubit;
        var isReport = argument?["isReport"] as bool;
        String? problemState = argument?["problemState"] as String;
        // var cubit = settings.arguments as ChatsCubit;
        return createRoute(
          BlocProvider.value(
            value: cubit,
            child: DmView(
              isReport: isReport,
              problemState: problemState,
            ),
          ),
        );
      case RoutePaths.notificationPath:
        return createRoute(
          BlocProvider(
            create: (context) => NotificationCubit(),
            child: const NotificationView(),
          ),
        );
      default:
        return createRoute(
          const Layout(),
        );
    }
  }
}

Route createRoute(Widget widget, {BuildContext? context}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
