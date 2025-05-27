import 'package:eazifly_student/data/models/programs/get_programs_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetProgramsEntity {
  @JsonKey(name: "data")
  List<ProgramModel>? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  GetProgramsEntity({this.data, this.status, this.message});
}

class GetProgramsProgramEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "label")
  String? label;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "slug")
  String? slug;
  @JsonKey(name: "goals")
  String? goals;
  @JsonKey(name: "content")
  String? content;
  @JsonKey(name: "why_us")
  String? whyUs;
  @JsonKey(name: "limit_users")
  String? limitUsers;
  @JsonKey(name: "learning_track")
  String? learningTrack;
  @JsonKey(name: "category")
  String? category;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "program_type")
  String? programType;
  @JsonKey(name: "special_for")
  String? specialFor;
  @JsonKey(name: "advantages")
  dynamic advantages;
  @JsonKey(name: "instructors")
  List<InstructorModel>? instructors;
  @JsonKey(name: "reviews")
  List<ReviewModel>? reviews;

  GetProgramsProgramEntity({
    this.id,
    this.title,
    this.label,
    this.description,
    this.slug,
    this.goals,
    this.content,
    this.whyUs,
    this.limitUsers,
    this.learningTrack,
    this.category,
    this.image,
    this.programType,
    this.specialFor,
    this.advantages,
    this.instructors,
    this.reviews,
  });
}

class InstructorEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name_en")
  String? nameEn;
  @JsonKey(name: "name_ar")
  String? nameAr;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "whats_app")
  String? whatsApp;
  @JsonKey(name: "address")
  String? address;
  @JsonKey(name: "age")
  String? age;
  @JsonKey(name: "gender")
  String? gender;
  @JsonKey(name: "can_approve_question")
  String? canApproveQuestion;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "specializations")
  List<SpecializationModel>? specializations;
  @JsonKey(name: "instructor_payment_method_id")
  int? instructorPaymentMethodId;
  @JsonKey(name: "token")
  String? token;

  InstructorEntity({
    this.id,
    this.nameEn,
    this.nameAr,
    this.phone,
    this.whatsApp,
    this.address,
    this.age,
    this.gender,
    this.canApproveQuestion,
    this.image,
    this.specializations,
    this.instructorPaymentMethodId,
    this.token,
  });
}

class SpecializationEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;

  SpecializationEntity({this.id, this.title});
}

class ReviewEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "program")
  String? program;
  @JsonKey(name: "user")
  String? user;
  @JsonKey(name: "user_image")
  String? userImage;
  @JsonKey(name: "rating")
  String? rating;
  @JsonKey(name: "review")
  String? review;
  @JsonKey(name: "created_at")
  DateTime? createdAt;

  ReviewEntity({
    this.id,
    this.program,
    this.user,
    this.userImage,
    this.rating,
    this.review,
    this.createdAt,
  });
}
