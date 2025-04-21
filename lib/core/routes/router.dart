import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/presentation/controller/account_data/accountdata_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_account_controllers/notifications_controller/notification_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_account_controllers/subscriptionmanagement_cubit.dart';
import 'package:eazifly_student/presentation/view/account_data/account_data_view.dart';
import 'package:eazifly_student/presentation/view/layout/layout.dart';
import 'package:eazifly_student/presentation/view/my_account/about_app_view/about_app_view.dart';
import 'package:eazifly_student/presentation/view/my_account/copouns_and_discounts_view/copouns_and_discounts_view.dart';
import 'package:eazifly_student/presentation/view/my_account/notifications_view/notification_view.dart';
import 'package:eazifly_student/presentation/view/my_account/privacy_policy_and_usage_view/privacy_policy_and_usage_view.dart';
import 'package:eazifly_student/presentation/view/my_account/reports_and_complaints_view/reports_and_complaints_view.dart';
import 'package:eazifly_student/presentation/view/my_account/student_management_view/student_management.dart';
import 'package:eazifly_student/presentation/view/my_account/subscriptions_management_view/subscription_management_view.dart';
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
