// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_programs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProgramsModel _$GetProgramsModelFromJson(Map<String, dynamic> json) =>
    GetProgramsModel()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => ProgramModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetProgramsModelToJson(GetProgramsModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'message': instance.message,
    };

ProgramModel _$ProgramModelFromJson(Map<String, dynamic> json) => ProgramModel()
  ..id = (json['id'] as num?)?.toInt()
  ..title = json['title'] as String?
  ..label = json['label'] as String?
  ..description = json['description'] as String?
  ..slug = json['slug'] as String?
  ..goals = json['goals'] as String?
  ..content = json['content'] as String?
  ..whyUs = json['why_us'] as String?
  ..limitUsers = json['limit_users'] as String?
  ..learningTrack = json['learning_track'] as String?
  ..category = json['category'] as String?
  ..image = json['image'] as String?
  ..programType = json['program_type'] as String?
  ..specialFor = json['special_for'] as String?
  ..advantages = json['advantages']
  ..instructors = (json['instructors'] as List<dynamic>?)
      ?.map((e) => InstructorModel.fromJson(e as Map<String, dynamic>))
      .toList()
  ..reviews = (json['reviews'] as List<dynamic>?)
      ?.map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
      .toList()
  ..planPage = json['plan_page'] as String?;

Map<String, dynamic> _$ProgramModelToJson(ProgramModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'label': instance.label,
      'description': instance.description,
      'slug': instance.slug,
      'goals': instance.goals,
      'content': instance.content,
      'why_us': instance.whyUs,
      'limit_users': instance.limitUsers,
      'learning_track': instance.learningTrack,
      'category': instance.category,
      'image': instance.image,
      'program_type': instance.programType,
      'special_for': instance.specialFor,
      'advantages': instance.advantages,
      'instructors': instance.instructors?.map((e) => e.toJson()).toList(),
      'reviews': instance.reviews?.map((e) => e.toJson()).toList(),
      'plan_page': instance.planPage,
    };

InstructorModel _$InstructorModelFromJson(Map<String, dynamic> json) =>
    InstructorModel()
      ..id = (json['id'] as num?)?.toInt()
      ..nameEn = json['name_en'] as String?
      ..nameAr = json['name_ar'] as String?
      ..phone = json['phone'] as String?
      ..whatsApp = json['whats_app'] as String?
      ..address = json['address'] as String?
      ..age = json['age'] as String?
      ..gender = json['gender'] as String?
      ..canApproveQuestion = json['can_approve_question'] as String?
      ..image = json['image'] as String?
      ..specializations = (json['specializations'] as List<dynamic>?)
          ?.map((e) => SpecializationModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..instructorPaymentMethodId =
          (json['instructor_payment_method_id'] as num?)?.toInt()
      ..token = json['token'] as String?;

Map<String, dynamic> _$InstructorModelToJson(
  InstructorModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name_en': instance.nameEn,
  'name_ar': instance.nameAr,
  'phone': instance.phone,
  'whats_app': instance.whatsApp,
  'address': instance.address,
  'age': instance.age,
  'gender': instance.gender,
  'can_approve_question': instance.canApproveQuestion,
  'image': instance.image,
  'specializations': instance.specializations?.map((e) => e.toJson()).toList(),
  'instructor_payment_method_id': instance.instructorPaymentMethodId,
  'token': instance.token,
};

SpecializationModel _$SpecializationModelFromJson(Map<String, dynamic> json) =>
    SpecializationModel()
      ..id = (json['id'] as num?)?.toInt()
      ..title = json['title'] as String?;

Map<String, dynamic> _$SpecializationModelToJson(
  SpecializationModel instance,
) => <String, dynamic>{'id': instance.id, 'title': instance.title};

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel()
  ..id = (json['id'] as num?)?.toInt()
  ..program = json['program'] as String?
  ..user = json['user'] as String?
  ..userImage = json['user_image'] as String?
  ..rating = json['rating'] as String?
  ..review = json['review'] as String?
  ..createdAt = json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String);

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'program': instance.program,
      'user': instance.user,
      'user_image': instance.userImage,
      'rating': instance.rating,
      'review': instance.review,
      'created_at': instance.createdAt?.toIso8601String(),
    };
