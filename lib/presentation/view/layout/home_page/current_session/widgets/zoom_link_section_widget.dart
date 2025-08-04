// zoom_link_section_widget.dart
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/domain/entities/home/get_home_current_session_entity.dart';
import 'package:eazifly_student/presentation/controller/home_controller/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      onTap: () => _handleZoomLinkTap(context),
      child: Text(
        "Zoom Link",
        style: GoogleFonts.inter(
          color: MainColors.blueTextColor,
          decoration: TextDecoration.underline,
          decorationColor: MainColors.blueTextColor,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  void _handleZoomLinkTap(BuildContext context) {
    final isSessionStarted = sessionData.status?.key == "started";
    
    if (isSessionStarted) {
      _joinSession();
    } else {
      _showSessionNotStartedMessage(context);
    }
  }

  void _joinSession() {
    cubit.joinSession(sessionId: sessionData.id ?? 0).then(
      (value) {
        openUrl(sessionData.meetingUrl ?? "");
      },
    );
  }

  void _showSessionNotStartedMessage(BuildContext context) {
    delightfulToast(
      message: "لم يحن موعد المحاضرة بعد",
      context: context,
    );
  }
}