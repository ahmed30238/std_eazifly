import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/domain/entities/user/copoun_history_entity.dart';
import 'package:eazifly_student/domain/use_cases/copoun_history_usecase.dart';
import 'package:eazifly_student/presentation/controller/copoun_history/copounhistory_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CopounHistoryCubit extends Cubit<CopounHistoryState> {
  CopounHistoryCubit({required this.copounHistoryUsecase})
    : super(CopounHistoryInitial());

  CopounHistoryEntity? copounHistoryEntity;
  CopounHistoryUsecase copounHistoryUsecase;
  bool copounHistoryLoader = false;

  Future<void> getCopounHistory() async {
    copounHistoryLoader = true;
    emit(CouponHistoryLoadingState());

    final result = await copounHistoryUsecase.call(parameter: NoParameter());

    result.fold(
      (l) {
        copounHistoryLoader = false;
        emit(CouponHistoryErrorState(errorMessage: l.message));
      },
      (r) {
        copounHistoryLoader = false;
        copounHistoryEntity = r;
        emit(CouponHistorySuccessState());
      },
    );
  }
}
