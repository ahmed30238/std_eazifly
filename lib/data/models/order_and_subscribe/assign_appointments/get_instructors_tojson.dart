import 'package:eazifly_student/domain/entities/add_weekly_appointments_entity.dart';
import 'package:intl/intl.dart';

class GetInstructorsTojson {
  final int programId;
  final int? instructorId;
  final List<AddWeeklyAppontmentsDatumEntity> appointments;

  GetInstructorsTojson({
    this.instructorId,
    required this.programId,
    required this.appointments,
  });

  Map<String, dynamic> toJson() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');

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
  }
}
