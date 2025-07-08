import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/service_locator/service_locator.dart';
import 'package:eazifly_student/presentation/controller/home_controller/home_cubit.dart';
import 'package:eazifly_student/presentation/controller/layout/layout_state.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/controller/programs_controller/programs_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/home_page/home_page.dart';
import 'package:eazifly_student/presentation/view/layout/library/library.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/my_programs.dart';
import 'package:eazifly_student/presentation/view/layout/programs/programs_view.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);

  int index = 0;
  void changeIndex(int inx) {
    index = inx;
    emit(ChangeIndexState());
  }

  List<Widget> screens = [
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(
            getHomeClosestSessionsUsecase: sl(),
            getHomeCurrentSessionUsecase: sl(),
            getHomeLibraryUsecase: sl(),
          )
            ..getHomeLibrary()
            ..getHomeClosestSessions(),
        ),
        // BlocProvider(
        //   create: (context) => MyProgramsCubit(
        //     changeSessionStatusUsecase: sl(),
        //     getAssignedChildrenToProgramUsecase: sl(),
        //     getMyProgramsUsecase: sl(),
        //     getSessionDetailsUsecase: sl(),
        //     joinSessionUsecase: sl(),
        //   ),
        // ),
      ],
      child: const HomePage(),
    ),
    BlocProvider(
      create: (context) => ProgramsCubit(
        getProgramsUsecase: sl(),
      ),
      child: const ProgramsView(),
    ),
    BlocProvider(
      create: (context) => sl<MyProgramsCubit>(),
      child: const MyProgramsView(),
    ),
    BlocProvider(
      create: (context) => LibraryCubit(
        libraryCategoriesUsecase: sl(),
        allLibraryListsUsecase: sl(),
        storeFavouriteListUsecase: sl(),
        getFavouriteListUsecase: sl(),
        getFavouriteListItemUsingListIdUsecase: sl(),
        getAllItemsUsecase: sl(),
        addSingleItemToFavListUsecase: sl(),
        getListItemsUsingListIdUsecase: sl(),
        likeItemUsecase: sl(),
        getLibraryItemsUsecase: sl(),
      ),
      child: const LibraryView(),
    ),
    const MyAccountView()
  ];

  List<BottomNavBarItemModel> bottomNavigationBarItemMethod(
      BuildContext context,
      {required bool isActive}) {
    var lang = context.loc!;
    List<BottomNavBarItemModel> bottomNavigationBarItem = [
      BottomNavBarItemModel(
        icon: isActive
            ? Assets.bottom_nav_bar_iconsActiveMain
            : Assets.bottom_nav_bar_iconsInactiveMain,
        label: lang.main,
      ),
      BottomNavBarItemModel(
        icon: isActive
            ? Assets.bottom_nav_bar_iconsActivePrograms
            : Assets.bottom_nav_bar_iconsInactivePrograms,
        label: lang.thePrograms,
      ),
      BottomNavBarItemModel(
        icon: isActive
            ? Assets.bottom_nav_bar_iconsActiveMyPrograms
            : Assets.bottom_nav_bar_iconsInactiveMyPrograms,
        label: lang.myPrograms,
      ),
      BottomNavBarItemModel(
        icon: isActive
            ? Assets.bottom_nav_bar_iconsActiveLibrary
            : Assets.bottom_nav_bar_iconsInactiveLibrary,
        label: lang.library,
      ),
      BottomNavBarItemModel(
        icon: isActive
            ? Assets.bottom_nav_bar_iconsActiveProfile
            : Assets.bottom_nav_bar_iconsInactiveProfile,
        label: lang.myAccount,
      ),
    ];
    return bottomNavigationBarItem;
  }

  @override
  Future<void> close() {
    index = 0;
    return super.close();
  }
}

class BottomNavBarItemModel {
  final String icon;
  final String label;

  BottomNavBarItemModel({
    required this.icon,
    required this.label,
  });
}
