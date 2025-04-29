import 'package:eazifly_student/presentation/controller/add_to_library_package_details_controller/addtolibrarypackagedetails_state.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart'
    hide TypeControllerIndexState
    hide InitTabBarControllerState;

class AddtolibrarypackagedetailsCubit
    extends Cubit<AddtolibrarypackagedetailsState> {
  AddtolibrarypackagedetailsCubit()
      : super(AddtolibrarypackagedetailsInitial());
  static AddtolibrarypackagedetailsCubit get(context) =>
      BlocProvider.of(context);

  late TabController controller;

  final List<String> subscriptionTypeTabs = [
    "شهري",
    'سنوي',
  ];

  void initTabBarControllers(TickerProvider vsync) {
    controller =
        TabController(length: subscriptionTypeTabs.length, vsync: vsync)
          ..addListener(
            () {
              if (controller.indexIsChanging) {
                controller.animateTo(
                  controller.index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
                emit(TypeControllerIndexState());
              }
            },
          );

    emit(InitTabBarControllerState());
  }

  int packageIndex = 0 ;
  changePackageIndex(int index) {
    packageIndex = index;
    emit(ChangePackageIndexState());
  }
}
