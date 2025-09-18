import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

import '../../../../core/component/separated_widget.dart';
import '../../../controller/chats/chats_cubit.dart';
import '../../../controller/chats/chats_state.dart';
import 'chat_item.dart';
import 'chat_item_shimmer.dart';

class ManagementTapWidget extends StatelessWidget {
  final ChatsCubit cubit;

  const ManagementTapWidget({super.key, required this.cubit});

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

        // Get chats data
        // final chats = cubit.getMyChatsEntity?.data ?? [];

        // Filter client chats
        List clientList = cubit.clientsList;
        // chats
        //     .where((element) => element.type == "group")
        //     .toList();

        // Show empty state for clients
        if (clientList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.people_outline,
                  size: 64,
                  color: MainColors.primary,
                ),
                SizedBox(height: 16.h),
                Text(
                  lang.noMessagesWithClients,
                  style: MainTextStyle.boldTextStyle(
                    color: MainColors.primary,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8.h),
                GestureDetector(
                  onTap: () {

                  },
                  child: Text(
                    lang.startConversationWithClients,
                    style: TextStyle(
                      color: MainColors.primary.withValues(alpha: 0.7),
                      fontSize: 14.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        }

        // Show client chats
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: clientList.length,
          separatorBuilder: (context, index) {
            return SeparatedWidget(
              dividerColor: MainColors.surfaceVariant,
              verticalPadding: 8.h,
            );
          },
          itemBuilder: (context, index) {
            var chatItem = clientList[index];

            var clients = chatItem.participant1?.type == "Client"
                ? chatItem.participant1
                : chatItem.participant2;
            return ChatItem(
              // isFirstChat: true,
              lastMessageContent: chatItem.latestMessage?.message ?? "",
              profileAvatar: clients?.image ?? "",
              name: "إدارة التطبيق",
              time: formatDate(
                chatItem.createdAt ?? DateTime.now(),
              ).substring(0, 10),
              onTap: () {
                cubit.fillCurrentGroupChatId(chatItem.latestMessage?.chatId);
                // cubit.fillCurrentClient(index);
                cubit.hasMore = true;
                Navigator.pushNamed(
                  context,
                  RoutePaths.dmViewPath,
                  arguments: {
                    "chatId": chatItem.latestMessage?.chatId?.toString(),
                  },
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
