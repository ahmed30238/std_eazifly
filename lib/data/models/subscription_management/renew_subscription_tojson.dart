class RenewSubscriptionTojson {
  final List<int> programId;
  final List<int> planId;
  final String startDate;
  final List<int> studentNumber;
  final String code;

  RenewSubscriptionTojson({
    required this.programId,
    required this.planId,
    required this.startDate,
    required this.studentNumber,
    required this.code,
  });

  // Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'program_id': programId,
      'plan_id': planId,
      'start_date': startDate,
      'student_number': studentNumber,
      'code': code,
    };
  }
}
