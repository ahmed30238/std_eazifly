// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_subscription_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserSubscriptionDataModel _$GetUserSubscriptionDataModelFromJson(
  Map<String, dynamic> json,
) => GetUserSubscriptionDataModel()
  ..data = json['data'] == null
      ? null
      : GetUserSubscriptionDataDataModel.fromJson(
          json['data'] as Map<String, dynamic>,
        )
  ..status = (json['status'] as num?)?.toInt()
  ..message = json['message'] as String?;

Map<String, dynamic> _$GetUserSubscriptionDataModelToJson(
  GetUserSubscriptionDataModel instance,
) => <String, dynamic>{
  'data': instance.data?.toJson(),
  'status': instance.status,
  'message': instance.message,
};

GetUserSubscriptionDataDataModel _$GetUserSubscriptionDataDataModelFromJson(
  Map<String, dynamic> json,
) => GetUserSubscriptionDataDataModel()
  ..subscripeDays = json['subscripe_days'] as String?
  ..duration = json['duration'] as String?
  ..numberOfSessionPerWeek = json['number_of_session_per_week'] as String?
  ..startDate = json['start_date'] == null
      ? null
      : DateTime.parse(json['start_date'] as String)
  ..numberOfSessions = (json['number_of_sessions'] as num?)?.toInt();

Map<String, dynamic> _$GetUserSubscriptionDataDataModelToJson(
  GetUserSubscriptionDataDataModel instance,
) => <String, dynamic>{
  'subscripe_days': instance.subscripeDays,
  'duration': instance.duration,
  'number_of_session_per_week': instance.numberOfSessionPerWeek,
  'start_date': instance.startDate?.toIso8601String(),
  'number_of_sessions': instance.numberOfSessions,
};
