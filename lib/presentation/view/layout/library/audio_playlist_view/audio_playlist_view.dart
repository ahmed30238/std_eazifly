import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eazifly_student/core/component/no_data_animated_image_widget.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_cubit.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_state.dart';
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
  Future<void> _openFile(String fileUrl, String fileType, String title, int index) async {
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
  Future<void> _downloadAndOpenPdf(String fileUrl, String title, int index) async {
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
  Future<void> _downloadAndOpenTextFile(String fileUrl, String title, int index) async {
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
          const Text(
            "قائمة الملفات",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
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
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  itemBuilder: (context, index) {
                    var audioPlayListItem = audioPlaylist[index];
                    var fileType = audioPlayListItem.fileType ?? "";
                    var fileUrl = audioPlayListItem.file ?? "";
                    var title = audioPlayListItem.title ?? "ملف بدون عنوان";
                    
                    // تحديد أيقونة الملف
                    IconData fileIcon;
                    Color fileColor;
                    
                    switch (fileType.toLowerCase()) {
                      case 'pdf':
                        fileIcon = Icons.picture_as_pdf;
                        fileColor = Colors.red;
                        break;
                      case 'txt':
                        fileIcon = Icons.text_snippet;
                        fileColor = Colors.blue;
                        break;
                      default:
                        fileIcon = Icons.insert_drive_file;
                        fileColor = Colors.grey;
                    }

                    return TelegramStyleFileItem(
                      title: title,
                      fileType: fileType.toUpperCase(),
                      fileIcon: fileIcon,
                      fileColor: fileColor,
                      isDownloading: _isDownloading[fileUrl] ?? false,
                      downloadProgress: _downloadProgress[fileUrl] ?? 0.0,
                      isDownloaded: _downloadedFiles.containsKey(fileUrl),
                      onTap: () {
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

// Widget مخصص يشبه تيليجرام لعرض الملفات
class TelegramStyleFileItem extends StatelessWidget {
  final String title;
  final String fileType;
  final IconData fileIcon;
  final Color fileColor;
  final bool isDownloading;
  final double downloadProgress;
  final bool isDownloaded;
  final VoidCallback onTap;

  const TelegramStyleFileItem({
    super.key,
    required this.title,
    required this.fileType,
    required this.fileIcon,
    required this.fileColor,
    required this.isDownloading,
    required this.downloadProgress,
    required this.isDownloaded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // أيقونة الملف
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: fileColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    fileIcon,
                    color: fileColor,
                    size: 24,
                  ),
                ),
                // Progress indicator أثناء التحميل
                if (isDownloading)
                  SizedBox(
                    width: 48.w,
                    height: 48.h,
                    child: CircularProgressIndicator(
                      value: downloadProgress,
                      backgroundColor: Colors.grey.withOpacity(0.3),
                      valueColor: AlwaysStoppedAnimation<Color>(fileColor),
                      strokeWidth: 3.w,
                    ),
                  ),
              ],
            ),
            
            16.pw,
            
            // معلومات الملف
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  4.ph,
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: fileColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          fileType,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: fileColor,
                          ),
                        ),
                      ),
                      const Spacer(),
                      if (isDownloading)
                        Text(
                          '${(downloadProgress * 100).toInt()}%',
                          style: TextStyle(
                            fontSize: 12,
                            color: fileColor,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      else if (isDownloaded)
                        const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 16,
                        )
                      else
                        const Icon(
                          Icons.download,
                          color: Colors.grey,
                          size: 16,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}