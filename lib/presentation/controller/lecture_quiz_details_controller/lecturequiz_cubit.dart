import 'package:eazifly_student/presentation/controller/lecture_quiz_details_controller/lecturequiz_state.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class LecturequizCubit extends Cubit<LecturequizState> {
  LecturequizCubit() : super(LecturequizInitial());
  static LecturequizCubit get(context) => BlocProvider.of(context);
  int trueFalseIndex = 0;
  void changeTrueFalse(int index) {
    trueFalseIndex = index;
    emit(ChangeTrueFalseIndexState());
  }
  int mulipleChoiceIndex = 0;
  void changeMulipleChoice(int index) {
    mulipleChoiceIndex = index;
    emit(ChangeMulipleChoiceIndexState());
  }
}
