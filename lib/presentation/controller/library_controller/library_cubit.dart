import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/data/models/library/favourite_list/store_favourite_list_tojson.dart';
import 'package:eazifly_student/domain/entities/get_all_library_lists_entity.dart';
import 'package:eazifly_student/domain/entities/get_favourite_list_entity.dart';
import 'package:eazifly_student/domain/entities/get_favourite_list_items_using_list_id_entity.dart';
import 'package:eazifly_student/domain/entities/get_library_category_entity.dart';
import 'package:eazifly_student/domain/entities/store_favourite_list_entity.dart';
import 'package:eazifly_student/domain/use_cases/get_all_library_lists_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_favourite_list_item_using_list_id_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_favourite_list_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_library_categories_usecase.dart';
import 'package:eazifly_student/domain/use_cases/store_favourite_list_usecase.dart';
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
    required this.storeFavouriteListUsecase,
    required this.getFavouriteListUsecase,
    required this.getFavouriteListItemUsingListIdUsecase,
  }) : super(LibraryInitial());
  static LibraryCubit get(context) => BlocProvider.of(context);
  initTabController(TickerProvider vsync) {
    tabController = TabController(length: 4, vsync: vsync)
      ..addListener(() {
        if (tabController.indexIsChanging) {
          tabController.animateTo(tabController.index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
          switch (tabController.index) {
            case 0:
              getLibraryCategories(type: "voice");
              // storeFavouriteList();
              break;
            case 1:
              getLibraryCategories(type: "visuals");
              break;
            case 2:
              getAllLibraryLists();
            case 3:
              getFavouriteList();
              break;
            default:
          }
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

  List<File> images = [];
  Future<void> pickImages() async {
    final response = await pickMultiImageFromGallery();
    if (response != null) {
      images = List.from(response.map((e) => File(e.path)));
    }
    emit(GetGalleryImagesState());
  }

  bool storeFavouriteListLoader = false;
  StoreFavouriteListEntity? storeFavouriteListEntity;
  StoreFavouriteListUsecase storeFavouriteListUsecase;
  Future<void> storeFavouriteList() async {
    storeFavouriteListLoader = true;
    emit(StoreFavouriteListLoadingState());

    try {
      final File file = images.first;
      if (!await file.exists()) {
        return;
      }

      final multipartFile = await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
      );

      final result = await storeFavouriteListUsecase.call(
        parameter: StoreFavouriteDataParameters(
          data: StoreFavouriteListTojson(
            items: [1],
            title: favouriteListController.text,
            imageFile: multipartFile,
          ),
        ),
      );

      result.fold(
        (l) {
          storeFavouriteListLoader = false;
          emit(StoreFavouriteListErrorState(errorMessage: l.message));
        },
        (r) {
          storeFavouriteListLoader = false;
          storeFavouriteListEntity = r;
          emit(StoreFavouriteListSuccessState());
        },
      );
    } catch (e) {
      storeFavouriteListLoader = false;
      log("Error in store FavouriteList: $e");
      emit(StoreFavouriteListErrorState(errorMessage: e.toString()));
    }
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

  bool getFavouriteListLoader = false;
  GetFavouriteListEntity? getFavouriteListEntity;
  GetFavouriteListUsecase getFavouriteListUsecase;

  Future<void> getFavouriteList() async {
    getFavouriteListLoader = true;
    emit(FavouriteListLoadingState());

    final result = await getFavouriteListUsecase.call(parameter: NoParameter());

    result.fold(
      (l) {
        getFavouriteListLoader = false;
        emit(FavouriteListErrorState(errorMessage: l.message));
      },
      (r) {
        getFavouriteListEntity = r;
        getFavouriteListLoader = false;
        emit(FavouriteListSuccessState());
      },
    );
  }
// TODO
  bool getFavouriteListItemsLoader = false;
  GetFavouriteListItemsUsingListIdEntity?
      getFavouriteListItemsUsingListIdEntity;
  GetFavouriteListItemUsingListIdUsecase getFavouriteListItemUsingListIdUsecase;

  TextEditingController favouriteListController = TextEditingController();

  Future<void> getFavouriteListItemsUsingListId({required int listId}) async {
    getFavouriteListItemsLoader = true;
    emit(FavouriteListItemsUsingListIdSuccessState());

    final result = await getFavouriteListItemUsingListIdUsecase.call(
      parameter: GetFavouriteListItemUsingListIdParameters(
        listId: listId,
      ),
    );

    result.fold(
      (l) {
        getFavouriteListItemsLoader = false;
        emit(FavouriteListItemsUsingListIdErrorState(errorMessage: l.message));
      },
      (r) {
        getFavouriteListItemsUsingListIdEntity = r;
        getFavouriteListItemsLoader = false;
        emit(FavouriteListItemsUsingListIdSuccessState());
      },
    );
  }
}
