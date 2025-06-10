import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class TelegramStyleFileItem extends StatelessWidget {
  final String title;
  final String fileType;
  final String image;
  final Color fileColor;
  final bool isDownloading;
  final double downloadProgress;
  final bool isDownloaded;
  final VoidCallback onTap;
  final bool isPaid;

  const TelegramStyleFileItem({
    super.key,
    required this.title,
    required this.fileType,
    required this.image,
    required this.fileColor,
    required this.isDownloading,
    required this.downloadProgress,
    required this.isDownloaded,
    required this.onTap,
    required this.isPaid,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: 12.cr,
          child: Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: 12.cr,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1.r,
                  blurRadius: 4.r,
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
                    AvatarImage(
                      height: 48.h,
                      width: 48.w,
                      shape: BoxShape.rectangle,
                      radius: 12.r,
                      imageUrl: image,
                    ),
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      4.ph,
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 2.h,
                            ),
                            decoration: BoxDecoration(
                              color: fileColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              fileType,
                              style: MainTextStyle.mediumTextStyle(
                                fontSize: 12,
                                color: fileColor,
                              ),
                            ),
                          ),
                          const Spacer(),
                          if (isDownloading)
                            Text(
                              '${(downloadProgress * 100).toInt()}%',
                              style: MainTextStyle.mediumTextStyle(
                                fontSize: 12,
                                color: fileColor,
                              ),
                            )
                          else if (isDownloaded)
                            Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 16.r,
                            )
                          else
                            Icon(
                              Icons.download,
                              color: Colors.grey,
                              size: 16.r,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isPaid) ...{
          SvgPicture.asset(Assets.iconsLock),
        }
      ],
    );
  }
}
