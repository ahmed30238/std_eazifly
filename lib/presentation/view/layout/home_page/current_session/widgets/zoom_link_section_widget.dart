import 'package:eazifly_student/domain/entities/home/get_home_current_session_entity.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../lecture/widgets/lecture_state_helper.dart';

class ZoomLinkSectionWidget extends StatelessWidget {
  final GetHomeCurrentSessionData sessionData;
  final HomeCubit cubit;

  const ZoomLinkSectionWidget({
    super.key,
    required this.sessionData,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final sessionStartTime = sessionData.sessionDatetime;
        final duration = int.tryParse(sessionData.duration ?? "0") ?? 0;
        final sessionId = sessionData.id ?? 0;
        final meetingUrl = sessionData.meetingUrl;

        var lectureState = LectureStateHelper.getLectureState(
          nextSession: sessionData.sessionDatetime.toString(),
          nextSessionDuration: int.tryParse(sessionData.duration ?? "0"),
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
      child: Text(
        "Zoom Link",
        style: GoogleFonts.inter(
          color: MainColors.primary,
          decoration: TextDecoration.underline,
          decorationColor: MainColors.primary,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // void _handleZoomLinkTap(BuildContext context) {
  //   final isSessionStarted = sessionData.status?.key == "started";
  //
  //   if (isSessionStarted) {
  //     _joinSession();
  //   } else {
  //     _showSessionNotStartedMessage(context);
  //   }
  // }

  // void _joinSession() {
  //   cubit.joinSession(sessionId: sessionData.id ?? 0).then((value) {
  //     openUrl(sessionData.meetingUrl ?? "");
  //   });
  // }
  //
  // void _showSessionNotStartedMessage(BuildContext context) {
  //   delightfulToast(message: "لم يحن موعد المحاضرة بعد", context: context);
  // }
}
