// import 'package:eazifly_student/presentation/controller/add_new_student_data_to_program_controller/add_new_student_data_to_program_state.dart';
// import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/add_new_student_data_view/widgets/registration_type_body.dart';
// import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/add_new_student_data_view/widgets/student_data_body.dart';
// import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/presentation/controller/add_new_student_data_to_program_controller/add_new_student_data_to_program_state.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/add_new_student_data_view/widgets/choose_teacher_body.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/add_new_student_data_view/widgets/proper_schedule_body.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/add_new_student_data_view/widgets/student_data_body.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

import '../../view/layout/my_account/student_management_view/add_new_student_data_view/widgets/registration_type_body.dart';

class AddNewStudentDataToProgramCubit
    extends Cubit<AddNewStudentDataToProgramState> {
  AddNewStudentDataToProgramCubit()
      : super(AddNewStudentDataToProgramInitial());
  static AddNewStudentDataToProgramCubit get(context) =>
      BlocProvider.of(context);
  double linearIndicatorPercent = .2; // between 0 and 1
  int screenIndex = 0;
  int selectedLecturerIndex = 0;
  changeLecturerIndex(int index) {
    selectedLecturerIndex = index;
    emit(ChangeLecturerIndexState());
  }

  late TabController controller;

  final List<String> tabs = [
    "مواعيد ثابتة",
    'مواعيد مرنة',
  ];

  void initTabBarController(TickerProvider vsync) {
    controller = TabController(length: tabs.length, vsync: vsync);
    controller.addListener(() {
      if (controller.indexIsChanging) {
        controller.animateTo(
          controller.index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
      emit(InitIalizeTabBarControllerState());
    });
  }

  int tapbarIndex = 0;

  void changeTapbarIndex(int index) {
    tapbarIndex = index;
    emit(ChangeTapBarIndexState());
  }

  decrementScreenIndex(BuildContext context) {
    if (screenIndex > 0) {
      linearIndicatorPercent -= .2;

      screenIndex--;
    } else {
      back(context);
    }
    emit(DecrementScreenIndexState());
  }

  incrementScreenIndex() {
    linearIndicatorPercent += .2;

    screenIndex++;
    emit(IncrementScreenIndexState());
  }

  List<Widget> bodies = [
    const RegistrationTypeBody(),
    const StudentDataBody(),
    const ProperScheduleBody(),
    const ChooseTeacherBody(),
  ];

  reset() {
    screenIndex = 0;
    controller.dispose();
    linearIndicatorPercent = .2;
  }

  @override
  Future<void> close() {
    reset();
    return super.close();
  }
}
