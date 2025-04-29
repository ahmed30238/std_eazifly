import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/presentation/controller/account_data/accountdata_cubit.dart';
import 'package:eazifly_student/presentation/controller/add_new_student_data_to_program_controller/add_new_student_data_to_program_cubit.dart';
import 'package:eazifly_student/presentation/controller/add_to_library_package_details_controller/addtolibrarypackagedetails_cubit.dart';
import 'package:eazifly_student/presentation/controller/chats/chats_cubit.dart';
import 'package:eazifly_student/presentation/controller/goal_details_controller/goal_details_cubit.dart';
import 'package:eazifly_student/presentation/controller/group_program_management_controller/grouppackagemanagement_cubit.dart';
import 'package:eazifly_student/presentation/controller/home_program_details_controller/programdetails_cubit.dart';
import 'package:eazifly_student/presentation/controller/meetings_controller/meeting_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_account_controllers/notifications_controller/notification_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_account_controllers/subscriptionmanagement_cubit.dart';
import 'package:eazifly_student/presentation/controller/program_subscription_plan/programsubscriptionplan_cubit.dart';
import 'package:eazifly_student/presentation/controller/set_appointment_controller/setappointments_cubit.dart';
import 'package:eazifly_student/presentation/controller/subscription_details_controller/subscriptiondetails_cubit.dart';
import 'package:eazifly_student/presentation/view/account_data/account_data_view.dart';
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
import 'package:eazifly_student/presentation/view/layout/my_account/copouns_and_discounts_view/explain_point_view/explain_point_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/add_new_student_data_view/add_new_student_data_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/lecture_history_view/lectureHistoryView.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/lecture_history_view/lecture_report_view/lecture_report_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/complete_payment_process_view/complete_payment_process_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/confirm_payment_view/confirm_payment_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/subscription_package_details/subscription_package_details.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/session_details_view/session_details_view.dart';
import 'package:eazifly_student/presentation/view/layout/programs/program_details_view/program_details_view.dart';
import 'package:eazifly_student/presentation/view/layout/programs/program_subscription_plan_view/program_subscription_plan_view.dart';
import 'package:eazifly_student/presentation/view/leaderboard_view/leaderboard_view.dart';
import 'package:eazifly_student/presentation/view/lecture/joined_lecture_screen/joined_lecture_screen.dart';
import 'package:eazifly_student/presentation/view/lecture/lecture_details_view/lecture_details_view.dart';
import 'package:eazifly_student/presentation/view/lecture/lecture_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/about_app_view/about_app_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/copouns_and_discounts_view/copouns_and_discounts_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/notifications_view/notification_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/privacy_policy_and_usage_view/privacy_policy_and_usage_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/reports_and_complaints_view/reports_and_complaints_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/student_management.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/subscription_management_view.dart';
import 'package:eazifly_student/presentation/view/meeting_data_view/meeting_data_view.dart';
import 'package:eazifly_student/presentation/view/package_details_view/package_details_view.dart';
import 'package:eazifly_student/presentation/view/programs_underreview/programs_under_review_view.dart';
import 'package:eazifly_student/presentation/view/set_appointments_view/set_appointments_view.dart';
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
      case RoutePaths.accountDataPath:
        return createRoute(
          BlocProvider(
            create: (context) => AccountdataCubit(),
            child: const AccountData(),
          ),
        );
      case RoutePaths.studentManagement:
        return createRoute(
          const StudentManagementView(),
        );
      case RoutePaths.aboutAppPath:
        return createRoute(
          const AboutAppView(),
        );
      case RoutePaths.subscriptionManagmentPath:
        return createRoute(
          BlocProvider(
            create: (context) => SubscriptionmanagementCubit(),
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
            create: (context) => ChatsCubit(),
            child: const ReportsAndComplaintsView(),
          ),
        );
      case RoutePaths.privacyPolicyAndUsage:
        return createRoute(
          const PrivacyPolicyAndUsageView(),
        );

      case RoutePaths.chatsViewPath:
        return createRoute(
          BlocProvider(
            create: (context) => ChatsCubit(),
            child: const ChatsView(),
          ),
        );
      case RoutePaths.lectureView:
        bool isFinishedLecture = settings.arguments as bool;
        return createRoute(
          LectureView(
            isFinishedLecture: isFinishedLecture,
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
        return createRoute(
          const LectureReportView(),
        );
      case RoutePaths.leaderBoardView:
        return createRoute(
          const LeaderBoardView(),
        );
      case RoutePaths.goalDetailsView:
        return createRoute(
          BlocProvider(
            create: (context) => GoalDetailsCubit(),
            child: const GoalDetailsView(),
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
      case RoutePaths.setAppointmentsView:
        return createRoute(
          BlocProvider(
            create: (context) => SetappointmentsCubit(),
            child: const SetAppointmentsView(),
          ),
        );
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
        return createRoute(
          BlocProvider(
            create: (context) => ProgramsubscriptionplanCubit(),
            child: const ProgramSubscriptionPlanView(),
          ),
        );
      case RoutePaths.programDetailsView:
        return createRoute(
          BlocProvider(
            create: (context) => ProgramDetailsCubit(),
            child: const ProgramDetailsView(),
          ),
        );
      case RoutePaths.groupPackageManagement:
        return createRoute(
          BlocProvider(
            create: (context) => GrouppackagemanagementCubit(),
            child: const GroupPackageManagementView(),
          ),
        );
      case RoutePaths.homeNotification:
        return createRoute(
          const HomeNotificationView(),
        );
      case RoutePaths.confirmPaymentView:
        return createRoute(
          const ConfirmPaymentView(),
        );
      case RoutePaths.subscriptionPackageDetails:
        return createRoute(
          const SubscriptiopnPackageDetails(),
        );
      case RoutePaths.addToLibraryPackageDetailsView:
        return createRoute(
          BlocProvider(
            create: (context) => AddtolibrarypackagedetailsCubit(),
            child: const AddToLibraryPackageDetailsView(),
          ),
        );
      case RoutePaths.programsUnderReviewView:
        return createRoute(
          BlocProvider(
            create: (context) => ChatsCubit(),
            child: const ProgramsUnderReviewView(),
          ),
        );
      case RoutePaths.completePaymentProcessScreen:
        return createRoute(
          const CompletePaymentProcessView(),
        );
      case RoutePaths.navigateToLectureView:
        return createRoute(
          const NavigateToLectureView(),
        );
      case RoutePaths.addNewStudentData:
        return createRoute(
          BlocProvider(
            create: (context) => AddNewStudentDataToProgramCubit(),
            child: const AddNewStudentDataView(),
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
