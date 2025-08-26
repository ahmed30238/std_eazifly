 import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/lecture_state_helper.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/lecture_stats_row.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

  Widget buildLectureStatsWithLoading(LectureCubit cubit) {
    var programData = cubit.showProgramDetailsEntity?.data;

    // if (programData == null) {
    //   return buildLoadingContainer(height: 120.h);
    // }

    // تحديد حالة المحاضرة
    LectureStatesEnum lectureState = LectureStateHelper.getLectureState(
      nextSession: programData?.nextSession?.sessionDatetime.toString(),
      nextSessionDuration:
          int.tryParse(programData?.nextSession?.duration ?? "0"),
    );

    // حساب الوقت المتبقي/المنقضي
    String timeDifference = LectureStateHelper.getTimeDifference(
      nextSession: programData?.nextSession?.sessionDatetime?.toString(),
      nextSessionDuration:
          int.tryParse(programData?.nextSession?.duration ?? "0"),
    );

    return LectureStats(
      status: lectureState,
      reJoin: lectureState == LectureStatesEnum.ongoing,
      onRejoinTap: () {
        // كود إعادة الدخول
      },
      nextLecture: programData?.nextSession?.sessionDatetime
              ?.toString()
              .substring(0, 10) ??
          "غير محدد",
      duration: programData?.nextSession?.duration != null
          ? "${programData?.nextSession?.duration} دقيقة"
          : "غير محدد",
      timeDiff: timeDifference,
      titleText: const ["المحاضرة التالية", "مدة الجلسة", "حالة الجلسة"],
    );
  }