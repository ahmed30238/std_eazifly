import 'package:eazifly_student/data/models/order_and_subscribe/add_note_model.dart';
import 'package:json_annotation/json_annotation.dart';

// ENTITY: AddNoteEntity
class AddNoteEntity {
  @JsonKey(name: "data")
  AddNoteDataModel? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  AddNoteEntity({
    this.data,
    this.status,
    this.message,
  });
}

// ENTITY: DataEntity
class AddNoteDataEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "user")
  AddNoteUserModel? user;
  @JsonKey(name: "total_order_price")
  String? totalOrderPrice;
  @JsonKey(name: "total_after_discount")
  String? totalAfterDiscount;
  @JsonKey(name: "currency")
  String? currency;
  @JsonKey(name: "status")
  AddNoteStatusModel? status;
  @JsonKey(name: "type")
  AddNoteStatusModel? type;
  @JsonKey(name: "subscription_type")
  String? subscriptionType;
  @JsonKey(name: "used_coupon")
  bool? usedCoupon;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "payment_method")
  String? paymentMethod;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "order_details")
  List<AddNoteOrderDetailModel>? orderDetails;
  @JsonKey(name: "order_notes")
  List<AddNoteOrderNoteModel>? orderNotes;

  AddNoteDataEntity({
    this.id,
    this.user,
    this.totalOrderPrice,
    this.totalAfterDiscount,
    this.currency,
    this.status,
    this.type,
    this.subscriptionType,
    this.usedCoupon,
    this.createdAt,
    this.paymentMethod,
    this.image,
    this.orderDetails,
    this.orderNotes,
  });
}

// ENTITY: OrderDetailEntity
class AddNoteOrderDetailEntity {
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
  @JsonKey(name: "is_special_plan")
  bool? isSpecialPlan;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "plan_title")
  String? planTitle;

  AddNoteOrderDetailEntity({
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
    this.isSpecialPlan,
    this.type,
    this.planTitle,
  });
}

// ENTITY: OrderNoteEntity
class AddNoteOrderNoteEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "maker")
  AddNoteMakerModel? maker;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "created_at")
  DateTime? createdAt;

  AddNoteOrderNoteEntity({
    this.id,
    this.type,
    this.maker,
    this.title,
    this.description,
    this.image,
    this.createdAt,
  });
}

// ENTITY: MakerEntity
class AddNoteMakerEntity {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "image")
  String? image;

  AddNoteMakerEntity({
    this.name,
    this.image,
  });
}

// ENTITY: StatusEntity
class AddNoteStatusEntity {
  @JsonKey(name: "label")
  String? label;
  @JsonKey(name: "color")
  String? color;

  AddNoteStatusEntity({
    this.label,
    this.color,
  });
}

// ENTITY: UserEntity
class AddNoteUserEntity {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "image")
  String? image;

  AddNoteUserEntity({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
  });
}
