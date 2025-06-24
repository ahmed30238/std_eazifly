import 'dart:io';
import 'package:dio/dio.dart';

class PostAssignmentTojson {
  final String sessionAssignmentId;
  final String studentAnswer;
  final File file;
  final File? voiceNote;

  PostAssignmentTojson({
    required this.sessionAssignmentId,
    required this.file,
    required this.studentAnswer,
    this.voiceNote,
  });

  Future<Map<String, dynamic>> toFormData() async {
    final Map<String, dynamic> data = {};

    data['session_assignment_id'] = sessionAssignmentId;
    data['answer'] = studentAnswer;

    data['file'] = await MultipartFile.fromFile(
      file.path,
      filename: file.path.split('/').last,
    );

    if (voiceNote != null) {
      data['voice_note'] = await MultipartFile.fromFile(
        voiceNote!.path,
        filename: voiceNote!.path.split('/').last,
      );
    }

    return data;
  }
}
