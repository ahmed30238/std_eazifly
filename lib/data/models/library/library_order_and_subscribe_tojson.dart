import 'package:dio/dio.dart';

class LibraryOrderAndSubscribeTojson {
  final String? image;
  final MultipartFile? imageFile;
  final String libraryPlanId;

  LibraryOrderAndSubscribeTojson({
    required this.image,
    required this.imageFile,
    required this.libraryPlanId,
  });
  Map<String, dynamic> toJson() => {
        "image": image,
        "library_plan_id": libraryPlanId,
      };
}
