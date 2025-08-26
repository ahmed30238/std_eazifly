import 'package:eazifly_student/core/component/custom_tapbar.dart';
import 'package:eazifly_student/core/component/icons_container.dart';
import 'package:eazifly_student/core/component/separated_widget.dart';
import 'package:eazifly_student/core/component/suffix_menu_form_field.dart';
import 'package:eazifly_student/presentation/controller/chats/chats_cubit.dart';
import 'package:eazifly_student/presentation/controller/chats/chats_state.dart';
import 'package:eazifly_student/presentation/view/chat/widgets/chat_item.dart';
import 'package:eazifly_student/presentation/view/chat/widgets/chat_item_shimmer.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ChatsView extends StatefulWidget {
  const ChatsView({super.key});

  @override
  State<ChatsView> createState() => _ChatsViewState();
}

class _ChatsViewState extends State<ChatsView>
    with SingleTickerProviderStateMixin {
  late final ChatsCubit cubit;
  bool _isInitialized = false;

  @override
  void initState() {
    cubit = ChatsCubit.get(context);
    cubit.initializeRecordVars();
    cubit.getMyChats();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      // هنا يمكن الوصول للـ context بأمان
      cubit.initController(this, context);
      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    // تحديد الـ tabs هنا في الـ build method
    final tabsList = _getTabs(context);

    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "الرسائل",
        leadingText: "مجتمعنا",
        leadingIcon: Icons.arrow_back_ios,
        onLeadinTap: () => Navigator.pop(context),
        isCenterTitle: true,
        customAction: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: IconsContainer(
              iconWidget: SvgPicture.asset(
                fit: BoxFit.scaleDown,
                Assets.iconsAdd,
              ),
            ),
          ),
        ],
        leadingCustomWidth: 100.w,
      ),
      body: ListView(
        children: [
          16.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const CustomTextFormField(
              hintText: "أكتب للبحث",
              prefixIconWidget: PrefixSearchFormField(),
              suffixIconWidget: SuffixMenuFormField(),
            ),
          ),
          16.ph,
          BlocBuilder<ChatsCubit, ChatsState>(
            builder: (BuildContext context, ChatsState state) {
              return CustomTabBar(
                controller: cubit.controller!,
                tabs: List.generate(
                  tabsList.length,
                  (index) {
                    bool isSelected = index == cubit.controller?.index;
                    return Text(
                      tabsList[index],
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 12,
                        color: isSelected
                            ? MainColors.primary
                            : MainColors.onSurfaceSecondary,
                      ),
                    );
                  },
                ),
              );
            },
          ),
          4.ph,
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) => SizedBox(
              height: 600.h,
              child: TabBarView(
                controller: cubit.controller,
                children: [
                  BlocBuilder(
                    builder: (context, state) {
                      // Handle different states explicitly
                      if (cubit.getMyChatsLoader) {
                        return const ChatItemShimmerList();
                      }

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
                                'Failed to load chats',
                                style: TextStyle(
                                  color: MainColors.surfaceVariant,
                                  fontSize: 16.sp,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              ElevatedButton(
                                onPressed: () => cubit.getMyChats(),
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        );
                      }

                      // Handle success state
                      if (!cubit.getMyChatsLoader &&
                          cubit.getMyChatsEntity != null) {
                        final chats = cubit.getMyChatsEntity?.data ?? [];

                        if (chats.isEmpty) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.chat_bubble_outline,
                                  size: 64,
                                  color: MainColors.surfaceVariant,
                                ),
                                SizedBox(height: 16.h),
                                Text(
                                  'No chats yet',
                                  style: TextStyle(
                                    color: MainColors.surfaceVariant,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        List instructorList = [];

                        if (cubit.controller?.index == 0) {
                          instructorList.addAll(
                            chats.where(
                              (element) =>
                                  element.participant1?.type == "Instructor" ||
                                  element.participant2?.type == "Instructor",
                            ),
                          );
                        }

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
                            var instructors =
                                chatItem.participant1?.type == "User"
                                    ? chatItem.participant2
                                    : chatItem.participant1;
                            return ChatItem(
                              isFirstChat: true,
                              lastMessageContent:
                                  chatItem.latestMessage?.message ?? "",
                              profileAvatar: instructors?.image ?? "",
                              name: "${instructors?.name}",
                              time: formatDate(
                                chatItem.createdAt ?? DateTime.now(),
                              ).substring(0, 10),
                              onTap: () {
                                cubit.fillCurrentInstructor(index);
                                cubit.hasMore = true;
                                Navigator.pushNamed(
                                  context,
                                  RoutePaths.dmViewPath,
                                  arguments: {
                                    "chatId": chatItem.latestMessage?.chatId
                                        ?.toString(),
                                  },
                                );
                              },
                            );
                          },
                        );
                      }

                      // Default loading state
                      return const ChatItemShimmerList();
                    },
                    bloc: cubit,
                  ), // end of instructors

                  // clients
                  BlocBuilder(
                    builder: (context, state) {
                      // Handle different states explicitly
                      if (cubit.getMyChatsLoader) {
                        return const ChatItemShimmerList();
                      }

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
                                'Failed to load chats',
                                style: TextStyle(
                                  color: MainColors.surfaceVariant,
                                  fontSize: 16.sp,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              ElevatedButton(
                                onPressed: () => cubit.getMyChats(),
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        );
                      }

                      // Handle success state
                      if (!cubit.getMyChatsLoader &&
                          cubit.getMyChatsEntity != null) {
                        final chats = cubit.getMyChatsEntity?.data ?? [];

                        if (chats.isEmpty) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.chat_bubble_outline,
                                  size: 64,
                                  color: MainColors.surfaceVariant,
                                ),
                                SizedBox(height: 16.h),
                                Text(
                                  'No chats yet',
                                  style: TextStyle(
                                    color: MainColors.surfaceVariant,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        List clientList = [];

                        if (cubit.controller?.index == 1) {
                          clientList = [];
                          clientList.addAll(
                            chats.where(
                                  (element) =>
                              element.participant1?.type == "Client" ||
                                  element.participant2?.type == "Client",
                            ),
                          );
                        }

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
                            var clients =
                                chatItem.participant1?.type == "Client"
                                    ? chatItem.participant1
                                    : chatItem.participant2;
                            return ChatItem(
                              isFirstChat: true,
                              lastMessageContent:
                                  chatItem.latestMessage?.message ?? "",
                              profileAvatar: clients?.image ?? "",
                              name: "${clients?.name}",
                              time: formatDate(
                                chatItem.createdAt ?? DateTime.now(),
                              ).substring(0, 10),
                              onTap: () {
                                cubit.fillCurrentClient(index);
                                cubit.hasMore = true;
                                Navigator.pushNamed(
                                  context,
                                  RoutePaths.dmViewPath,
                                  arguments: {
                                    "chatId": chatItem.latestMessage?.chatId
                                        ?.toString(),
                                  },
                                );
                              },
                            );
                          },
                        );
                      }

                      // Default loading state
                      return const ChatItemShimmerList();
                    },
                    bloc: cubit,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // دالة منفصلة لتحديد الـ tabs
  List<String> _getTabs(BuildContext context) {
    var lang = context.loc!;
    return [
      lang.professors,
      lang.appManagement,
    ];
  }
}
