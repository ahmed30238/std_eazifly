import 'dart:developer';

import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/lecture_history_view/widgets/lecture_history_details.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class LectureHistoryView extends StatefulWidget {
  const LectureHistoryView({super.key});

  @override
  State<LectureHistoryView> createState() => _LectureHistoryViewState();
}

class _LectureHistoryViewState extends State<LectureHistoryView> {
  late int programId;
  late LectureCubit lectureCubit;
  late MyProgramsCubit myProgramsCubit;

  @override
  void initState() {
    lectureCubit = context.read<LectureCubit>();
    myProgramsCubit = context.read<MyProgramsCubit>();

    programId = lectureCubit.currentProgramId;
    log("program id is $programId");

    // myProgramsCubit.getAssignedChildrenToProgram(programId: programId);
    // lectureCubit.getProgramSessions(
    //   programId: programId,
    //   userId: lectureCubit.userId,
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "تاريخ المحاضرات",
        leadingText: lang.back,
        isCenterTitle: true,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          16.ph,
          // Program Details Container with Loading State
          BlocBuilder(
            bloc: myProgramsCubit,
            builder: (context, state) {
              bool isLoadingProgramDetails =
                  myProgramsCubit.getAssignedChildrenLoader ||
                  myProgramsCubit.getAssignedChildrenToProgramEntity?.data ==
                      null;

              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                height: 74.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: 12.cr,
                  color: MainColors.inputFill,
                ),
                child: isLoadingProgramDetails
                    ? const Center(child: CircularProgressIndicator.adaptive())
                    : Row(
                        children: [
                          Padding(
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
                                    lectureCubit
                                            .showProgramDetailsEntity
                                            ?.data
                                            ?.title ??
                                        "no title",
                                    style: MainTextStyle.boldTextStyle(
                                      fontSize: 12,
                                      color: MainColors.onSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          20.pw,
                          BlocBuilder(
                            bloc: myProgramsCubit,
                            builder: (context, state) {
                              String? expireDate = myProgramsCubit
                                  .getAssignedChildrenToProgramEntity
                                  ?.data?[lectureCubit.currentUserIndex]
                                  .expireDate
                                  .toString();

                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 13.5.h),
                                child: SizedBox(
                                  height: 50.h,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "موعد تجديد الإشتراك",
                                        style: MainTextStyle.boldTextStyle(
                                          fontSize: 11,
                                          color: MainColors.onSurfaceSecondary,
                                        ),
                                      ),
                                      4.ph,
                                      TextedContainer(
                                        width: 85.w,
                                        height: 26.h,
                                        text:
                                            expireDate?.substring(0, 10) ?? "",
                                        containerColor: MainColors.onError,
                                        textColor: MainColors.error,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
              );
            },
          ),
          16.ph,
          // Sessions Container with Loading State
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            width: double.infinity,
            constraints: BoxConstraints(minHeight: 198.h),
            decoration: BoxDecoration(color: MainColors.inputFill),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.ph,
                Text(
                  "تاريخ المحاضرات",
                  style: MainTextStyle.boldTextStyle(fontSize: 14),
                ),
                12.ph,
                BlocBuilder(
                  bloc: lectureCubit,
                  builder: (context, state) {
                    var sessions = lectureCubit.getProgramSessionsEntity?.data;
                    bool isLoadingSessions =
                        lectureCubit.getProgramSessionsLoader ||
                        lectureCubit.getProgramSessionsEntity?.data == null;

                    if (isLoadingSessions) {
                      return SizedBox(
                        height: 200.h,
                        child: const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      );
                    }

                    if (sessions == null || sessions.isEmpty) {
                      return SizedBox(
                        height: 150.h,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.event_note,
                                size: 48.sp,
                                color: MainColors.onSurfaceSecondary,
                              ),
                              16.ph,
                              Text(
                                "لا توجد محاضرات متاحة",
                                style: MainTextStyle.boldTextStyle(
                                  fontSize: 14,
                                  color: MainColors.onSurfaceSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    return SizedBox(
                      height: sessions.length * 155.h,
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var session = sessions[index];
                          return LectureHistoryDetails(
                            title: session.programTitle ?? "",
                            index: index,
                            sessionDate:
                                session.sessionDatetime
                                    ?.toIso8601String()
                                    .substring(0, 10) ??
                                "",
                            sessionDuration: session.duration ?? "",
                            sessionTime:
                                "${session.sessionTime?.substring(0, 5)} الي ${session.sessionTimeTo?.substring(0, 5)}",
                            status: session.status?.label ?? "",
                          );
                        },
                        separatorBuilder: (context, index) => 8.ph,
                        itemCount: sessions.length,
                      ),
                    );
                  },
                ),
                16.ph,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
