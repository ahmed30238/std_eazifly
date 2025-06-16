import 'dart:developer';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/data/models/library/favourite_list/add_single_item_to_fav_tojson.dart';
import 'package:eazifly_student/data/models/library/favourite_list/get_favourite_list_model.dart';
import 'package:eazifly_student/data/models/library/favourite_list/store_favourite_list_model.dart';
import 'package:eazifly_student/data/models/library/favourite_list/store_favourite_list_tojson.dart';
import 'package:eazifly_student/domain/entities/add_single_item_to_fav_list_entity.dart';
import 'package:eazifly_student/domain/entities/get_all_items_entity.dart';
import 'package:eazifly_student/domain/entities/get_all_library_lists_entity.dart';
import 'package:eazifly_student/domain/entities/get_favourite_list_entity.dart';
import 'package:eazifly_student/domain/entities/get_favourite_list_items_using_list_id_entity.dart';
import 'package:eazifly_student/domain/entities/get_library_category_entity.dart';
import 'package:eazifly_student/domain/entities/get_list_items_using_list_id_entity.dart';
import 'package:eazifly_student/domain/entities/like_item_entity.dart';
import 'package:eazifly_student/domain/entities/show_library_item_entity.dart';
import 'package:eazifly_student/domain/entities/store_favourite_list_entity.dart';
import 'package:eazifly_student/domain/use_cases/add_single_item_to_fav_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_all_items_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_all_library_lists_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_favourite_list_item_using_list_id_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_favourite_list_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_library_categories_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_list_items_using_list_id_usecase.dart';
import 'package:eazifly_student/domain/use_cases/like_item_usecase.dart';
import 'package:eazifly_student/domain/use_cases/show_library_item_usecase.dart';
import 'package:eazifly_student/domain/use_cases/store_favourite_list_usecase.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_state.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/audios_body.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/favourite_body.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/menu_list_body.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/visuals_body.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
// import 'package:just_audio/just_audio.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

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
    required this.likeItemUsecase,
    required this.getLibraryItemsUsecase,
    // required this.getPaymentMethodDetailsUsecase,
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
      if (favListImage != null) {
        final File file = favListImage!;

        if (!await file.exists()) {
          throw Exception('Fav image file does not exist');
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
          var item = FavouriteDatumEntity(
            id: r.data?.id ?? -1,
            image: r.data?.image ?? "",
            numberOfItems: r.data?.numberOfItems ?? 0,
            title: r.data?.title ?? "",
          );
          allFavourites.insert(0, item);
          StoreFavouriteDataModel;
          FavouriteDatumModel;
          emit(StoreFavouriteListSuccessState());
        },
      );
    } catch (e) {
      storeFavouriteListLoader = false;
      log("Error in StoreFav: $e");
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
  List<FavouriteDatumEntity> allFavourites = [];
  Future<void> getFavouriteList() async {
    allFavourites = [];
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
        allFavourites.addAll(r.data!);
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

  bool getLibraryItemsLoader = false;
  ShowLibraryItemEntity? libraryItemsEntity;
  ShowLibraryItemUsecase getLibraryItemsUsecase;

  Future<void> showLibraryItem(
      {required int itemId, required BuildContext context}) async {
    getLibraryItemsLoader = true;
    emit(GetLibraryItemsLoadingState());

    final result = await getLibraryItemsUsecase.call(
        parameter: ShowLibraryItemParameters(itemId: itemId));

    result.fold(
      (failure) {
        getLibraryItemsLoader = false;
        emit(GetLibraryItemsErrorState(errorMessage: failure.message));
      },
      (success) async {
        libraryItemsEntity = success;
        getLibraryItemsLoader = false;
        emit(GetLibraryItemsSuccessState());
        if (success.status != 201) {
          delightfulToast(message: "${success.message}", context: context);
          showModalSheet(
              isFixedSize: true,
              maxHeight: 120.h,
              minHeight: 120.h,
              context,
              widget: Column(
                children: [
                  24.ph,
                  Text(
                    "هل تود الاشتراك",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 14,
                    ),
                  ),
                  16.ph,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomElevatedButton(
                            radius: 16.r,
                            height: 40.h,
                            text: "نعم",
                            color: MainColors.greenTeal,
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                RoutePaths.addToLibraryPackageDetailsView,
                              );
                            },
                          ),
                        ),
                        10.pw,
                        Expanded(
                          child: CustomElevatedButton(
                            radius: 16.r,
                            height: 40.h,
                            color: MainColors.red,
                            text: "لا",
                            onPressed: () {
                              back(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ));
        } else {
          await openFile(
            fileUrl: success.data?.file ?? "",
            fileType: success.data?.fileType ?? "",
            context: context,
            title: success.data?.title ?? "",
          );
        }
      },
    );
  }

  bool likeItemLoader = false;
  LikeItemUsecase likeItemUsecase;
  LikeItemEntity? likeItemEntity;
  Future<void> likeItem(int itemId, bool status) async {
    likeItemLoader = true;
    emit(LikeItemLoadingState());
    final result = await likeItemUsecase.call(
        parameter: LikeItemParameters(
      itemId: itemId,
      status: status,
    ));

    result.fold(
      (failure) {
        likeItemLoader = false;
        emit(LikeItemErrorState(errorMessage: failure.message));
      },
      (success) {
        likeItemLoader = false;
        emit(LikeItemSuccessState());
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
    _audioPlayer.dispose();
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

  ///! files
  final Map<String, bool> _isDownloading = {};
  final Map<String, double> _downloadingProgress = {};
  final Map<String, String> _downloadedFiles =
      {}; // key: fileUrl, value: local path

  Map<String, bool> get isDownloading => Map.unmodifiable(_isDownloading);
  Map<String, double> get downloadingProgress =>
      Map.unmodifiable(_downloadingProgress);
  Map<String, String> get downloadedFiles => Map.unmodifiable(_downloadedFiles);

  // دالة لفتح الملفات حسب النوع (زي تيليجرام)
  // إضافة AudioPlayer للتحكم في الصوت
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration currentPosition = Duration.zero;
  Duration totalDuration = Duration.zero;
  String? currentPlayingUrl;

  // دالة محدثة لفتح الملفات مع دعم الصوت
  Future<void> openFile({
    required String fileUrl,
    required String fileType,
    required BuildContext context,
    required String title,
  }) async {
    try {
      if (_downloadedFiles.containsKey(fileUrl)) {
        await _openDownloadedFile(
            filePath: _downloadedFiles[fileUrl]!, context: context);
        return;
      }

      switch (fileType.toLowerCase()) {
        case "pdf":
          await _downloadAndOpenPdf(
              fileUrl: fileUrl, title: title, context: context);
          break;
        case "txt":
          await _downloadAndOpenTextFile(
            fileUrl: fileUrl,
            title: title,
            onError: (errorMessage) {
              if (context.mounted) {
                showErrorSnackBar(errorMessage, context);
              }
            },
            onSuccess: (filePath) async {
              if (context.mounted) {
                await _openDownloadedFile(filePath: filePath, context: context);
              }
            },
          );
          break;
        case "mp3":
          // case "audio":
          await _playAudioFile(
            fileUrl: fileUrl,
            title: title,
            context: context,
          );
          break;
        default:
          showErrorSnackBar("نوع الملف غير مدعوم", context);
      }
    } catch (e) {
      showErrorSnackBar('حدث خطأ في فتح الملف: $e', context);
    }
  }

  // دالة تشغيل الملفات الصوتية
  Future<void> _playAudioFile({
    required String fileUrl,
    required String title,
    required BuildContext context,
  }) async {
    try {
      // إيقاف أي صوت يتم تشغيله حالياً
      if (isPlaying && currentPlayingUrl != fileUrl) {
        await _audioPlayer.stop();
      }

      currentPlayingUrl = fileUrl;

      // تشغيل الملف الصوتي من الرابط مباشرة
      await _audioPlayer.play(UrlSource(fileUrl));
      isPlaying = true;
      emit(AudioPlayingState());

      // الاستماع لتغييرات حالة التشغيل
      _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
        isPlaying = state == PlayerState.playing;
        emit(AudioStateChangedState());
      });

      // الاستماع لموضع التشغيل
      _audioPlayer.onPositionChanged.listen((Duration position) {
        currentPosition = position;
        emit(AudioPositionChangedState());
      });

      // الاستماع لمدة الملف الكاملة
      _audioPlayer.onDurationChanged.listen((Duration duration) {
        totalDuration = duration;
        emit(AudioDurationChangedState());
      });

      // عرض مشغل الصوت في Bottom Sheet
      _showAudioPlayerBottomSheet(context, title);
    } catch (e) {
      showErrorSnackBar('فشل في تشغيل الملف الصوتي: $e', context);
    }
  }

  // عرض مشغل الصوت في Bottom Sheet
  void _showAudioPlayerBottomSheet(BuildContext context, String title) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) => BlocProvider.value(
        value: this,
        // create: (context) => SubjectCubit(),
        child: Container(
          padding: EdgeInsets.all(20.w),
          height: 200.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // عنوان الملف
              Text(
                title,
                style: MainTextStyle.boldTextStyle(fontSize: 16),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              20.ph,

              // شريط التقدم
              BlocBuilder<LibraryCubit, LibraryState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Slider(
                        value: totalDuration.inSeconds > 0
                            ? currentPosition.inSeconds.toDouble()
                            : 0.0,
                        max: totalDuration.inSeconds.toDouble(),
                        onChanged: (value) {
                          _audioPlayer.seek(Duration(seconds: value.toInt()));
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_formatDuration(currentPosition)),
                          Text(_formatDuration(totalDuration)),
                        ],
                      ),
                    ],
                  );
                },
              ),

              20.ph,

              // أزرار التحكم
              BlocBuilder<LibraryCubit, LibraryState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // زر الترجيع 10 ثواني
                      IconButton(
                        onPressed: () => _seekBackward(),
                        icon: Icon(Icons.replay_10, size: 30.w),
                      ),

                      // زر التشغيل/الإيقاف
                      Container(
                        decoration: BoxDecoration(
                          color: MainColors.greenTeal,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () => _togglePlayPause(),
                          icon: Icon(
                            isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.white,
                            size: 35.w,
                          ),
                        ),
                      ),

                      // زر التقديم 10 ثواني
                      IconButton(
                        onPressed: () => _seekForward(),
                        icon: Icon(Icons.forward_10, size: 30.w),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // دوال التحكم في الصوت
  Future<void> _togglePlayPause() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.resume();
    }
    emit(AudioStateChangedState());
  }

  Future<void> _seekForward() async {
    final newPosition = currentPosition + Duration(seconds: 10);
    if (newPosition < totalDuration) {
      await _audioPlayer.seek(newPosition);
    }
  }

  Future<void> _seekBackward() async {
    final newPosition = currentPosition - Duration(seconds: 10);
    if (newPosition > Duration.zero) {
      await _audioPlayer.seek(newPosition);
    } else {
      await _audioPlayer.seek(Duration.zero);
    }
  }

  // تنسيق الوقت
  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  // إيقاف الصوت عند إغلاق الـ Cubit

  Future<void> _openDownloadedFile(
      {required String filePath, required BuildContext context}) async {
    try {
      final result = await OpenFile.open(filePath);
      if (result.type != ResultType.done) {
        showErrorSnackBar('لا يوجد تطبيق مناسب لفتح هذا الملف', context);
      }
    } catch (e) {
      if (context.mounted) {
        return;
      }
      showErrorSnackBar('فشل في فتح الملف: $e', context);
    }
  }

  // عرض رسالة خطأ
  void showErrorSnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  Future<void> _downloadAndOpenPdf(
      {required String fileUrl,
      required String title,
      required BuildContext context}) async {
    try {
      _isDownloading[fileUrl] = true;
      _downloadingProgress[fileUrl] = 0.0;
      emit(DownLoadPdfLoadingState());

      final directory = await getApplicationDocumentsDirectory();
      final fileName = "${title.replaceAll(RegExp(r'[^\w\s-]'), "")}.pdf";
      final filePath = "${directory.path}/$fileName";

      Dio dio = Dio();
      await dio.download(
        fileUrl,
        filePath,
        onReceiveProgress: (count, total) {
          if (total != -1) {
            _downloadingProgress[fileUrl] = count / total;
            emit(DownLoadPdfLoadingState());
          }
        },
      );
      _downloadedFiles[fileUrl] = filePath;
      _isDownloading[fileUrl] = false;
      _downloadingProgress[fileUrl] = 1.0;
      emit(DownLoadPdfSuccessState());
      if (context.mounted) {
        return;
      }
      await _openDownloadedFile(filePath: filePath, context: context);
    } catch (e) {
      _isDownloading[fileUrl] = false;
      _downloadingProgress.remove(fileUrl);
      emit(DownLoadPdfErrorState());
      showErrorSnackBar('فشل في تحميل الملف: $e', context);
    }
  }

  // Future<void> _downloadAndOpenTextFile() async {}
// الحل الثالث: استخدام callback functions (الأفضل)
  Future<void> _downloadAndOpenTextFile({
    required String fileUrl,
    required String title,
    required Function(String)? onError,
    required Function(String)? onSuccess,
  }) async {
    try {
      _isDownloading[fileUrl] = true;
      _downloadingProgress[fileUrl] = 0.0;
      emit(DownloadTextFileLoadingState());

      final dio = Dio();
      final response = await dio.get(fileUrl);

      if (response.statusCode == 200) {
        final directory = await getApplicationDocumentsDirectory();
        final fileName = '${title.replaceAll(RegExp(r'[^\w\s-]'), '')}.txt';
        final filePath = '${directory.path}/$fileName';
        final file = File(filePath);
        await file.writeAsString(response.data.toString());

        _downloadedFiles[fileUrl] = filePath;

        _isDownloading[fileUrl] = false;
        _downloadingProgress[fileUrl] = 1.0;
        emit(DownloadTextFileSuccessState());

        // استدعاء callback للنجاح
        onSuccess?.call(filePath);
      }
    } catch (e) {
      _isDownloading[fileUrl] = false;
      _downloadingProgress.remove(fileUrl);
      emit(DownLoadPdfErrorState());

      // استدعاء callback للخطأ
      onError?.call('فشل في تحميل الملف النصي: $e');
    }
  }
  //! end of files methods
}
