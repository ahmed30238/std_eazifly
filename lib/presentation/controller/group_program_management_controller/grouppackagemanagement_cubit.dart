import 'package:eazifly_student/presentation/controller/layout/layout_cubit.dart';
import 'package:eazifly_student/presentation/view/group_package_management_view/widgets/chosen_lecturer.dart';
import 'package:eazifly_student/presentation/view/group_package_management_view/widgets/chosen_student_body.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

part 'grouppackagemanagement_state.dart';

class GrouppackagemanagementCubit extends Cubit<GrouppackagemanagementState> {
  GrouppackagemanagementCubit() : super(GrouppackagemanagementInitial());

  static GrouppackagemanagementCubit get(context) => BlocProvider.of(context);

  List<bool> chosen = [];
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
    const ChosenStudentBody(),
    const ChosenLecturer(),
  ];
  changeChosen(int index) {
    chosen[index] = !chosen[index];
    emit(ChangeChosenState());
  }
}
