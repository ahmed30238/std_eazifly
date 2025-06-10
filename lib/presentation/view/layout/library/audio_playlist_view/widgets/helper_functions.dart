  // // دالة لفتح الملفات حسب النوع (زي تيليجرام)
  // Future<void> _openFile(
  //     String fileUrl, String fileType, String title, int index) async {
  //   try {
  //     // تحقق إذا كان الملف متحمل بالفعل
  //     if (_downloadedFiles.containsKey(fileUrl)) {
  //       await _openDownloadedFile(_downloadedFiles[fileUrl]!);
  //       return;
  //     }

  //     if (fileType.toLowerCase() == 'pdf') {
  //       await _downloadAndOpenPdf(fileUrl, title, index);
  //     } else if (fileType.toLowerCase() == 'txt') {
  //       await _downloadAndOpenTextFile(fileUrl, title, index);
  //     } else {
  //       _showErrorSnackBar('نوع الملف غير مدعوم');
  //     }
  //   } catch (e) {
  //     _showErrorSnackBar('حدث خطأ في فتح الملف: $e');
  //   }
  // }
  //   // تحميل وفتح ملف PDF (زي تيليجرام)
  // Future<void> _downloadAndOpenPdf(
  //     String fileUrl, String title, int index) async {
  //   try {
  //     setState(() {
  //       _isDownloading[fileUrl] = true;
  //       _downloadProgress[fileUrl] = 0.0;
  //     });

  //     // تحديد مسار الحفظ
  //     final directory = await getApplicationDocumentsDirectory();
  //     final fileName = '${title.replaceAll(RegExp(r'[^\w\s-]'), '')}.pdf';
  //     final filePath = '${directory.path}/$fileName';

  //     // تحميل الملف مع progress
  //     final dio = Dio();
  //     await dio.download(
  //       fileUrl,
  //       filePath,
  //       onReceiveProgress: (received, total) {
  //         if (total != -1) {
  //           setState(() {
  //             _downloadProgress[fileUrl] = received / total;
  //           });
  //         }
  //       },
  //     );

  //     // حفظ مسار الملف المحمل
  //     _downloadedFiles[fileUrl] = filePath;

  //     setState(() {
  //       _isDownloading[fileUrl] = false;
  //       _downloadProgress[fileUrl] = 1.0;
  //     });

  //     // فتح الملف
  //     await _openDownloadedFile(filePath);
  //   } catch (e) {
  //     setState(() {
  //       _isDownloading[fileUrl] = false;
  //       _downloadProgress.remove(fileUrl);
  //     });
  //     _showErrorSnackBar('فشل في تحميل الملف: $e');
  //   }
  // }