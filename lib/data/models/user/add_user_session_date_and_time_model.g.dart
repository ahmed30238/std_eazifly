// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_user_session_date_and_time_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddUserSessionDateAndTimeModel _$AddUserSessionDateAndTimeModelFromJson(
  Map<String, dynamic> json,
) => AddUserSessionDateAndTimeModel()
  ..data = (json['data'] as List<dynamic>?)
      ?.map(
        (e) => AddUserSessionDateAndTimeDatumModel.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList()
  ..status = (json['status'] as num?)?.toInt()
  ..message = json['message'] as String?;

Map<String, dynamic> _$AddUserSessionDateAndTimeModelToJson(
  AddUserSessionDateAndTimeModel instance,
) => <String, dynamic>{
  'data': instance.data?.map((e) => e.toJson()).toList(),
  'status': instance.status,
  'message': instance.message,
};

AddUserSessionDateAndTimeDatumModel
_$AddUserSessionDateAndTimeDatumModelFromJson(Map<String, dynamic> json) =>
    AddUserSessionDateAndTimeDatumModel()
      ..id = (json['id'] as num?)?.toInt()
      ..day = json['day'] as String?
      ..from = json['from'] as String?
      ..to = json['to'] as String?
      ..programId = json['program_id'] as String?
      ..instructorId = json['instructor_id'] as String?
      ..instructorName = json['instructor_name'] as String?
      ..programName = json['program_name'] as String?;

Map<String, dynamic> _$AddUserSessionDateAndTimeDatumModelToJson(
  AddUserSessionDateAndTimeDatumModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'day': instance.day,
  'from': instance.from,
  'to': instance.to,
  'program_id': instance.programId,
  'instructor_id': instance.instructorId,
  'instructor_name': instance.instructorName,
  'program_name': instance.programName,
};
