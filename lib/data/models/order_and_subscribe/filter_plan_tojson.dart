class FilterPlansTojson {
  final String duration;
  final String numberOfSessionPerWeek;
  final String programId;
  final String subscribeDays;

  FilterPlansTojson({
    required this.duration,
    required this.numberOfSessionPerWeek,
    required this.programId,
    required this.subscribeDays,
  });

  Map<String, dynamic> tojson() => {
    "duration": duration,
    "number_of_session_per_week": numberOfSessionPerWeek,
    "program_id": programId,
    "subscripe_days": subscribeDays,
  };
}
