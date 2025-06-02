import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/domain/entities/get_all_library_lists_entity.dart';
import 'package:eazifly_student/domain/entities/get_library_category_entity.dart';
import 'package:eazifly_student/domain/use_cases/get_all_library_lists_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_library_categories_usecase.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_state.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/audios_body.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/favourite_body.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/menu_list_body.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/visuals_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LibraryCubit extends Cubit<LibraryState> {
  LibraryCubit({
    required this.libraryCategoriesUsecase,
    required this.allLibraryListsUsecase,
  }) : super(LibraryInitial()) {
    getLibraryCategories(type: "voice");
    getAllLibraryLists();
  }
  static LibraryCubit get(context) => BlocProvider.of(context);
  initTabController(TickerProvider vsync) {
    tabController = TabController(length: 4, vsync: vsync)
      ..addListener(() {
        if (tabController.indexIsChanging) {
          tabController.animateTo(tabController.index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
        }
        emit(InitTabControllerState());
      });
  }

  late TabController tabController;

  List<String> tabTexts = [
    'صوتيات',
    'مرئيات',
    'القوائم',
    'المفضلة',
  ];
  List<Widget> libraryBodies = [
    const AudiosBody(),
    const VisualsBody(),
    const MenuListBody(),
    const FavouriteBody(),
  ];
  bool getLibraryCategoriesLoader = false;
  GetLibraryCategoriesEntity? libraryCategoriesEntity;
  GetLibraryCategoriesUsecase libraryCategoriesUsecase;

  Future<void> getLibraryCategories({String? type}) async {
    getLibraryCategoriesLoader = true;
    emit(LibraryCategoriesLoadingState());

    final result = await libraryCategoriesUsecase.call(
      parameter: GetLibraryCategoriesParameters(
        type: type,
      ),
    );

    result.fold(
      (failure) {
        getLibraryCategoriesLoader = false;
        emit(LibraryCategoriesErrorState(errorMessage: failure.message));
      },
      (success) {
        libraryCategoriesEntity = success;
        getLibraryCategoriesLoader = false;
        emit(LibraryCategoriesSuccessState());
      },
    );
  }

  bool getAllLibraryListsLoader = false;
  GetAllLibraryListsEntity? allLibraryListsEntity;
  GetAllLibraryListsUsecase allLibraryListsUsecase;

  Future<void> getAllLibraryLists() async {
    getAllLibraryListsLoader = true;
    emit(AllLibraryListsLoadingState());

    final result = await allLibraryListsUsecase.call(parameter: NoParameter());

    result.fold(
      (failure) {
        getAllLibraryListsLoader = false;
        emit(AllLibraryListsErrorState(errorMessage: failure.message));
      },
      (success) {
        allLibraryListsEntity = success;
        getAllLibraryListsLoader = false;
        emit(AllLibraryListsSuccessState());
      },
    );
  }
}
