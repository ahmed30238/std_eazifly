// إضافة enum لحالة الرسالة
enum MessageStatus {
  sending,    // جاري الإرسال
  sent,       // تم الإرسال بنجاح
  failed,     // فشل الإرسال
}

// تحديث OrderNote class ليشمل المؤشر
class OrderNote {
  final int? id;
  final String? title;
  final String? description;
  final String? image;
  final String? type;
  final DateTime? createdAt;
  final Maker? maker;
  final MessageStatus status; // إضافة المؤشر الجديد
  
  OrderNote({
    this.id,
    this.title,
    this.description,
    this.image,
    this.type,
    this.createdAt,
    this.maker,
    this.status = MessageStatus.sent, // القيمة الافتراضية
  });
  
  // إضافة copyWith method للتحديث
  OrderNote copyWith({
    int? id,
    String? title,
    String? description,
    String? image,
    String? type,
    DateTime? createdAt,
    Maker? maker,
    MessageStatus? status,
  }) {
    return OrderNote(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      maker: maker ?? this.maker,
      status: status ?? this.status,
    );
  }
}
class Maker {
  final int id;
  final String name;
  final String image;

  Maker({required this.id, required this.name, required this.image});
}