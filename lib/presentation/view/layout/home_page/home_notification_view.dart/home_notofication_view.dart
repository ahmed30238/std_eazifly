import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/presentation/controller/home_notification/home_notification_cubit.dart';
import 'package:eazifly_student/presentation/controller/home_notification/home_notification_state.dart';
import 'package:eazifly_student/presentation/view/layout/home_page/home_notification_view.dart/widgets.dart/home_notification_item.dart';
import 'package:eazifly_student/presentation/view/layout/home_page/home_notification_view.dart/widgets.dart/home_notification_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class HomeNotificationView extends StatefulWidget {
  const HomeNotificationView({super.key});

  @override
  State<HomeNotificationView> createState() => _HomeNotificationViewState();
}

class _HomeNotificationViewState extends State<HomeNotificationView> {
  @override
  void initState() {
    super.initState();
    HomeNotificationCubit.get(context).fetchNotifications(isInitial: true);
    HomeNotificationCubit.get(context).scrollControllerMethod();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = HomeNotificationCubit.get(context);
    var lang = context.loc!; // إضافة متغير الترجمة

    return Scaffold(
      appBar: CustomAppBar(
        context,
        isCenterTitle: true,
        mainTitle: lang.notifications, // استخدام النص من الترجمة
        leadingText: lang.back, // استخدام النص من الترجمة
        // onLeadinTap: () => back(context),
      ),
      body: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          if (cubit.getNotificationsLoader) {
            // Show full screen loader for initial load
            return const NotificationShimmerList();
          }

          if (state is NotificationError && cubit.notifications.isEmpty) {
            // Show error UI when there's an error and no notifications
            return ErrorWidget(
              // ignore: unnecessary_type_check
              'Unknown error',
              // onRetry: () => cubit.fetchNotifications(
              //   isInitial: true,
              // ),
            );
          }

          // Handle empty state
          if (cubit.notifications.isEmpty) {
            return _buildEmptyState(lang);
          }

          return ListView.builder(
            controller: cubit.scrollController,
            padding: EdgeInsets.only(top: 16.h),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              if (index >= cubit.notifications.length) {
                // Show loader at the bottom when loading more
                if (state is NotificationLoadingMore) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: const Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return const SizedBox.shrink(); // Hide when not loading
                }
              }

              final notificationItem = cubit.notifications[index];
              final createdAt = notificationItem.createdAt ?? DateTime.now();
              final formatted = formatDateTime(createdAt);
              return HomeNotificationItem(
                index: index,
                isRead: cubit.isRead[index],
                title: notificationItem.title ?? "",
                createdAt: formatted,
                message: notificationItem.message ?? "",
                onTap: () => cubit.readNotification(index, context),
              );
            },
            itemCount: cubit.notifications.length + (cubit.hasMore ? 1 : 0),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(var lang) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_off_outlined,
            size: 80.w,
            color: Colors.grey[400],
          ),
          SizedBox(height: 20.h),
          Text(
            lang.noNotifications, // استخدام النص من الترجمة
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            lang.noNotificationsFound, // استخدام النص من الترجمة
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30.h),
          ElevatedButton(
            onPressed: () {
              HomeNotificationCubit.get(context)
                  .fetchNotifications(isInitial: true);
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(
              lang.refresh, // استخدام النص من الترجمة
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
        ],
      ),
    );
  }
}

String formatDateTime(DateTime dateTime) {
  final dateFormat =
  DateFormat('yyyy/MM/dd hh:mm a'); // مثال: 2025/05/25 03:45 PM
  return dateFormat.format(dateTime);
}