part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

// States for getHomeCurrentSession
class GetHomeCurrentSessionLoadingState extends HomeState {}

class GetHomeCurrentSessionErrorState extends HomeState {
  final String errorMessage;
  GetHomeCurrentSessionErrorState({required this.errorMessage});
}

class GetHomeCurrentSessionSuccessState extends HomeState {}

// States for getHomeLibrary
class GetHomeLibraryLoadingState extends HomeState {}

class GetHomeLibraryErrorState extends HomeState {
  final String errorMessage;
  GetHomeLibraryErrorState({required this.errorMessage});
}

class GetHomeLibrarySuccessState extends HomeState {}

// States for getHomeClosestSessions
class GetHomeClosestSessionsLoadingState extends HomeState {}

class GetHomeClosestSessionsErrorState extends HomeState {
  final String errorMessage;
  GetHomeClosestSessionsErrorState({required this.errorMessage});
}

class GetHomeClosestSessionsSuccessState extends HomeState {}
