import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ChatItem extends StatelessWidget {
  final String profileAvatar;
  final String name;
  final String lastMessageContent;
  final String time;
  final VoidCallback onTap;
  // final bool isFirstChat;
  final int? unreadCount; // إضافة عدد الرسائل غير المقروءة
  
  const ChatItem({
    super.key,
    required this.onTap,
    required this.profileAvatar,
    required this.name,
    required this.lastMessageContent,
    required this.time,
    // this.isFirstChat = false,
    this.unreadCount,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الصورة الشخصية
            AvatarImage(
              height: 48.h,
              width: 48.w,
              borderWidth: 1.w,
              shape: BoxShape.circle,
              imageUrl: profileAvatar,
            ),
            12.pw,
            
            // محتوى الرسالة
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // الصف الأول: الاسم والوقت
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // الاسم
                      Expanded(
                        child: Text(
                          name,
                          style: MainTextStyle.boldTextStyle(
                            color: MainColors.onSecondary,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      4.pw,
                      // الوقت
                      Text(
                        time,
                        style: MainTextStyle.regularTextStyle(
                          color: unreadCount != null && unreadCount! > 0
                              ? MainColors.surfaceVariant // لون مختلف للرسائل غير المقروءة
                              : MainColors.onSurfaceSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  
                  4.ph,
                  
                  // الصف الثاني: محتوى الرسالة وعدد الرسائل غير المقروءة
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // محتوى الرسالة
                      Expanded(
                        child: Text(
                          lastMessageContent,
                          style: MainTextStyle.regularTextStyle(
                            color: unreadCount != null && unreadCount! > 0
                                ? MainColors.onSecondary // نص أغمق للرسائل غير المقروءة
                                : MainColors.onSurfaceSecondary,
                            fontSize: 14,
                            // fontWeight: unreadCount != null && unreadCount! > 0
                            //     ? FontWeight.w500 // خط أثقل للرسائل غير المقروءة
                            //     : FontWeight.normal,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      
                      // عدد الرسائل غير المقروءة
                      if (unreadCount != null && unreadCount! > 0) ...[
                        8.pw,
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: MainColors.success,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 20.w,
                            minHeight: 20.h,
                          ),
                          child: Text(
                            unreadCount! > 99 ? '99+' : unreadCount.toString(),
                            style: MainTextStyle.boldTextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
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