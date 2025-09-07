// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_instructor_availabilities_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetInstructorAvailabilitiesModel _$GetInstructorAvailabilitiesModelFromJson(
  Map<String, dynamic> json,
) => GetInstructorAvailabilitiesModel()
  ..data = json['data'] == null
      ? null
      : GetInstructorAvailabilitieDataModel.fromJson(
          json['data'] as Map<String, dynamic>,
        )
  ..status = (json['status'] as num?)?.toInt()
  ..message = json['message'] as String?;

Map<String, dynamic> _$GetInstructorAvailabilitiesModelToJson(
  GetInstructorAvailabilitiesModel instance,
) => <String, dynamic>{
  'data': instance.data?.toJson(),
  'status': instance.status,
  'message': instance.message,
};

GetInstructorAvailabilitieDataModel
_$GetInstructorAvailabilitieDataModelFromJson(
  Map<String, dynamic> json,
) => GetInstructorAvailabilitieDataModel()
  ..saturday = (json['Saturday'] as List<dynamic>?)
      ?.map(
        (e) => GetInstructorAvailabilitieDayModel.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList()
  ..sunday = (json['Sunday'] as List<dynamic>?)
      ?.map(
        (e) => GetInstructorAvailabilitieDayModel.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList()
  ..monday = (json['Monday'] as List<dynamic>?)
      ?.map(
        (e) => GetInstructorAvailabilitieDayModel.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList()
  ..tuesday = (json['Tuesday'] as List<dynamic>?)
      ?.map(
        (e) => GetInstructorAvailabilitieDayModel.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList()
  ..wednesday = (json['Wednesday'] as List<dynamic>?)
      ?.map(
        (e) => GetInstructorAvailabilitieDayModel.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList()
  ..thursday = (json['Thursday'] as List<dynamic>?)
      ?.map(
        (e) => GetInstructorAvailabilitieDayModel.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList()
  ..friday = (json['Friday'] as List<dynamic>?)
      ?.map(
        (e) => GetInstructorAvailabilitieDayModel.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList();

Map<String, dynamic> _$GetInstructorAvailabilitieDataModelToJson(
  GetInstructorAvailabilitieDataModel instance,
) => <String, dynamic>{
  'Saturday': instance.saturday?.map((e) => e.toJson()).toList(),
  'Sunday': instance.sunday?.map((e) => e.toJson()).toList(),
  'Monday': instance.monday?.map((e) => e.toJson()).toList(),
  'Tuesday': instance.tuesday?.map((e) => e.toJson()).toList(),
  'Wednesday': instance.wednesday?.map((e) => e.toJson()).toList(),
  'Thursday': instance.thursday?.map((e) => e.toJson()).toList(),
  'Friday': instance.friday?.map((e) => e.toJson()).toList(),
};

GetInstructorAvailabilitieDayModel _$GetInstructorAvailabilitieDayModelFromJson(
  Map<String, dynamic> json,
) => GetInstructorAvailabilitieDayModel()
  ..startTime = json['start_time'] as String?
  ..endTime = json['end_time'] as String?
  ..fullDate = json['full_date'] == null
      ? null
      : DateTime.parse(json['full_date'] as String);

Map<String, dynamic> _$GetInstructorAvailabilitieDayModelToJson(
  GetInstructorAvailabilitieDayModel instance,
) => <String, dynamic>{
  'start_time': instance.startTime,
  'end_time': instance.endTime,
  'full_date': instance.fullDate?.toIso8601String(),
};
