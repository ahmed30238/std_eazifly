abstract class UpdatechildprofileState {}

class UpdatechildprofileInitial extends UpdatechildprofileState {}

class PickImageFromGallerySuccessState extends UpdatechildprofileState {}

class UpdateProfileLoadingState extends UpdatechildprofileState {}

class UpdateProfileSuccessState extends UpdatechildprofileState {}

class UpdateProfileErrorState extends UpdatechildprofileState {
  final String errorMessage;

  UpdateProfileErrorState({required this.errorMessage});
}

// RemoveAssignedStudent States
class RemoveAssignedStudentLoadingState extends UpdatechildprofileState {}

class RemoveAssignedStudentSuccessState extends UpdatechildprofileState {
  final int programId;
  final int userId;
  RemoveAssignedStudentSuccessState(this.programId, this.userId);
}

class RemoveAssignedStudentErrorState extends UpdatechildprofileState {
  final String message;
  RemoveAssignedStudentErrorState(this.message);
}
