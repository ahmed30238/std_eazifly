import 'package:eazifly_student/data/models/order_and_subscribe/create_order_model.dart';
import 'package:json_annotation/json_annotation.dart';

class CreateOrderEntity {
  @JsonKey(name: "data")
  CreateOrderDataModel? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  CreateOrderEntity({this.data, this.status, this.message});
}

class CreateOrderDataEntity {
  static int? customInt(val) {
    return int.tryParse(val?.toString() ?? "");
  }

  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "user")
  CreateOrderUser? user;
  @JsonKey(name: "total_order_price", fromJson: customInt)
  int? totalOrderPrice;
  @JsonKey(name: "total_after_discount", fromJson: customInt)
  int? totalAfterDiscount;
  @JsonKey(name: "currency")
  String? currency;
  @JsonKey(name: "status")
  CreateOrderStatus? status;
  @JsonKey(name: "type")
  CreateOrderStatus? type;
  @JsonKey(name: "subscription_type")
  String? subscriptionType;
  @JsonKey(name: "used_coupon")
  bool? usedCoupon;
  @JsonKey(name: "program_id")
  String? programId;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "order_details")
  List<CreateOrderOrderDetail>? orderDetails;
  @JsonKey(name: "order_notes")
  List<CreateOrderOrderNoteModel>? orderNotes;
  @JsonKey(name: "program_data")
  CreateOrderProgramDataModel? programData;

  CreateOrderDataEntity({
    this.id,
    this.user,
    this.totalOrderPrice,
    this.programId,
    this.totalAfterDiscount,
    this.currency,
    this.status,
    this.type,
    this.subscriptionType,
    this.usedCoupon,
    this.createdAt,
    this.orderDetails,
    this.orderNotes,
    this.programData,
  });
}

class CreateOrderDetailEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "program")
  String? program;

  @JsonKey(name: "label")
  String? label;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "currency")
  String? currency;

  @JsonKey(name: "price")
  String? price;

  @JsonKey(name: "discount_price")
  String? discountPrice;

  @JsonKey(name: "subscripe_days")
  String? subscripeDays;

  @JsonKey(name: "duration")
  String? duration;

  @JsonKey(name: "number_of_session_per_week")
  String? numberOfSessionPerWeek;

  CreateOrderDetailEntity({
    this.id,
    this.title,
    this.program,
    this.label,
    this.description,
    this.currency,
    this.price,
    this.discountPrice,
    this.subscripeDays,
    this.duration,
    this.numberOfSessionPerWeek,
  });
}

class CreateOrderStatusEntity {
  @JsonKey(name: "label")
  String? label;
  @JsonKey(name: "key")
  String? key;
  @JsonKey(name: "color")
  String? color;

  CreateOrderStatusEntity({this.label, this.color, this.key});
}

class CreateOrderUserEntity {
  static int? customInt(val) {
    return int.tryParse(val?.toString() ?? "");
  }

  @JsonKey(name: "id", fromJson: customInt)
  int? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "image")
  String? image;

  CreateOrderUserEntity({this.id, this.name, this.image});
}

class CreateOrderOrderNoteEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "maker")
  CreateOrderMakerModel? maker;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "created_at")
  DateTime? createdAt;

  CreateOrderOrderNoteEntity({
    this.id,
    this.type,
    this.maker,
    this.title,
    this.description,
    this.image,
    this.createdAt,
  });
}

class CreateOrderMakerEntity {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "image")
  String? image;

  CreateOrderMakerEntity({this.name, this.image});
}

class CreateOrderProgramDataEntity {
  @JsonKey(name: "program_id")
  String? programId;
  @JsonKey(name: "program_image")
  String? programImage;
  @JsonKey(name: "program_title")
  String? programTitle;

  CreateOrderProgramDataEntity({
    this.programImage,
    this.programId,
    this.programTitle,
  });
}
