import 'package:eazifly_student/presentation/controller/program_subscription_plan/programsubscriptionplan_state.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ProgramsubscriptionplanCubit extends Cubit<ProgramsubscriptionplanState> {
  ProgramsubscriptionplanCubit() : super(ProgramsubscriptionplanInitial());

  static ProgramsubscriptionplanCubit get(context) => BlocProvider.of(context);

  int planIndex = 0;
  void changePlanIndex(int index) {
    planIndex = index;
    emit(ChangePlanIndexState());
  }
  int lessonDurationIndex = 0;
  void changelessonDurationIndex(int index) {
    lessonDurationIndex = index;
    emit(ChangeLessonDurationIndexState());
  }
}
