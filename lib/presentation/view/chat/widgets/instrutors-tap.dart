import 'dart:developer';

import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

import '../../../../core/component/separated_widget.dart';
import '../../../../domain/entities/chat/get_my_chats_entity.dart';
import '../../../controller/chats/chats_cubit.dart';
import '../../../controller/chats/chats_state.dart';
import 'chat_item.dart';
import 'chat_item_shimmer.dart';

class InstructorsTapWidget extends StatelessWidget {
  final ChatsCubit cubit;

  const InstructorsTapWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return BlocBuilder(
      builder: (context, state) {
        // Handle loading state
        if (cubit.getMyChatsLoader) {
          return const ChatItemShimmerList();
        }

        // Handle error state
        if (state is GetMyChatsErrorState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64,
                  color: MainColors.surfaceVariant,
                ),
                SizedBox(height: 16.h),
                Text(
                  lang.failedToLoadMessages,
                  style: TextStyle(
                    color: MainColors.surfaceVariant,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                ElevatedButton(
                  onPressed: () => cubit.getMyChats(),
                  child: Text(lang.retry),
                ),
              ],
            ),
          );
        }

        final chats = cubit.getMyChatsEntity?.data ?? [];

        // Filter instructor chats
        List<GetMyChatsDatumEntity> instructorList = cubit.instructorList;

        // chats
        //     .where((element) => element.type == "private")
        //     .toList();

        // Show empty state for instructors
        if (instructorList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.school_outlined,
                  size: 64,
                  color: MainColors.surfaceVariant,
                ),
                SizedBox(height: 16.h),
                Text(
                  lang.noMessagesWithInstructors,
                  style: TextStyle(
                    color: MainColors.primary,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  lang.startConversationWithInstructors,
                  style: TextStyle(
                    color: MainColors.surfaceVariant.withValues(alpha: 0.7),
                    fontSize: 14.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        // Show instructor chats
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: instructorList.length,
          separatorBuilder: (context, index) {
            return SeparatedWidget(
              dividerColor: MainColors.surfaceVariant,
              verticalPadding: 8.h,
            );
          },
          itemBuilder: (context, index) {
            var chatItem = instructorList[index];
            var instructors = chatItem.participant1?.type == "User"
                ? chatItem.participant2
                : chatItem.participant1;
            return ChatItem(
              // isFirstChat: true,
              lastMessageContent: chatItem.latestMessage?.message ?? "",
              profileAvatar: instructors?.image ?? "",
              name: "${instructors?.name}",
              time: formatDate(
                chatItem.createdAt ?? DateTime.now(),
              ).substring(0, 10),
              onTap: () {
                int chatId = chatItem.id ?? 0;
                cubit.fillCurrentInstructor(chatId);
                log("Chat ID is: $chatId");
                cubit.hasMore = true;
                Navigator.pushNamed(
                  context,
                  RoutePaths.dmViewPath,
                  arguments: {"chatId": chatId.toString()},
                );
              },
            );
          },
        );
      },
      bloc: cubit,
    );
  }
}
