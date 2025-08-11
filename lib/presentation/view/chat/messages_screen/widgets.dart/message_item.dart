import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/core/component/voice_message_widget.dart';
import 'package:eazifly_student/core/enums/mesage_type_enum.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/view/chat/messages_screen/widgets.dart/images_area.dart';
import 'package:eazifly_student/presentation/view/lecture/corrcected_assignment_details_view/widgets/question_an_sol_container.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// إضافة enum لحالة الرسالة
enum MessageStatus {
  sending, // جاري الإرسال
  sent, // تم الإرسال
  delivered, // تم التوصيل
  read, // تم القراءة
  failed // فشل الإرسال
}

class TextMessageItem extends StatelessWidget {
  final bool isLastMesage;
  final bool? isThereImages;
  final String messageSenderAvatar;
  final Message messageModel;
  final MessageStatus? messageStatus; // إضافة حالة الرسالة
  final String file;
  const TextMessageItem({
    super.key,
    this.isLastMesage = true,
    this.isThereImages = false,
    required this.messageModel,
    required this.messageSenderAvatar,
    this.messageStatus,
    required this.file,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          messageModel.isSender ? TextDirection.rtl : TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AvatarImage(
            height: 28.h,
            width: 28.w,
            shape: BoxShape.circle,
            imageUrl: messageSenderAvatar,
          ),
          8.pw,
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  constraints: BoxConstraints(
                    minHeight: 40.h,
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  decoration: BoxDecoration(
                    color: messageModel.isSender
                        ? messageModel.type == MessageTypeEnum.voiceMessage
                            ? MainColors.outline
                            : MainColors.success
                        : MainColors.outline,
                    borderRadius: BorderRadius.only(
                      topLeft:
                          Radius.circular(messageModel.isSender ? 16.r : 0),
                      topRight:
                          Radius.circular(messageModel.isSender ? 0.r : 16.r),
                      bottomLeft: Radius.circular(16.r),
                      bottomRight: Radius.circular(16.r),
                    ),
                  ),
                  child: _buildMessageContent(
                    context,
                    messageModel,
                    messageStatus,
                    file,
                  ),
                ),
                8.ph,
                if (isThereImages == true) ...{
                  const ImagesArea(),
                },
                8.ph,
                if (isLastMesage) ...{
                  Text(
                    '12/2/2024',
                    textAlign: TextAlign.center,
                    style: MainTextStyle.regularTextStyle(
                      color: MainColors.onSurfaceSecondary,
                      fontSize: 11,
                    ),
                  )
                }
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// دالة لبناء أيقونة حالة الرسالة
Widget _buildMessageStatusIcon(MessageStatus? status) {
  if (status == null) return const SizedBox.shrink();

  switch (status) {
    case MessageStatus.sending:
      return SizedBox(
        width: 12.w,
        height: 12.h,
        child: CircularProgressIndicator(
          strokeWidth: 1.5,
          valueColor: AlwaysStoppedAnimation<Color>(MainColors.onSurfaceSecondary),
        ),
      );
    case MessageStatus.sent:
      return Icon(
        Icons.check,
        size: 14.sp,
        color: MainColors.onSurfaceSecondary,
      );
    case MessageStatus.delivered:
      return Icon(
        Icons.done_all,
        size: 14.sp,
        color: MainColors.onSurfaceSecondary,
      );
    case MessageStatus.read:
      return Icon(
        Icons.done_all,
        size: 14.sp,
        color: MainColors.success,
      );
    case MessageStatus.failed:
      return Icon(
        Icons.error_outline,
        size: 14.sp,
        color: Colors.red,
      );
  }
}

Widget _buildMessageContent(
  BuildContext context,
  Message message,
  MessageStatus? messageStatus,
  String file,
) {
  switch (message.type) {
    case MessageTypeEnum.text:
      return IntrinsicWidth(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: _buildTextWithLinks(message),
            ),
            8.pw,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  message.createdAt,
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 11,
                    color: MainColors.onPrimary,
                  ),
                ),
                // إضافة أيقونة حالة الرسالة للمرسل فقط
                if (message.isSender && messageStatus != null) ...[
                  4.pw,
                  _buildMessageStatusIcon(messageStatus),
                ],
              ],
            ),
          ],
        ),
      );
    case MessageTypeEnum.image:
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTextWithLinks(message),
          8.ph,
          GestureDetector(
            onTap: () {
              showFullScreenImage(context, file);
            },
            child: AvatarImage(
              imageUrl: file,
              width: 200.w,
              height: 200.h,
            ),
          ),
          // إضافة حالة الرسالة للصور أيضاً
          if (message.isSender && messageStatus != null) ...[
            4.ph,
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    message.createdAt,
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 11,
                      color: MainColors.onPrimary,
                    ),
                  ),
                  4.pw,
                  _buildMessageStatusIcon(messageStatus),
                ],
              ),
            ),
          ],
        ],
      );
    case MessageTypeEnum.voiceMessage:
      return VoiceMessageWidget(
        width: 200.w,
        audioUrl: file,
        backgroundColor: MainColors.transparent,
      );
  }
}

// الدالة الجديدة لبناء النص مع دعم الروابط
Widget _buildTextWithLinks(Message message) {
  // RegExp للبحث عن الروابط
  final urlRegex = RegExp(
    r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)',
    caseSensitive: false,
  );

  List<TextSpan> spans = [];
  String text = message.content;
  int lastIndex = 0;

  // البحث عن جميع الروابط في النص
  for (Match match in urlRegex.allMatches(text)) {
    // إضافة النص العادي قبل الرابط
    if (match.start > lastIndex) {
      spans.add(TextSpan(
        text: text.substring(lastIndex, match.start),
        style: MainTextStyle.boldTextStyle(
          color:
              message.isSender ? MainColors.background : MainColors.onSurfaceSecondary,
          fontSize: 12,
        ),
      ));
    }

    // إضافة الرابط
    final url = match.group(0)!;
    spans.add(TextSpan(
      text: url,
      style: MainTextStyle.boldTextStyle(
        color: message.isSender
            ? MainColors.background
                .withOpacity(0.8) // لون مختلف للروابط في رسائل المُرسل
            : Colors.blue, // لون أزرق للروابط في رسائل المُستقبل
        fontSize: 12,
      ).copyWith(
        decoration: TextDecoration.underline,
      ),
      recognizer: TapGestureRecognizer()..onTap = () => openUrl(url),
    ));

    lastIndex = match.end;
  }

  // إضافة باقي النص بعد آخر رابط
  if (lastIndex < text.length) {
    spans.add(TextSpan(
      text: text.substring(lastIndex),
      style: MainTextStyle.boldTextStyle(
        color: message.isSender ? MainColors.background : MainColors.onSurfaceSecondary,
        fontSize: 12,
      ),
    ));
  }

  // إذا لم يتم العثور على روابط، أرجع النص العادي
  if (spans.isEmpty) {
    return Text(
      message.content,
      style: MainTextStyle.boldTextStyle(
        color: message.isSender ? MainColors.background : MainColors.onSurfaceSecondary,
        fontSize: 12,
      ),
      softWrap: true,
      maxLines: null,
      overflow: TextOverflow.visible,
    );
  }

  // إرجاع النص مع الروابط
  return RichText(
    text: TextSpan(children: spans),
    softWrap: true,
    maxLines: null,
    overflow: TextOverflow.visible,
  );
}
