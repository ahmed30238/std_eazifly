class AddWeeklyAppointmentsTojson {
  final String startDate;
  final int userId;
  final int duration;
  final int subscripeDays;
  final int numberOfSessions;
  final Map<String, String> appointments;

  AddWeeklyAppointmentsTojson({
    required this.startDate,
    required this.userId,
    required this.duration,
    required this.subscripeDays,
    required this.numberOfSessions,
    required this.appointments,
  });

  // Convert to JSON Map
  Map<String, dynamic> toJson() {
    return {
      'start_date': startDate,
      'user_id': userId,
      'duration': duration,
      'subscripe_days': subscripeDays,
      'number_of_sessions': numberOfSessions,
      'appointments': appointments,
    };
  }
}
