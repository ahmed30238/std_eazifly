import 'package:eazifly_student/presentation/view/lecture/widgets/lecture_link_item.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/lecture_state_helper.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

import '../../../controller/my_programs/myprograms_cubit.dart';

Widget buildLectureLinkWithLoading(
  BuildContext context,
  MyProgramsCubit cubit,
  int programId,
  int index,
  String host,
) {
  var programData = cubit.getAssignedChildrenToProgramEntity?.data?[index];

  var lectureState = LectureStateHelper.getLectureState(
    nextSession: programData?.nextSession?.sessionDatetime?.toString(),
    nextSessionDuration: int.tryParse(
      programData?.nextSession?.duration ?? "0",
    ),
  );

  return LectureLink(
    host: host,
    programId: programId,
    width: 226.w,
    state: lectureState,
    onLinkTap: () async {
      final nextSession = programData?.nextSession;
      final sessionStartTime = nextSession?.sessionDatetime;
      final duration = int.tryParse(nextSession?.duration ?? "0") ?? 0;
      final sessionId = programData?.nextSession?.id ?? 0;
      final meetingUrl = programData?.nextSession?.meetingUrl;

      await handleJoinSession(
        context: context,
        cubit: cubit,
        sessionId: sessionId,
        meetingUrl: meetingUrl,
        sessionStartTime: sessionStartTime,
        duration: duration,
        lectureState: lectureState,
      );
    },
  );
}
