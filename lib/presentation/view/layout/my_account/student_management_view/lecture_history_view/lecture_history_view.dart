import 'dart:developer';

import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/lecture_history_view/widgets/lecture_history_details.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class Lecturehistoryview extends StatefulWidget {
  const Lecturehistoryview({super.key});

  @override
  State<Lecturehistoryview> createState() => _LecturehistoryviewState();
}

class _LecturehistoryviewState extends State<Lecturehistoryview> {
  late int programId;
  late LectureCubit lectureCubit;
  @override
  void initState() {
    lectureCubit = context.read<LectureCubit>();
    programId = context.read<LectureCubit>().currentProgramId;
    log("program id is $programId");

    lectureCubit.showProgramDetails(programId: programId);
    lectureCubit.getProgramSessions(
      programId: programId,
      userId: lectureCubit.userId,
    );
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
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                16.ph,
                // Program Details Container with Loading State
                BlocBuilder(
                  bloc: lectureCubit,
                  builder: (context, state) {
                    bool isLoadingProgramDetails =
                        lectureCubit.showProgramDetailsLoader ||
                            lectureCubit.showProgramDetailsEntity?.data == null;

                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      height: 74.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: 12.cr,
                        color: MainColors.veryLightGrayFormField,
                      ),
                      child: isLoadingProgramDetails
                          ? const Center(
                              child: CircularProgressIndicator.adaptive(),
                            )
                          : Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12.h),
                                  child: SizedBox(
                                    width: 216.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "إسم البرنامج",
                                          style: MainTextStyle.boldTextStyle(
                                              fontSize: 11,
                                              color: MainColors.grayTextColors),
                                        ),
                                        10.5.ph,
                                        Text(
                                          lectureCubit.showProgramDetailsEntity
                                                  ?.data?.title ??
                                              "",
                                          style: MainTextStyle.boldTextStyle(
                                            fontSize: 12,
                                            color: MainColors.blackText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                20.pw,
                                BlocBuilder(
                                  bloc: lectureCubit,
                                  builder: (context, state) {
                                    DateTime expireDate = context
                                            .read<LectureCubit>()
                                            .showProgramDetailsEntity
                                            ?.data
                                            ?.expireDate ??
                                        DateTime.now();
                                    // var diff = formatTimeDifference(expireDate);
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 13.5.h,
                                      ),
                                      child: SizedBox(
                                        height: 50.h,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "موعد تجديد الإشتراك",
                                              style:
                                                  MainTextStyle.boldTextStyle(
                                                fontSize: 11,
                                                color:
                                                    MainColors.grayTextColors,
                                              ),
                                            ),
                                            4.ph,
                                            TextedContainer(
                                              width: 85.w,
                                              height: 26.h,
                                              text: expireDate.toString(),
                                              containerColor:
                                                  MainColors.lightRed,
                                              textColor: MainColors.red,
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
                  constraints: BoxConstraints(
                    minHeight: 198.h,
                  ),
                  decoration: BoxDecoration(
                    color: MainColors.veryLightGrayFormField,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      16.ph,
                      Text(
                        "تاريخ المحاضرات",
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 14,
                        ),
                      ),
                      12.ph,
                      BlocBuilder(
                        bloc: lectureCubit,
                        builder: (context, state) {
                          var sessions =
                              lectureCubit.getProgramSessionsEntity?.data;
                          bool isLoadingSessions =
                              lectureCubit.getProgramSessionsLoader ||
                                  lectureCubit.getProgramSessionsEntity?.data ==
                                      null;

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
                                      color: MainColors.grayTextColors,
                                    ),
                                    16.ph,
                                    Text(
                                      "لا توجد محاضرات متاحة",
                                      style: MainTextStyle.boldTextStyle(
                                        fontSize: 14,
                                        color: MainColors.grayTextColors,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }

                          return SizedBox(
                            height: sessions.length * 155,
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                var session = sessions[index];
                                return LectureHistoryDetails(
                                  title: session.programTitle ?? "",
                                  index: index,
                                  sessionDate: session.sessionDatetime
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
