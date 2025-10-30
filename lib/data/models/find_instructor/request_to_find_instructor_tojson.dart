import 'package:eazifly_student/data/models/change_instructor/change_instructor_tojson.dart';
import 'package:eazifly_student/domain/entities/change_instructor/get_remaining_program_sessions_entity.dart';

class RequestToFindInstructorTojson {
  final String programId;
  final String contentId;
  final String userId;
  final List<GetRemainigProgramSessionsDatumEntity> sessions;

  RequestToFindInstructorTojson({
    required this.sessions,
    required this.userId,
    required this.contentId,
    required this.programId,
  });
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'program_id': programId,
      'content_id': contentId,
      'sessions': sessions
          .map(
            (session) => {
              "start": session.start != null
                  ? formatter.format(session.start!)
                  : null,
              "end": session.end != null
                  ? formatter.format(session.end!)
                  : null,
            },
          )
          .toList(),
    };
  }
}
