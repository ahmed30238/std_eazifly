import 'package:eazifly_student/domain/entities/add_weekly_appointments_entity.dart';

class GetInstructorsTojson {
  final int programId;
  final List<AddWeeklyAppontmentsDatumEntity> appointments;

  GetInstructorsTojson({
    required this.programId,
    required this.appointments,
  });
  Map<String, dynamic> toJson() {
    return {
      'program_id': programId,
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