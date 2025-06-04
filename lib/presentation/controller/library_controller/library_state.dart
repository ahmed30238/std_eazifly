abstract class LibraryState {}

class LibraryInitial extends LibraryState {}

class PickImageFromGallerySuccessState extends LibraryState {}

class ClearImagesState extends LibraryState {}

class InitTabControllerState extends LibraryState {}

class GetGalleryImagesState extends LibraryState {}

class ToggleAddingRemovingState extends LibraryState {}

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

class StoreFavouriteListLoadingState extends LibraryState {}

class StoreFavouriteListSuccessState extends LibraryState {}

class StoreFavouriteListErrorState extends LibraryState {
  final String errorMessage;

  StoreFavouriteListErrorState({required this.errorMessage});
}

class FavouriteListLoadingState extends LibraryState {}

class FavouriteListSuccessState extends LibraryState {}

class FavouriteListErrorState extends LibraryState {
  final String errorMessage;

  FavouriteListErrorState({required this.errorMessage});
}

class FavouriteListItemsUsingListIdLoadingState extends LibraryState {}

class FavouriteListItemsUsingListIdSuccessState extends LibraryState {}

class FavouriteListItemsUsingListIdErrorState extends LibraryState {
  final String errorMessage;

  FavouriteListItemsUsingListIdErrorState({required this.errorMessage});
}

class GetAllItemsLoadingState extends LibraryState {}

class GetAllItemsSuccessState extends LibraryState {}

class GetAllItemsErrorState extends LibraryState {
  final String errorMessage;

  GetAllItemsErrorState({required this.errorMessage});
}
