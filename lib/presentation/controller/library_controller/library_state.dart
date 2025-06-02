abstract class LibraryState {}

class LibraryInitial extends LibraryState {}

class InitTabControllerState extends LibraryState {}

class LibraryCategoriesSuccessState extends LibraryState {}

class LibraryCategoriesLoadingState extends LibraryState {}

class LibraryCategoriesErrorState extends LibraryState {
  final String errorMessage;

  LibraryCategoriesErrorState({required this.errorMessage});
}

class AllLibraryListsSuccessState extends LibraryState {}

class AllLibraryListsLoadingState extends LibraryState {}

class AllLibraryListsErrorState extends LibraryState {
  final String errorMessage;

  AllLibraryListsErrorState({required this.errorMessage});
}
