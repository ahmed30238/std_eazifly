import 'package:eazifly_student/domain/entities/change_instructor/get_remaining_program_sessions_entity.dart';

class Session {
  final int id;
  final String start;
  final String end;

  Session({
    required this.id,
    required this.start,
    required this.end,
  });

  // تحويل إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'start': start,
      'end': end,
    };
  }
}

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

  Map<String, dynamic> toJson() {
    return {
      'reason_to_change_instructor_ids': reasonToChangeInstructorIds,
      'instructor_id': instructorId,
      'program_id': programId,
      'old_instructor_id': oldInstructorId,
      'user_id': userId,
      'sessions': sessions
          .map((session) => {
                "id": session.id,
                "start": session.start,
                "end": session.end,
              })
          .toList(),
    };
  }
}
