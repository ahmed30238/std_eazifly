import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/core/component/voice_message_widget.dart';
import 'package:eazifly_student/core/enums/mesage_type_enum.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/extensions/widgets_extensions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/view/chat/messages_screen/widgets.dart/images_area.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextMessageItem extends StatelessWidget {
  final bool? isLastMesage;
  final bool? isThereImages;
  // final String? message;
  final String messageSenderAvatar;
  final Message messageModel;

  const TextMessageItem({
    super.key,
    this.isLastMesage = true,
    this.isThereImages = false,
    // this.message,
    required this.messageModel,
    required this.messageSenderAvatar,
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                constraints: BoxConstraints(
                  minHeight: 40.h,
                  minWidth: 120.w,
                  // نزيل maxWidth لجعل الحاوية تتمدد مع محتوى الرسالة
                  maxWidth: messageModel.content.length > 40
                      ? 280.w // حد أقصى للعرض بنسبة من عرض الشاشة
                      : 140.w,
                ),
                decoration: BoxDecoration(
                  color: messageModel.isSender
                      ? messageModel.type == MessageTypeEnum.voiceMessage
                          ? MainColors.grayBorderColor
                          : MainColors.greenTeal
                      : MainColors.grayBorderColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(messageModel.isSender ? 16.r : 0),
                    topRight:
                        Radius.circular(messageModel.isSender ? 0.r : 16.r),
                    bottomLeft: Radius.circular(16.r),
                    bottomRight: Radius.circular(16.r),
                  ),
                ),
                child: _buildMessageContent(messageModel).center(),
              ),
              8.ph,
              if (isThereImages == true) ...{
                const ImagesArea(),
              },
              8.ph,
              if (isLastMesage == true) ...{
                Text(
                  '12/2/2024',
                  textAlign: TextAlign.center,
                  style: MainTextStyle.regularTextStyle(
                    color: MainColors.grayTextColors,
                    fontSize: 11,
                  ),
                )
              }
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildMessageContent(Message message) {
  switch (message.type) {
    case MessageTypeEnum.text:
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Text(
              message.content,
              style: MainTextStyle.boldTextStyle(
                color: message.isSender
                    ? MainColors.white
                    : MainColors.grayTextColors,
                fontSize: 12,
              ),
              softWrap: true, // يسمح بالتفاف النص
              maxLines: null, // بدون حد لعدد السطور
              overflow: TextOverflow.visible, // يظهر كل النص
            ),
          ),
          8.pw,
          Text(
            message.createdAt,
            style: MainTextStyle.boldTextStyle(
              fontSize: 11,
              color: MainColors.black,
            ),
          ),
        ],
      );
    case MessageTypeEnum.image:
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.content,
            style: MainTextStyle.boldTextStyle(
              color: message.isSender
                  ? MainColors.white
                  : MainColors.grayTextColors,
              fontSize: 12,
            ),
            softWrap: true, // يسمح بالتفاف النص
            maxLines: null, // بدون حد لعدد السطور
            overflow: TextOverflow.visible, // يظهر كل النص
          ),
          8.ph,
          AvatarImage(
            imageUrl: message.content,
            width: 200.w,
            height: 200.h,
          ),
        ],
      );
    case MessageTypeEnum.voiceMessage:
      return const VoiceMessageWidget(
        audioSource: "",
        duration: 30,
        isFile: false,
        backgroundColor: MainColors.transparentColor,
      );
    default:
      return const SizedBox.shrink();
  }
}
