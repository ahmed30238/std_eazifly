class RenewSubscriptionTojson {
  final List<int> programId;
  final List<int> planId;
  // final List<String> startDate;
  final List<int> studentNumber;
  final String code;
  final String? image; // Keep this as image path string
  // final MultipartFile? imageFile; // Optional, not used in current implementation

  RenewSubscriptionTojson({
    required this.programId,
    required this.planId,
    // required this.startDate,
    required this.studentNumber,
    required this.code,
    this.image,
    // this.imageFile,
  });

  // Convert object to JSON (for non-multipart requests)
  Map<String, dynamic> toJson() {
    return {
      'program_id': programId,
      'plan_id': planId,
      // 'start_date': startDate,
      'student_number': studentNumber,
      'code': code,
      'image': image,
    };
  }
}
