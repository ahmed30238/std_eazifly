import 'package:bloc/bloc.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

part 'grouppackagemanagement_state.dart';

class GrouppackagemanagementCubit extends Cubit<GrouppackagemanagementState> {
  GrouppackagemanagementCubit() : super(GrouppackagemanagementInitial());

  static GrouppackagemanagementCubit get(context) => BlocProvider.of(context);

  List<bool> chosen = [];

  changeChosen(int index) {
    chosen[index] = !chosen[index];
    emit(ChangeChosenState());
  }
}
