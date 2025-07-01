class ChangeSessionDateTojson {
  final String day;
  final String sessionTime;
  final String sessionDate;

  ChangeSessionDateTojson({
    required this.day,
    required this.sessionTime,
    required this.sessionDate,
  });
  Map<String, dynamic> tojson() => {
        "session_date": sessionDate,
        "day": day,
        "session_time": sessionTime,
      };
}
