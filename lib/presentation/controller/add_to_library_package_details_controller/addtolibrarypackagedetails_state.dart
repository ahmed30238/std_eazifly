abstract class AddtolibrarypackagedetailsState {}

class AddtolibrarypackagedetailsInitial
    extends AddtolibrarypackagedetailsState {}

class InitTabBarControllerState extends AddtolibrarypackagedetailsState {}

class PickImageFromGallerySuccessState
    extends AddtolibrarypackagedetailsState {}

class TypeControllerIndexState extends AddtolibrarypackagedetailsState {}

class ChangePackageIndexState extends AddtolibrarypackagedetailsState {}

class GetPlanSubscriptionLoadingState extends AddtolibrarypackagedetailsState {}

class GetPlanSubscriptionSuccessState extends AddtolibrarypackagedetailsState {}

class GetPlanSubscriptionErrorState extends AddtolibrarypackagedetailsState {
  final String errorMessage;
  GetPlanSubscriptionErrorState({required this.errorMessage});
}

class GetLibraryPlansLoadingState extends AddtolibrarypackagedetailsState {}

class GetLibraryPlansSuccessState extends AddtolibrarypackagedetailsState {
  GetLibraryPlansSuccessState();
}

class GetLibraryPlansErrorState extends AddtolibrarypackagedetailsState {
  final String errorMessage;
  GetLibraryPlansErrorState({required this.errorMessage});
}

class LibraryOrderAndSubscriptionLoadingState
    extends AddtolibrarypackagedetailsState {}

class LibraryOrderAndSubscriptionSuccessState
    extends AddtolibrarypackagedetailsState {}

class LibraryOrderAndSubscriptionErrorState
    extends AddtolibrarypackagedetailsState {
  final String errorMessage;
  LibraryOrderAndSubscriptionErrorState({required this.errorMessage});
}

class GetProgramPaymentMethodDetailsSuccessState
    extends AddtolibrarypackagedetailsState {}

class GetProgramPaymentMethodDetailsErrorState
    extends AddtolibrarypackagedetailsState {
  final String errorMessage;

  GetProgramPaymentMethodDetailsErrorState({required this.errorMessage});
}

class GetProgramPaymentMethodDetailsLoadingState
    extends AddtolibrarypackagedetailsState {}

class ChangePlanIdState extends AddtolibrarypackagedetailsState {}
