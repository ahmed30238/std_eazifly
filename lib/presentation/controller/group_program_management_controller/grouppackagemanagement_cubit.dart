import 'package:eazifly_student/core/service_locator/service_locator.dart';
import 'package:eazifly_student/domain/entities/children_entities/get_my_children_entity.dart';
import 'package:eazifly_student/domain/use_cases/get_children_usecase.dart';
import 'package:eazifly_student/presentation/controller/add_new_student_data_to_program_controller/add_new_student_data_to_program_cubit.dart';
import 'package:eazifly_student/presentation/controller/layout/layout_cubit.dart';
import 'package:eazifly_student/presentation/controller/set_appointment_controller/setappointments_cubit.dart';
import 'package:eazifly_student/presentation/view/group_package_management_view/widgets/chosen_lecturer.dart';
import 'package:eazifly_student/presentation/view/group_package_management_view/widgets/chosen_student_body.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

part 'grouppackagemanagement_state.dart';

class GrouppackagemanagementCubit extends Cubit<GrouppackagemanagementState> {
  GrouppackagemanagementCubit({
    required this.getChildrenUsecase,
  }) : super(GrouppackagemanagementInitial());

  static GrouppackagemanagementCubit get(context) => BlocProvider.of(context);

  int stepperIndex = 1;
  void incrementStepperIndex(BuildContext context) {
    if (stepperIndex < bodies.length - 1) {
      stepperIndex++;
    } else {
      LayoutCubit.get(context).changeIndex(1);
      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutePaths.layoutPath,
        (route) => false,
      );
    }
    emit(ChangeStepperIndexState());
  }

  void decrementStepperIndex(BuildContext context) {
    if (stepperIndex > 1) {
      stepperIndex--;
    } else {
      Navigator.pop(context);
    }
    emit(ChangeStepperIndexState());
  }

  List<Widget> bodies = [
    const SizedBox(),
    BlocProvider(
      create: (context) => AddNewStudentDataToProgramCubit(
        createNewChildUsecase: sl(),
      ),
      child: const ChosenStudentBody(),
    ),
    BlocProvider(
      create: (context) => SetappointmentsCubit(),
      child: const ChosenLecturer(),
    ),
  ];

  bool addMyself = false;
  toggleMyself() {
    addMyself = !addMyself;
    emit(ToggleAddMySelfState());
  }

  bool getMyChildrenLoader = false;
  GetMyChildrenEntity? getMyChildrenEntity;
  GetChildrenUsecase getChildrenUsecase;

  List<bool> chosen = [];

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
