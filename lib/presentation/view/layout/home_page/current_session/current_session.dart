// ignore_for_file: unrelated_type_equality_checks

import 'dart:developer';

import 'package:eazifly_student/core/component/nested_avatar_container.dart';
import 'package:eazifly_student/presentation/controller/chats/chats_cubit.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/lecture_stats_row.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:google_fonts/google_fonts.dart';

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
                    color: MainColors.veryLightGrayFormField,
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
                                fontSize: 11, color: MainColors.grayTextColors),
                          ),
                          10.5.ph,
                          Text(
                            title,
                            style: MainTextStyle.boldTextStyle(
                                fontSize: 12, color: MainColors.blackText),
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
                  statusContainerColor: MainColors.lightblue,
                  statusTextColor: MainColors.blueTextColor,
                  nextLecture: "${item?.sessionTime?.substring(0, 5)}",
                  onRejoinTap: () {},
                  duration: "${item?.duration} دقيقة",
                  titleText: const [
                    "المحاضرة التالية",
                    "مدة الجلسة",
                    "حالة الجلسة"
                  ],
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
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: index == 1 ? 7.w : 0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: index == 2 ? 12.w : 0,
                          ),
                          height: 78.h,
                          width: 109.w,
                          decoration: BoxDecoration(
                            borderRadius: 10.cr,
                            color: MainColors.veryLightGrayFormField,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: index == 2
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.center,
                            children: [
                              Text(
                                stdTitleList[index],
                                style: MainTextStyle.boldTextStyle(
                                  fontSize: 12,
                                  color: MainColors.grayTextColors,
                                ),
                              ),
                              index == 0
                                  ? (item!.users!.length != 1)
                                      ? NestedAvatarContainer(
                                          noOfItems: item.users!.length,
                                          alignment: MainAxisAlignment.center,
                                          image: (item.users
                                                  ?.map(
                                                      (e) => e.userImage ?? "")
                                                  .toList()) ??
                                              [],
                                          number:
                                              item.users?.length.toString() ??
                                                  "0",
                                          textColors: MainColors.blackText,
                                          areaHeigt: 26.h,
                                          areaWidth: 52.w,
                                          avatarHeigt: 24.h,
                                          avatarWidth: 24.w,
                                        )
                                      : SizedBox(
                                          width: 100.w,
                                          child: Text(
                                            "${item.users?.first.userName}",
                                            maxLines: 1,
                                            overflow: TextOverflow.visible,
                                            style: MainTextStyle.boldTextStyle(
                                              fontSize: 10,
                                              plusJakartaSans: true,
                                            ),
                                          ),
                                        )
                                  : index == 1
                                      ? Text(
                                          "عبر تطبيق زوم",
                                          style: MainTextStyle.boldTextStyle(
                                            fontSize: 12,
                                            color: MainColors.blackText,
                                          ),
                                        )
                                      : Text(
                                          "Zoom Link",
                                          style: GoogleFonts.inter(
                                              color: MainColors.blueTextColor,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationColor:
                                                  MainColors.blueTextColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
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
                            color: MainColors.red,
                          ),
                        ),
                      )
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
                      color: MainColors.blueTextColor,
                      radius: 16.r,
                      text: "التوجهة الي المحاضرة",
                      onPressed: () {
                        if (item?.status?.key == "started") {
                          cubit.joinSession(sessionId: item?.id ?? 0).then(
                            (value) {
                              openUrl(item?.meetingUrl ?? "");
                            },
                          );
                        }
                      },
                    ),
                    8.pw,
                    CustomElevatedButton(
                      height: 45.h,
                      width: 138.w,
                      color: MainColors.white,
                      textColor: MainColors.blueTextColor,
                      borderColor: MainColors.blueTextColor,
                      radius: 16.r,
                      text: "تواصل مع المعلم",
                      textSize: 14,
                      onPressed: () async {
                        await cubit.checkChat();
                        var checkChatData = cubit.checkChatEntity?.data;
                        if (checkChatData == null) {
                          return;
                        }
                        log("chat id is ${checkChatData.latestMessage?.chatId.toString()}");
                        var chatsCubit = context.read<ChatsCubit>();
                        await chatsCubit.getMyChats();
                        await chatsCubit.fillCurrentInstructor(
                          chatsCubit.getMyChatsEntity?.data != null
                              ? chatsCubit.getMyChatsEntity!.data!.indexWhere(
                                  (element) =>
                                      element.participant1?.id ==
                                      checkChatData.participant1?.id,
                                )
                              : -1,
                        );

                        Future.delayed(
                          const Duration(milliseconds: 100),
                          () {
                            Navigator.pushNamed(
                              context,
                              arguments: {
                                "cubit": context.read<ChatsCubit>(),
                                "chatId": checkChatData.id?.toString() ?? "0",
                              },
                              RoutePaths.dmViewPath,
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
