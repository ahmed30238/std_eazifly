abstract class AddNewStudentDataToProgramState {}

class AddNewStudentDataToProgramInitial
    extends AddNewStudentDataToProgramState {}

class UpdateLinearIndicatorPercentState
    extends AddNewStudentDataToProgramState {}

class DecrementScreenIndexState extends AddNewStudentDataToProgramState {}

class IncrementScreenIndexState extends AddNewStudentDataToProgramState {}

class InitIalizeTabBarControllerState extends AddNewStudentDataToProgramState {}

class ChangeTapBarIndexState extends AddNewStudentDataToProgramState {}

class ChangeLecturerIndexState extends AddNewStudentDataToProgramState {}

class ChangeGenderState extends AddNewStudentDataToProgramState {}

class PickImageFromGallerySuccessState
    extends AddNewStudentDataToProgramState {}

class CreateNewChildErrorState extends AddNewStudentDataToProgramState {
  final String errorMessage;

  CreateNewChildErrorState({required this.errorMessage});
}

class CreateNewChildLoadingState extends AddNewStudentDataToProgramState {}

class CreateNewChildSuccessState extends AddNewStudentDataToProgramState {}
