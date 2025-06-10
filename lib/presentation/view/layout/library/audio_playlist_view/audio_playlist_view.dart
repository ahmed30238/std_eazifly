import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eazifly_student/core/component/no_data_animated_image_widget.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_cubit.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_state.dart';
import 'package:eazifly_student/presentation/view/layout/library/audio_playlist_view/widgets/telegram_style_file_item.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/library_fav_list_item_shimmer.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class AudioPlayListView extends StatefulWidget {
  final int listId;
  const AudioPlayListView({
    super.key,
    required this.listId,
  });

  @override
  State<AudioPlayListView> createState() => _AudioPlayListViewState();
}

class _AudioPlayListViewState extends State<AudioPlayListView> {
  late LibraryCubit cubit;
  final Map<String, double> _downloadProgress = {};
  final Map<String, bool> _isDownloading = {};
  final Map<String, String> _downloadedFiles = {};

  @override
  void initState() {
    cubit = context.read<LibraryCubit>();
    super.initState();
    cubit.getListItemsUsingListId(
      listId: widget.listId,
    );
  }

  // دالة لفتح الملفات حسب النوع (زي تيليجرام)
  Future<void> _openFile(
      String fileUrl, String fileType, String title, int index) async {
    try {
      // تحقق إذا كان الملف متحمل بالفعل
      if (_downloadedFiles.containsKey(fileUrl)) {
        await _openDownloadedFile(_downloadedFiles[fileUrl]!);
        return;
      }

      if (fileType.toLowerCase() == 'pdf') {
        await _downloadAndOpenPdf(fileUrl, title, index);
      } else if (fileType.toLowerCase() == 'txt') {
        await _downloadAndOpenTextFile(fileUrl, title, index);
      } else {
        _showErrorSnackBar('نوع الملف غير مدعوم');
      }
    } catch (e) {
      _showErrorSnackBar('حدث خطأ في فتح الملف: $e');
    }
  }

  // تحميل وفتح ملف PDF (زي تيليجرام)
  Future<void> _downloadAndOpenPdf(
      String fileUrl, String title, int index) async {
    try {
      setState(() {
        _isDownloading[fileUrl] = true;
        _downloadProgress[fileUrl] = 0.0;
      });

      // تحديد مسار الحفظ
      final directory = await getApplicationDocumentsDirectory();
      final fileName = '${title.replaceAll(RegExp(r'[^\w\s-]'), '')}.pdf';
      final filePath = '${directory.path}/$fileName';

      // تحميل الملف مع progress
      final dio = Dio();
      await dio.download(
        fileUrl,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            setState(() {
              _downloadProgress[fileUrl] = received / total;
            });
          }
        },
      );

      // حفظ مسار الملف المحمل
      _downloadedFiles[fileUrl] = filePath;

      setState(() {
        _isDownloading[fileUrl] = false;
        _downloadProgress[fileUrl] = 1.0;
      });

      // فتح الملف
      await _openDownloadedFile(filePath);
    } catch (e) {
      setState(() {
        _isDownloading[fileUrl] = false;
        _downloadProgress.remove(fileUrl);
      });
      _showErrorSnackBar('فشل في تحميل الملف: $e');
    }
  }

  // تحميل وفتح ملف نصي
  Future<void> _downloadAndOpenTextFile(
      String fileUrl, String title, int index) async {
    try {
      setState(() {
        _isDownloading[fileUrl] = true;
        _downloadProgress[fileUrl] = 0.0;
      });

      final dio = Dio();
      final response = await dio.get(fileUrl);

      if (response.statusCode == 200) {
        // حفظ الملف النصي محليا
        final directory = await getApplicationDocumentsDirectory();
        final fileName = '${title.replaceAll(RegExp(r'[^\w\s-]'), '')}.txt';
        final filePath = '${directory.path}/$fileName';
        final file = File(filePath);
        await file.writeAsString(response.data.toString());

        _downloadedFiles[fileUrl] = filePath;

        setState(() {
          _isDownloading[fileUrl] = false;
          _downloadProgress[fileUrl] = 1.0;
        });

        // فتح الملف
        await _openDownloadedFile(filePath);
      }
    } catch (e) {
      setState(() {
        _isDownloading[fileUrl] = false;
        _downloadProgress.remove(fileUrl);
      });
      _showErrorSnackBar('فشل في تحميل الملف النصي: $e');
    }
  }

  Future<void> _openDownloadedFile(String filePath) async {
    try {
      final result = await OpenFile.open(filePath);

      if (result.type != ResultType.done) {
        _showErrorSnackBar('لا يوجد تطبيق مناسب لفتح هذا الملف');
      }
    } catch (e) {
      _showErrorSnackBar('فشل في فتح الملف: $e');
    }
  }

  // عرض رسالة خطأ
  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  // عرض رسالة نجاح
  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "الملفات",
        leadingText: lang.library,
        isCenterTitle: true,
      ),
      body: Column(
        children: [
          24.ph,
          Text(
            "قائمة الملفات",
            style: MainTextStyle.boldTextStyle(
              fontSize: 18,
            ),
          ),
          16.ph,
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              if (cubit.getListItemsLoader) {
                return const FavItemShimmerList();
              }

              if (state is GetListItemsErrorState) {
                return Center(child: Text(state.errorMessage));
              }

              var audioPlaylist = cubit.getListItemsUsingListIdEntity?.data;

              if (audioPlaylist == null || audioPlaylist.isEmpty) {
                return const NoDataAnimatedImageWidget(message: "لا يوجد ملفات")
                    .center();
              }

              return Expanded(
                child: ListView.separated(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  itemBuilder: (context, index) {
                    var audioPlayListItem = audioPlaylist[index];
                    var fileType = audioPlayListItem.fileType ?? "";
                    var fileUrl = audioPlayListItem.file ?? "";
                    var title = audioPlayListItem.title ?? "ملف بدون عنوان";
                    var image = audioPlayListItem.image ?? "ملف بدون صورة";
                    var isPaid = audioPlayListItem.paymentType == "paid";
                    Color fileColor;

                    switch (fileType.toLowerCase()) {
                      case 'pdf':
                        fileColor = Colors.red;
                        break;
                      case 'txt':
                        fileColor = Colors.blue;
                        break;
                      default:
                        fileColor = Colors.grey;
                    }

                    return TelegramStyleFileItem(
                      isPaid: isPaid,
                      title: title,
                      fileType: fileType.toUpperCase(),
                      image: image,
                      fileColor: fileColor,
                      isDownloading: _isDownloading[fileUrl] ?? false,
                      downloadProgress: _downloadProgress[fileUrl] ?? 0.0,
                      isDownloaded: _downloadedFiles.containsKey(fileUrl),
                      onTap: isPaid
                          ? () {
                            delightfulToast(message: "ليس لديك اشتراك", context: context);
                          }
                          : () {
                              if (fileUrl.isNotEmpty) {
                                _openFile(fileUrl, fileType, title, index);
                              } else {
                                _showErrorSnackBar('رابط الملف غير متوفر');
                              }
                            },
                    );
                  },
                  separatorBuilder: (context, index) => 12.ph,
                  itemCount: audioPlaylist.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
