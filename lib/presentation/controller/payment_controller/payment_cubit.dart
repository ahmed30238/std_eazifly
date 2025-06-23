import 'package:eazifly_student/domain/entities/get_program_payment_methods_entities.dart';
import 'package:eazifly_student/domain/use_cases/get_program_payment_methods_usecase.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit({
    required this.getProgramPaymentMethodsUsecase,
  }) : super(PaymentInitial());

  bool getProgramPaymentMethodLoader = false;
  GetProgramPaymentMethodsEntity? getProgramPaymentMethodsEntity;
  GetProgramPaymentMethodsUsecase getProgramPaymentMethodsUsecase;
  Future<void> getProgramPaymentMethod({required int programId}) async {
    getProgramPaymentMethodLoader = true;
    emit(GetProgramPaymentMethodLoadingState());
    final result = await getProgramPaymentMethodsUsecase.call(
      parameter: GetProgramPaymentMethodsParameters(
        programId: programId,
      ),
    );
    result.fold(
      (l) {
        getProgramPaymentMethodLoader = false;
        emit(GetProgramPaymentMethodErrorState(errorMessage: l.message));
      },
      (r) {
        getProgramPaymentMethodLoader = false;
        getProgramPaymentMethodsEntity = r;
        emit(GetProgramPaymentMethodSuccessState());
      },
    );
  }
}
