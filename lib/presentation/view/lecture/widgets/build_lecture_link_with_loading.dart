import 'dart:developer';

import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_state.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/lecture_link_item.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/lecture_state_helper.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/lecture_stats_row.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

  Widget buildLectureLinkWithLoading(BuildContext context,LectureCubit cubit, LectureState state,int programId) {
    var programData = cubit.showProgramDetailsEntity?.data;

    // if (programData == null) {
    //   return buildLoadingContainer(width: 226.w, height: 80.h);
    // }

    var lectureState = LectureStateHelper.getLectureState(
      nextSession: programData?.nextSession?.sessionDatetime?.toString(),
      nextSessionDuration:
          int.tryParse(programData?.nextSession?.duration ?? "0"),
    );

    return LectureLink(
      programId: programId,
      width: 226.w,
      state: lectureState,
      onLinkTap: lectureState == LectureStatesEnum.ongoing
          ? () {
              // TODO call join session before this. in Program Cubit
              final meetingUrl = programData?.nextSession?.meetingUrl;
              if (meetingUrl != null && meetingUrl.isNotEmpty) {
                openUrl(meetingUrl);
              } else {
                delightfulToast(
                    message: "رابط الاجتماع غير متوفر", context: context);
              }
            }
          : () {
              delightfulToast(message: "لم تبدأ بعد", context: context);
              log("لم تبدأ بعد");
            },
    );
  }