class CreateOrderTojson {
  List<int> programId;
  List<int> planId;
  List<int> studentNumber;
  String code;
  String image;

  CreateOrderTojson({
    required this.programId,
    required this.planId,
    required this.studentNumber,
    required this.code,
    required this.image,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'program_id': programId,
      'plan_id': planId,
      'student_number': studentNumber,
      'code': code,
      'image': image,
    };
  }
}
