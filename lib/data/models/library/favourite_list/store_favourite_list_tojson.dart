import 'package:dio/dio.dart';

class StoreFavouriteListTojson {
  final String title;
  final String? image;
  final MultipartFile? imageFile;
  final List<int> items;
  StoreFavouriteListTojson({
    required this.title,
    this.image,
    this.imageFile,
    required this.items,
  });
  Map<String, dynamic> toJson() => {
        'title': title,
        'image': image,
        'items': items,
      };
}
