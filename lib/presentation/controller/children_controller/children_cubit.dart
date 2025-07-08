import 'package:eazifly_student/domain/entities/children_entities/get_my_children_entity.dart';
import 'package:eazifly_student/domain/use_cases/get_children_usecase.dart';
import 'package:eazifly_student/presentation/controller/children_controller/children_state.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ChildrenCubit extends Cubit<ChildrenState> {
  ChildrenCubit({
    required this.getChildrenUsecase,
    // required this.createNewChildUsecase,
  }) : super(ChildrenInitial());

  List<bool> chosen = [];

  bool getMyChildrenLoader = false;
  GetMyChildrenEntity? getMyChildrenEntity;
  GetChildrenUsecase getChildrenUsecase;
  Future<void> getMyChildren() async {
    getMyChildrenLoader = true;
    emit(GetMyChildernLoadingState());
    final result = await getChildrenUsecase.call(
      parameter: GetMyChildernParameters(childernsStatus: true),
    );
    result.fold(
      (l) {
        getMyChildrenLoader = false;
        emit(GetMyChildernErrorState(errorMessage: l.message));
      },
      (r) {
        getMyChildrenLoader = false;
        getMyChildrenEntity = r;
        initIsChosen();
        emit(GetMyChildernSuccessState());
      },
    );
  }

  void initIsChosen() {
    if (getMyChildrenEntity?.data != null) {
      chosen = List.filled(getMyChildrenEntity!.data!.length, false);
    }
  }

  void changeChosen(int index) {
    if (index >= 0 && index < chosen.length) {
      chosen[index] = !chosen[index];
      emit(ChangeChosenState());
    }
  }
}
