import 'dart:developer';

import 'package:eazifly_student/core/enums/mesage_type_enum.dart';
import 'package:eazifly_student/presentation/controller/chats/chats_cubit.dart';
import 'package:eazifly_student/presentation/controller/chats/chats_state.dart';
import 'package:eazifly_student/presentation/view/chat/messages_screen/dm_view.dart';
import 'package:eazifly_student/presentation/view/chat/messages_screen/widgets.dart/message_item.dart';
import 'package:eazifly_student/presentation/view/chat/messages_screen/widgets.dart/writing_message_area.dart';
import 'package:eazifly_student/presentation/view/layout/home_page/home_page.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:intl/intl.dart';

class DmBody extends StatelessWidget {
  const DmBody({
    super.key,
    required this.cubit,
    required this.widget,
  });

  final ChatsCubit cubit;
  final DmView widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Divider(
                thickness: 1,
                color: MainColors.lightGray,
              ),
              40.ph,
              Expanded(
                child: BlocBuilder<ChatsCubit, ChatsState>(
                  builder: (context, state) {
                    log("state is $state");
                    if (state is GetMesssagesLoadingState &&
                        (cubit.uiMessages.isEmpty)) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is GetMessagesErrorState &&
                        (cubit.uiMessages.isEmpty)) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(state.errorMessage),
                            const SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () => cubit.getMessages(
                                  isInitial: true, chatId: widget.chatId),
                              child: const Text("Retry"),
                            ),
                          ],
                        ),
                      );
                    }
                    if (cubit.uiMessages.isEmpty) {
                      return Center(
                        child: Text(
                          "No messages yet",
                          style: MainTextStyle.mediumTextStyle(
                            color: MainColors.grayTextColors,
                            fontSize: 16.sp,
                          ),
                        ),
                      );
                    }
                    final messages = cubit.uiMessages;
                    return ListView.builder(
                      shrinkWrap: true,
                      reverse: true,
                      physics: const BouncingScrollPhysics(),
                      controller: cubit.scrollController,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      itemCount: messages.length + (cubit.hasMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == messages.length) {
                          // Show bottom loader when more data is available
                          return Padding(
                            padding: EdgeInsets.all(8.0.r),
                            child: const Center(
                                child: CircularProgressIndicator()),
                          );
                        }
                        bool isLastElement = index == messages.length - 1;
                        final message = messages[index];
                        log("building message: ${message.message.message}");

                        return TextMessageItem(
                          messageStatus: message.isSending
                              ? MessageStatus.sending
                              : message.isFailed
                                  ? MessageStatus.failed
                                  : MessageStatus.sent,
                          isLastMesage: isLastElement,
                          messageModel: Message(
                            createdAt: message.message.createdAt == null
                                ? formatMessageTime(
                                    context,
                                    DateTime.now().toString(),
                                  )
                                : formatMessageTime(
                                    context,
                                    message.message.createdAt.toString(),
                                  ),
                            type: MessageTypeEnum.text,
                            content: message.message.message ?? "",
                            isSender: message.message.senderType == "User",
                          ),
                          messageSenderAvatar:
                              message.message.senderType == "User"
                                  ? loginData?.image ?? ""
                                  : cubit.currentInstructor?.image ?? "",
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        WritingMessageArea(
          orderId: widget.orderId ?? -1,
          isReport: widget.isReport,
        ),
      ],
    );
  }
}

String formatMessageTime(BuildContext context, String createdAt) {
  try {
    // تحويل النص إلى DateTime
    DateTime dateTime = DateTime.parse(createdAt);

    // تحويل إلى التوقيت المحلي
    DateTime localDateTime = dateTime.toLocal();

    DateTime now = DateTime.now();
    Duration difference = now.difference(localDateTime);

    // إذا كان نفس اليوم، اعرض الوقت فقط
    if (difference.inDays == 0) {
      return DateFormat(
              'hh:mm a', ApplanuageCubit.isArabic(context) ? "ar" : "en")
          .format(localDateTime);
    }
    // إذا كان أمس
    else if (difference.inDays == 1) {
      return 'أمس ${DateFormat('hh:mm a', ApplanuageCubit.isArabic(context) ? "ar" : "en").format(localDateTime)}';
    }
    // إذا كان خلال الأسبوع الماضي
    else if (difference.inDays < 7) {
      return DateFormat(
              'EEEE hh:mm a', ApplanuageCubit.isArabic(context) ? "ar" : "en")
          .format(localDateTime);
    }
    // إذا كان أقدم من أسبوع
    else {
      return DateFormat('dd/MM/yyyy hh:mm a',
              ApplanuageCubit.isArabic(context) ? "ar" : "en")
          .format(localDateTime);
    }
  } catch (e) {
    // في حالة حدوث خطأ، أرجع النص الأصلي
    return createdAt;
  }
}
