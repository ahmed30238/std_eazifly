abstract class ApplanuageState {}

class ApplanuageInitial extends ApplanuageState {}
class AppLanguageCurrentState extends ApplanuageState {
  final String locale;

  AppLanguageCurrentState({required this.locale});  
}
