// إضافة هذه الـ States للـ ProgramsUnderReviewState

abstract class ProgramsUnderReviewState {}

class ProgramsUnderReviewInitial extends ProgramsUnderReviewState {}

class GetUserOrdersLoadingState extends ProgramsUnderReviewState {}

class GetUserOrdersSuccessState extends ProgramsUnderReviewState {}

class GetUserOrdersErrorState extends ProgramsUnderReviewState {
  final String errorMessage;
  GetUserOrdersErrorState({required this.errorMessage});
}

class OrderSelectedState extends ProgramsUnderReviewState {}

// الـ States الجديدة للرسائل المحلية
class MessageAddedLocallyState extends ProgramsUnderReviewState {}

class MessageUpdatedFromServerState extends ProgramsUnderReviewState {}

class MessageRemovedOnErrorState extends ProgramsUnderReviewState {}

class AddNoteLoadingState extends ProgramsUnderReviewState {}

class AddNoteSuccessState extends ProgramsUnderReviewState {}

class AddNoteErrorState extends ProgramsUnderReviewState {
  final String errorMessage;
  AddNoteErrorState({required this.errorMessage});
}