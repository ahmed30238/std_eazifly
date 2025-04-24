import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/presentation/controller/account_data/accountdata_cubit.dart';
import 'package:eazifly_student/presentation/controller/chats/chats_cubit.dart';
import 'package:eazifly_student/presentation/controller/goal_details_controller/goal_details_cubit.dart';
import 'package:eazifly_student/presentation/controller/meetings_controller/meeting_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_account_controllers/notifications_controller/notification_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_account_controllers/subscriptionmanagement_cubit.dart';
import 'package:eazifly_student/presentation/controller/set_appointment_controller/setappointments_cubit.dart';
import 'package:eazifly_student/presentation/controller/subscription_details_controller/subscriptiondetails_cubit.dart';
import 'package:eazifly_student/presentation/view/account_data/account_data_view.dart';
import 'package:eazifly_student/presentation/view/chat/chats_view.dart';
import 'package:eazifly_student/presentation/view/chat/messages_screen/dm_view.dart';
import 'package:eazifly_student/presentation/view/goals_view/goal_details_view/goal_details_view.dart';
import 'package:eazifly_student/presentation/view/goals_view/goals_view.dart';
import 'package:eazifly_student/presentation/view/home_meetings_view/home_meetings_view.dart';
import 'package:eazifly_student/presentation/view/layout/home_page/home_notification_view.dart/home_notofication_view.dart';
import 'package:eazifly_student/presentation/view/layout/layout.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/session_details_view/session_details_view.dart';
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
          const ReportsAndComplaintsView(),
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
      case RoutePaths.goalsScreen:
        return createRoute(
          const GoalsView(),
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
      case RoutePaths.homeNotification:
        return createRoute(
          const HomeNotificationView(),
        );
      case RoutePaths.dmViewPath:
        var cubit = settings.arguments as ChatsCubit;
        return createRoute(
          BlocProvider.value(
            value: cubit,
            child: const DmView(),
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
