import 'dart:developer';
import 'dart:io';

import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/data/models/library/favourite_list/add_single_item_to_fav_tojson.dart';
import 'package:eazifly_student/data/models/library/favourite_list/store_favourite_list_tojson.dart';
import 'package:eazifly_student/domain/entities/add_single_item_to_fav_list_entity.dart';
import 'package:eazifly_student/domain/entities/get_all_items_entity.dart';
import 'package:eazifly_student/domain/entities/get_all_library_lists_entity.dart';
import 'package:eazifly_student/domain/entities/get_favourite_list_entity.dart';
import 'package:eazifly_student/domain/entities/get_favourite_list_items_using_list_id_entity.dart';
import 'package:eazifly_student/domain/entities/get_library_category_entity.dart';
import 'package:eazifly_student/domain/entities/get_list_items_using_list_id_entity.dart';
import 'package:eazifly_student/domain/entities/store_favourite_list_entity.dart';
import 'package:eazifly_student/domain/use_cases/add_single_item_to_fav_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_all_items_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_all_library_lists_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_favourite_list_item_using_list_id_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_favourite_list_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_library_categories_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_list_items_using_list_id_usecase.dart';
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
    required this.getAllItemsUsecase,
    required this.addSingleItemToFavListUsecase,
    required this.getListItemsUsingListIdUsecase,
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

  File? favListImage;
  Future<void> pickFavImageImageFroGallery() async {
    final response = await pickImageFromGallery();
    if (response != null) {
      favListImage = File(response.path);
    }
    emit(PickImageFromGallerySuccessState());
  }

  List<int> itemsToAddToFvouriteWhenCreatingPlayList = [];
  bool storeFavouriteListLoader = false;
  StoreFavouriteListEntity? storeFavouriteListEntity;
  StoreFavouriteListUsecase storeFavouriteListUsecase;
  Future<void> storeFavouriteList() async {
    storeFavouriteListLoader = true;
    emit(StoreFavouriteListLoadingState());

    try {
      String? imagePath;

      // إذا كان في صورة جديدة
      if (favListImage != null) {
        final File file = favListImage!;

        if (!await file.exists()) {
          throw Exception('Profile image file does not exist');
        }

        imagePath = file.path;
      }

      final result = await storeFavouriteListUsecase.call(
        parameter: StoreFavouriteDataParameters(
          data: StoreFavouriteListTojson(
            items: itemsToAddToFvouriteWhenCreatingPlayList,
            title: favouriteListController.text,
            image: imagePath, // أرسل المسار كـ String
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
      log("Error in updateProfile: $e");
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

  bool getListItemsLoader = false;
  GetListItemsUsingListIdEntity? getListItemsUsingListIdEntity;
  GetListItemsUsingListIdUsecase getListItemsUsingListIdUsecase;

  Future<void> getListItemsUsingListId({required int listId}) async {
    getListItemsLoader = true;
    emit(GetListItemsLoadingState());

    final result = await getListItemsUsingListIdUsecase.call(
      parameter: GetListItemsUsingListIdParameters(
        listId: listId,
      ),
    );

    result.fold(
      (l) {
        getListItemsLoader = false;
        emit(GetListItemsErrorState(errorMessage: l.message));
      },
      (r) {
        getListItemsUsingListIdEntity = r;
        getListItemsLoader = false;
        emit(ListItemsSuccessState());
      },
    );
  }

  TextEditingController favouriteListController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool getFavouriteListItemsLoader = false;
  GetFavouriteListItemsUsingListIdEntity?
      getFavouriteListItemsUsingListIdEntity;
  GetFavouriteListItemUsingListIdUsecase getFavouriteListItemUsingListIdUsecase;

  Future<void> getFavouriteListItemsUsingListId({required int listId}) async {
    getFavouriteListItemsLoader = true;
    emit(FavouriteListItemsUsingListIdLoadingState());

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

  bool addSingleItemToFavListLoader = false;
  AddSingleItemToFavListEntity? addSingleItemToFavListEntity;
  AddSingleItemToFavUsecase addSingleItemToFavListUsecase;

  Future<void> addSingleItemToFavList({
    required int favouriteListId,
    required int libraryItemId,
  }) async {
    addSingleItemToFavListLoader = true;
    emit(AddSingleItemToFavListLoadingState());

    final result = await addSingleItemToFavListUsecase.call(
      parameter: AddSingleItemToFavListParameters(
        data: AddSingleItemToFavListTojson(
          favouriteListId: favouriteListId,
          libraryItemId: libraryItemId,
        ),
      ),
    );

    result.fold(
      (l) {
        addSingleItemToFavListLoader = false;
        emit(AddSingleItemToFavListErrorState(errorMessage: l.message));
      },
      (r) {
        addSingleItemToFavListEntity = r;
        addSingleItemToFavListLoader = false;
        emit(AddSingleItemToFavListSuccessState());
      },
    );
  }

  bool getAllItemsLoader = false;
  GetAllItemsEntity? getAllItemsEntity;
  GetAllItemsUsecase getAllItemsUsecase;

  Future<void> getAllItems() async {
    getAllItemsLoader = true;
    emit(GetAllItemsLoadingState());

    final result = await getAllItemsUsecase.call(parameter: NoParameter());

    result.fold(
      (failure) {
        getAllItemsLoader = false;
        emit(GetAllItemsErrorState(errorMessage: failure.message));
      },
      (success) {
        getAllItemsEntity = success;
        getAllItemsLoader = false;
        emit(GetAllItemsSuccessState());
      },
    );
  }

  void clearImages() {
    favListImage = null;
    emit(ClearImagesState());
  }

  clearAfterPost() {
    clearImages();
    favouriteListController.clear();
  }

  @override
  Future<void> close() {
    favouriteListController.dispose();
    return super.close();
  }

  void toggleAddingRemoving(int id) {
    !itemsToAddToFvouriteWhenCreatingPlayList.contains(id)
        ? itemsToAddToFvouriteWhenCreatingPlayList.add(id)
        : itemsToAddToFvouriteWhenCreatingPlayList.remove(id);
    emit(ToggleAddingRemovingState());
    log("$id");
  }
}
