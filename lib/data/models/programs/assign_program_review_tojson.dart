class AssignProgramReviewTojson {
  final int programId;
  final String review;
  final int rating;
  final int userId;

  AssignProgramReviewTojson({
    required this.programId,
    required this.review,
    required this.rating,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'program_id': programId,
      'review': review,
      'rating': rating,
      'user_id': userId,
    };
  }
}
