abstract class CopounHistoryState {}

class CopounHistoryInitial extends CopounHistoryState {}

class CouponHistorySuccessState extends CopounHistoryState {}

class CouponHistoryErrorState extends CopounHistoryState {
  final String errorMessage;

  CouponHistoryErrorState({required this.errorMessage});
}

class CouponHistoryLoadingState extends CopounHistoryState {}
