// ignore_for_file: unrelated_type_equality_checks

import 'dart:developer';

import 'package:eazifly_student/presentation/controller/chats/chats_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/home_page/current_session/widgets/session_cards_widget.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/lecture_stats_row.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

import '../../../../controller/chats/chats_state.dart';
import '../../../../controller/my_programs/myprograms_cubit.dart';
import '../../../lecture/widgets/lecture_state_helper.dart';

class CurrentSession extends StatefulWidget {
  const CurrentSession({super.key});

  @override
  State<CurrentSession> createState() => _CurrentSessionState();
}

class _CurrentSessionState extends State<CurrentSession> {
  late HomeCubit cubit;

  @override
  void initState() {
    cubit = context.read<HomeCubit>();
    super.initState();
    cubit.getHomeCurrentSession();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight.w),
        child: BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            if (cubit.getHomeCurrentSessionEntity == null) {
              return const Center(child: CircularProgressIndicator());
            }
            String title =
                cubit.getHomeCurrentSessionEntity?.data?.programTitle ?? "";
            return CustomAppBar(
              context,
              mainTitle: title,
              leadingText: "المواعيد",
              isCenterTitle: true,
            );
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            16.ph,
            BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                if (cubit.getHomeCurrentSessionLoader ||
                    cubit.getHomeCurrentSessionEntity == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                String title =
                    cubit.getHomeCurrentSessionEntity?.data?.programTitle ?? "";
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  height: 78.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: 12.cr,
                    color: MainColors.inputFill,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: SizedBox(
                      width: 216.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "إسم البرنامج",
                            style: MainTextStyle.boldTextStyle(
                              fontSize: 11,
                              color: MainColors.onSurfaceSecondary,
                            ),
                          ),
                          10.5.ph,
                          Text(
                            title,
                            style: MainTextStyle.boldTextStyle(
                              fontSize: 12,
                              color: MainColors.onSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            8.ph,
            BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                if (cubit.getHomeCurrentSessionLoader ||
                    cubit.getHomeCurrentSessionEntity == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                var item = cubit.getHomeCurrentSessionEntity?.data;
                log("key: ${item?.status?.key}");
                return LectureStats(
                  horizontalPadding: 0,
                  status: LectureStatesEnum.pending,
                  reJoin: item?.status?.key == "started",
                  statusLabel: item?.status?.label,
                  statusContainerColor: MainColors.surface,
                  statusTextColor: MainColors.primary,
                  nextLecture: "${item?.sessionTime?.substring(0, 5)}",
                  onRejoinTap: () {},
                  duration: "${item?.duration} دقيقة",
                  titleText: const [
                    "المحاضرة التالية",
                    "مدة الجلسة",
                    "حالة الجلسة",
                  ],
                );
              },
            ),
            8.ph,
            SessionCardsWidget(cubit: cubit, stdTitleList: stdTitleList),
            24.ph,
            BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                var item = cubit.getHomeCurrentSessionEntity?.data;
                if (item?.status?.key == "started") {
                  return Row(
                    children: [
                      SvgPicture.asset(
                        height: 24.h,
                        width: 24.w,
                        Assets.iconsRejectRequest,
                        fit: BoxFit.scaleDown,
                      ),
                      4.pw,
                      Expanded(
                        child: Text(
                          "انت متاخر  علي المحاضرة قم بالتوجة الي المحاضرة بالضغط علي الرابط المرفق",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 12,
                            color: MainColors.onError,
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return 0.ph;
                }
              },
            ),
            const Spacer(),
            BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                var item = cubit.getHomeCurrentSessionEntity?.data;

                return Row(
                  children: [
                    CustomElevatedButton(
                      height: 48.h,
                      width: 196.w,
                      color: MainColors.primary,
                      radius: 16.r,
                      text: "التوجهة الي المحاضرة",
                      onPressed: () {
                        final sessionStartTime = item?.sessionDatetime;
                        final duration =
                            int.tryParse(item?.duration ?? "0") ?? 0;
                        final sessionId = item?.id ?? 0;
                        final meetingUrl = item?.meetingUrl;

                        var lectureState = LectureStateHelper.getLectureState(
                          nextSession: item?.sessionDatetime.toString(),
                          nextSessionDuration: int.tryParse(
                            item?.duration ?? "0",
                          ),
                        );
                        handleJoinSession(
                          context: context,
                          cubit: context.read<MyProgramsCubit>(),
                          sessionId: sessionId,
                          meetingUrl: meetingUrl,
                          sessionStartTime: sessionStartTime,
                          duration: duration,
                          lectureState: lectureState,
                        );
                      },
                    ),
                    8.pw,
                    BlocConsumer<HomeCubit, HomeState>(
                      listener: (context, state) {},
                      builder: (context, homeState) {
                        return BlocSelector<ChatsCubit, ChatsState, bool>(
                          selector: (state) =>
                              context.read<ChatsCubit>().getMyChatsLoader,
                          builder: (context, isChatsLoading) {
                            bool loader =
                                isChatsLoading || cubit.checkChatLoader;
                            return CustomElevatedButton(
                              height: 45.h,
                              width: 138.w,
                              color: MainColors.background,
                              textColor: MainColors.primary,
                              borderColor: MainColors.primary,
                              radius: 16.r,
                              text: "تواصل مع المعلم",
                              textSize: 14,
                              onPressed: loader
                                  ? () {}
                                  : () async {
                                      await cubit.checkChat();
                                      var checkChatData =
                                          cubit.checkChatEntity?.data;
                                      if (checkChatData == null) {
                                        return;
                                      }
                                      log(
                                        "chat id is ${checkChatData.latestMessage?.chatId.toString()}",
                                      );
                                      var chatsCubit = context
                                          .read<ChatsCubit>();
                                      await chatsCubit.getMyChats();
                                      await chatsCubit.fillCurrentInstructor(
                                        chatsCubit.getMyChatsEntity?.data !=
                                                null
                                            ? chatsCubit.getMyChatsEntity!.data!
                                                  .indexWhere((element) {
                                                    if (element
                                                            .participant1
                                                            ?.type ==
                                                        "Instructor") {
                                                      return element
                                                              .participant1
                                                              ?.id ==
                                                          checkChatData
                                                              .participant1
                                                              ?.id;
                                                    } else {
                                                      return element
                                                              .participant2
                                                              ?.id ==
                                                          checkChatData
                                                              .participant2
                                                              ?.id;
                                                    }
                                                  })
                                            : -1,
                                      );
                                      log("this is instructor name ${chatsCubit.currentInstructor?.name}");

                                      Future.delayed(
                                        const Duration(milliseconds: 150),
                                        () {
                                          Navigator.pushNamed(
                                            context,
                                            arguments: {
                                              "cubit": chatsCubit,
                                              "chatId":
                                                  checkChatData.id
                                                      ?.toString() ??
                                                  "0",
                                            },
                                            RoutePaths.dmViewPath,
                                          );
                                        },
                                      );
                                    },
                              child: loader
                                  ? const CircularProgressIndicator.adaptive()
                                  : null,
                            );
                          },
                        );
                      },
                    ),
                  ],
                );
              },
            ),
            32.ph,
          ],
        ),
      ),
    );
  }
}

var stdTitleList = ["الطلاب الاخرين", "بينات المحاضرة", "الرابط"];
