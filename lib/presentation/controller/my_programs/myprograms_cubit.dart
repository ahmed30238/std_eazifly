import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_my_programs_entity.dart';
import 'package:eazifly_student/domain/use_cases/get_my_programs_usecase.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_state.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class MyProgramsCubit extends Cubit<MyProgramsState> {
  MyProgramsCubit({
    required this.getMyProgramsUsecase,
  }) : super(MyprogramsInitial());
  bool getMyProgramsLoader = false;
  GetMyProgramsEntity? getMyProgramsEntity;
  GetMyProgramsUsecase getMyProgramsUsecase;
  Future<void> getMyPrograms() async {
    getMyProgramsLoader = true;
    emit(GetMyProgramsLoadingState());
    final result = await getMyProgramsUsecase.call(parameter: NoParameter());
    result.fold(
      (failure) {
        getMyProgramsLoader = false;
        emit(GetMyProgramsErrorState(failure.message));
      },
      (data) {
        getMyProgramsLoader = false;
        getMyProgramsEntity = data;
        emit(GetMyProgramsSuccessState());
      },
    );
  }
}
