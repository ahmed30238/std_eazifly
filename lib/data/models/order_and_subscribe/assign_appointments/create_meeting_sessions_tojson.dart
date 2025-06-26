import 'package:eazifly_student/domain/entities/add_weekly_appointments_entity.dart';

class CreateMeetingSessionsTojson {
  final int programId;
  final int instructorId;
  final int userId;
  final int programContentId;
  final List<AddWeeklyAppontmentsDatumEntity> appointments;

  CreateMeetingSessionsTojson({
    required this.programId,
    required this.instructorId,
    required this.userId,
    required this.programContentId,
    required this.appointments,
  });

  Map<String, dynamic> toJson() {
    return {
      'program_id': programId,
      'instructor_id': instructorId,
      'user_id': userId,
      'program_content_id': programContentId,
      'appointments': appointments.map((appointment) {
        {
          return {
            'start': appointment.start,
            'end': appointment.end,
          };
        }
      }).toList(),
    };
  }
}
