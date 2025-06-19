import 'package:eazifly_student/presentation/controller/goal_details_controller/goal_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoalDetailsCubit extends Cubit<GoalDetailsState> {
  GoalDetailsCubit() : super(GoalDetailsInitial());
  static GoalDetailsCubit get(context) => BlocProvider.of(context);


}
