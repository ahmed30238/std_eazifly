class AddNoteTojson {
  final String title;
  final String description;
  final String orderId;
  final String userId;
  final String? image;

  AddNoteTojson({
    required this.title,
    required this.description,
    required this.orderId,
    required this.userId,
    required this.image,
  });
  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "order_id": orderId,
        "user_id": userId,
        "image": image,
      };
}