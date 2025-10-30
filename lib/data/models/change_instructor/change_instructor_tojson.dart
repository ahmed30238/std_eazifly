import 'package:eazifly_student/domain/entities/change_instructor/get_remaining_program_sessions_entity.dart';
import 'package:intl/intl.dart';

// النموذج الرئيسي لطلب تغيير المدرب
class ChangeInstructorTojson {
  final List<int> reasonToChangeInstructorIds;
  final int instructorId;
  final int programId;
  final int oldInstructorId;
  final int userId;
  final List<GetRemainigProgramSessionsDatumEntity> sessions;

  ChangeInstructorTojson({
    required this.reasonToChangeInstructorIds,
    required this.instructorId,
    required this.programId,
    required this.oldInstructorId,
    required this.userId,
    required this.sessions,
  });
  /*

    return {
      'program_id': programId,
      'instructor_id': instructorId,
      'appointments': appointments
          .map((appointment) => {
                "start": appointment.start != null
                    ? formatter.format(appointment.start!)
                    : null,
                "end": appointment.end != null
                    ? formatter.format(appointment.end!)
                    : null,
              })
          .toList(),
    };
   */

  Map<String, dynamic> toJson() {
    return {
      'reason_to_change_instructor_ids': reasonToChangeInstructorIds,
      'instructor_id': instructorId,
      'program_id': programId,
      'old_instructor_id': oldInstructorId,
      'user_id': userId,
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

final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
