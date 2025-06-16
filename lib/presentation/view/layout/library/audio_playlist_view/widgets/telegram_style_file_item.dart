import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TelegramStyleFileItem extends StatelessWidget {
  final bool isPaid;
  final String title;
  final String fileType;
  final String image;
  final Color fileColor;
  final bool isDownloading;
  final double downloadProgress;
  final bool isDownloaded;
  final bool isAudioFile; // جديد
  final bool isCurrentlyPlaying; // جديد
  final VoidCallback onTap;

  const TelegramStyleFileItem({
    super.key,
    required this.isPaid,
    required this.title,
    required this.fileType,
    required this.image,
    required this.fileColor,
    required this.isDownloading,
    required this.downloadProgress,
    required this.isDownloaded,
    this.isAudioFile = false, // افتراضي false
    this.isCurrentlyPlaying = false, // افتراضي false
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
          // إضافة border للملف الصوتي الذي يتم تشغيله
          border: isCurrentlyPlaying
              ? Border.all(color: Colors.green, width: 2)
              : null,
        ),
        child: Row(
          children: [
            // أيقونة الملف
            Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: fileColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                _getFileIcon(),
                color: fileColor,
                size: 24.w,
              ),
            ),
            
            12.pw,
            
            // معلومات الملف
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  4.ph,
                  Row(
                    children: [
                      Text(
                        fileType,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: fileColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      8.pw,
                      // إضافة مؤشر للملف الصوتي
                      if (isAudioFile) ...[
                        Icon(
                          Icons.volume_up,
                          size: 14.w,
                          color: Colors.grey[600],
                        ),
                        4.pw,
                        Text(
                          "صوتي",
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                      // مؤشر الملف المدفوع
                      if (isPaid) ...[
                        8.pw,
                        Icon(
                          Icons.lock,
                          size: 12.w,
                          color: Colors.orange,
                        ),
                      ],
                    ],
                  ),
                  // شريط التحميل
                  if (isDownloading) ...[
                    4.ph,
                    LinearProgressIndicator(
                      value: downloadProgress,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation(fileColor),
                    ),
                  ],
                ],
              ),
            ),
            
            8.pw,
            
            // أيقونة الحالة
            _buildStatusIcon(),
          ],
        ),
      ),
    );
  }

  IconData _getFileIcon() {
    if (isAudioFile) {
      return isCurrentlyPlaying ? Icons.music_note : Icons.audio_file;
    }
    
    switch (fileType.toLowerCase()) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'txt':
        return Icons.text_snippet;
      default:
        return Icons.insert_drive_file;
    }
  }

  Widget _buildStatusIcon() {
    if (isDownloading) {
      return SizedBox(
        width: 20.w,
        height: 20.h,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation(fileColor),
        ),
      );
    }

    if (isCurrentlyPlaying) {
      return Icon(
        Icons.pause_circle_filled,
        color: Colors.green,
        size: 24.w,
      );
    }

    if (isAudioFile) {
      return Icon(
        Icons.play_circle_filled,
        color: fileColor,
        size: 24.w,
      );
    }

    if (isDownloaded) {
      return Icon(
        Icons.check_circle,
        color: Colors.green,
        size: 20.w,
      );
    }

    return Icon(
      Icons.download,
      color: Colors.grey[600],
      size: 20.w,
    );
  }
}