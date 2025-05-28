import 'package:dio/dio.dart';

class CreateOrderTojson {
  final String? code;
  final String? image; // للمسار
  final MultipartFile? imageFile; // للـ MultipartFile المباشر
  final List<int>? planId;
  final List<int>? programId;
  final List<int>? studentNumber;

  CreateOrderTojson({
    this.code,
    this.image,
    this.imageFile,
    this.planId,
    this.programId,
    this.studentNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'image': image,
      'plan_id': planId,
      'program_id': programId,
      'student_number': studentNumber,
    };
  }
}