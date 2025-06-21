import 'package:eazifly_student/core/component/custom_tapbar.dart';
import 'package:eazifly_student/core/component/icons_container.dart';
import 'package:eazifly_student/core/component/suffix_menu_form_field.dart';
import 'package:eazifly_student/presentation/controller/chats/chats_cubit.dart';
import 'package:eazifly_student/presentation/controller/chats/chats_state.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ChatsView extends StatefulWidget {
  const ChatsView({super.key});

  @override
  State<ChatsView> createState() => _ChatsViewState();
}

class _ChatsViewState extends State<ChatsView>
    with SingleTickerProviderStateMixin {
  late final ChatsCubit cubit;
  @override
  void initState() {
    cubit = ChatsCubit.get(context);
    cubit.initializeRecordVars();
    // cubit.getMyStudents();
    cubit.initController(this, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  cubit.tabs(context: context).length,
                  (index) {
                    bool isSelected = index == cubit.controller?.index;
                    return Text(
                      cubit.tabs(context: context)[index],
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 12,
                        color: isSelected
                            ? MainColors.blueTextColor
                            : MainColors.grayTextColors,
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
                  CustomElevatedButton(
                    text: "text",
                    onPressed: () {
                      cubit.sendMessages();
                    },
                    color: MainColors.blueTextColor,
                  ),
                  CustomElevatedButton(
                    text: "text",
                    onPressed: () {
                      cubit.getMessages(
                        chatId: "2",
                        isInitial: true,
                        showLoader: true
                      );
                    },
                    color: MainColors.blueTextColor,
                  ),
                  // BlocBuilder(
                  //   builder: (context, state) => cubit.studentsEntities != null
                  //       ? ListView.separated(
                  //           physics: const BouncingScrollPhysics(),
                  //           itemCount:
                  //               cubit.studentsEntities?.data?.length ?? 0,
                  //           separatorBuilder: (context, index) =>
                  //               SeparatedWidget(
                  //             dividerColor: MainColors.lightGray,
                  //             verticalPadding: 8.h,
                  //           ),
                  //           itemBuilder: (context, index) {
                  //             var user =
                  //                 cubit.studentsEntities?.data?[index].student;
                  //             return ChatItem(
                  //               isFirstChat: true,
                  //               lastMessageContent: "",
                  //               profileAvatar: user?.image ?? "",
                  //               name: "${user?.firstName} ${user?.lastName}",
                  //               time: "",
                  //               onTap: () {
                  //                 cubit.fillCurrentStudent(index);
                  //                 Navigator.pushNamed(
                  //                   arguments: {
                  //                     "chatId": cubit
                  //                         .getOldChatsEntities?.data?[index].id
                  //                         .toString(),
                  //                   },
                  //                   context,
                  //                   RoutePaths.dmViewPath,
                  //                 );
                  //               },
                  //             );
                  //           },
                  //         )
                  //       : const ChatItemShimmerList(),
                  //   bloc: cubit,
                  // ),
                  // const Text("data"),
                  const Text("data"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
