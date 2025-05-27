import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/domain/entities/get_programs_entities.dart';
import 'package:eazifly_student/domain/use_cases/get_programs_usecase.dart';
import 'package:eazifly_student/presentation/controller/programs_controller/programs_state.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ProgramsCubit extends Cubit<ProgramsState> {
  ProgramsCubit({
    required this.getProgramsUsecase,
  }) : super(ProgramsInitial());
  static ProgramsCubit get(context) => BlocProvider.of(context);

  bool getProgramsLoading = false;
  GetProgramsEntity? getProgramsEntity;
  GetProgramsUsecase getProgramsUsecase;
  getPrograms() async {
    getProgramsLoading = true;
    emit(GetProgramsLoadingState());
    final result = await getProgramsUsecase.call(parameter: NoParameter());
    result.fold(
      (l) {
        getProgramsLoading = false;
        emit(GetProgramsErrorState(errorMessage: l.message));
      },
      (r) {
        getProgramsLoading = false;
        getProgramsEntity = r;
        emit(GetProgramsSuccessState());
      },
    );
  }


}
