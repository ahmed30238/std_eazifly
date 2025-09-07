// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assign_program_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssignProgramReviewModel _$AssignProgramReviewModelFromJson(
  Map<String, dynamic> json,
) => AssignProgramReviewModel()
  ..data = json['data'] == null
      ? null
      : AssignProgramReviewDataModel.fromJson(
          json['data'] as Map<String, dynamic>,
        )
  ..status = (json['status'] as num?)?.toInt()
  ..message = json['message'] as String?;

Map<String, dynamic> _$AssignProgramReviewModelToJson(
  AssignProgramReviewModel instance,
) => <String, dynamic>{
  'data': instance.data?.toJson(),
  'status': instance.status,
  'message': instance.message,
};

AssignProgramReviewDataModel _$AssignProgramReviewDataModelFromJson(
  Map<String, dynamic> json,
) => AssignProgramReviewDataModel()
  ..id = (json['id'] as num?)?.toInt()
  ..program = json['program'] as String?
  ..user = json['user'] as String?
  ..userImage = json['user_image'] as String?
  ..rating = (json['rating'] as num?)?.toInt()
  ..review = json['review'] as String?
  ..createdAt = json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String);

Map<String, dynamic> _$AssignProgramReviewDataModelToJson(
  AssignProgramReviewDataModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'program': instance.program,
  'user': instance.user,
  'user_image': instance.userImage,
  'rating': instance.rating,
  'review': instance.review,
  'created_at': instance.createdAt?.toIso8601String(),
};
