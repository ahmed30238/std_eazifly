import 'package:eazifly_student/presentation/controller/corrected_quiz_controller/correctedquiz_state.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class CorrectedquizCubit extends Cubit<CorrectedquizState> {
  CorrectedquizCubit() : super(CorrectedquizInitial());
  static CorrectedquizCubit get(context) => BlocProvider.of(context);
}
