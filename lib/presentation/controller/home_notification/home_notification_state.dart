abstract class HomeNotificationState {}

class HomeNotificationInitial extends HomeNotificationState {}

class NotificationLoading extends HomeNotificationState {}

class NotificationSuccess extends HomeNotificationState {}

class NotificationError extends HomeNotificationState {}

class AllReadState extends HomeNotificationState {}

class NotificationInitial extends HomeNotificationState {}

class ReadNotificationLoadingState extends HomeNotificationState {}

class NotificationLoadingMore extends HomeNotificationState {}

class ReadNotificationSuccessState extends HomeNotificationState {}

class ReadNotificationErrorState extends HomeNotificationState {
  final String errorMessage;

  ReadNotificationErrorState({required this.errorMessage});
}
