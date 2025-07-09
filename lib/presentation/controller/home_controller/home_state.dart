part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

// Home Library States
class GetHomeLibraryLoadingState extends HomeState {}

class GetHomeLibrarySuccessState extends HomeState {}

class GetHomeLibraryErrorState extends HomeState {
  final String errorMessage;
  GetHomeLibraryErrorState({required this.errorMessage});
}

// Home Current Session States
class GetHomeCurrentSessionLoadingState extends HomeState {}

class GetHomeCurrentSessionSuccessState extends HomeState {}

class GetHomeCurrentSessionErrorState extends HomeState {
  final String errorMessage;
  GetHomeCurrentSessionErrorState({required this.errorMessage});
}

// Home Closest Sessions States
class GetHomeClosestSessionsLoadingState extends HomeState {}

class GetHomeClosestSessionsSuccessState extends HomeState {}

class GetHomeClosestSessionsErrorState extends HomeState {
  final String errorMessage;
  GetHomeClosestSessionsErrorState({required this.errorMessage});
}

// Combined States for multiple operations
class HomeDataLoadingState extends HomeState {}

class HomeDataSuccessState extends HomeState {}

class HomeDataErrorState extends HomeState {
  final String errorMessage;
  HomeDataErrorState({required this.errorMessage});
}

// Refresh State
class HomeRefreshingState extends HomeState {}