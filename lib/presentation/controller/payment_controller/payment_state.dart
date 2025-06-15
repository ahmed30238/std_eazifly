part of 'payment_cubit.dart';

abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class GetProgramPaymentMethodLoadingState extends PaymentState {}

class GetProgramPaymentMethodErrorState extends PaymentState {
  final String errorMessage;

  GetProgramPaymentMethodErrorState({required this.errorMessage});
}

class GetProgramPaymentMethodSuccessState extends PaymentState {}
