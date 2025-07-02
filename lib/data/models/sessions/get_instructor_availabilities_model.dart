// ============ get_instructor_availabilities_model.dart ============
import 'package:eazifly_student/domain/entities/sessions/get_instructor_availabilities_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_instructor_availabilities_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetInstructorAvailabilitiesModel extends GetInstructorAvailabilitiesEntity {
  GetInstructorAvailabilitiesModel();

  factory GetInstructorAvailabilitiesModel.fromJson(Map<String, dynamic> json) {
    // Handle the case where data might be a List instead of Map
    var processedJson = Map<String, dynamic>.from(json);
    
    if (json['data'] is List) {
      // If data is an empty list, convert it to null
      processedJson['data'] = null;
    }
    
    return _$GetInstructorAvailabilitiesModelFromJson(processedJson);
  }

  Map<String, dynamic> toJson() => _$GetInstructorAvailabilitiesModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetInstructorAvailabilitieDataModel extends GetInstructorAvailabilitieDataEntity {
  GetInstructorAvailabilitieDataModel();

  factory GetInstructorAvailabilitieDataModel.fromJson(Map<String, dynamic> json) {
    return _$GetInstructorAvailabilitieDataModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetInstructorAvailabilitieDataModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetInstructorAvailabilitieDayModel extends GetInstructorAvailabilitieDayEntity {
  GetInstructorAvailabilitieDayModel();

  factory GetInstructorAvailabilitieDayModel.fromJson(Map<String, dynamic> json) {
    return _$GetInstructorAvailabilitieDayModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetInstructorAvailabilitieDayModelToJson(this);
}

// ============ Alternative Solution: Custom fromJson with error handling ============
// class GetInstructorAvailabilitiesModelSafe extends GetInstructorAvailabilitiesEntity {
//   GetInstructorAvailabilitiesModelSafe({
//     super.data,
//     super.status,
//     super.message,
//   });

//   factory GetInstructorAvailabilitiesModelSafe.fromJson(Map<String, dynamic> json) {
//     GetInstructorAvailabilitieDataModel? dataModel;
    
//     try {
//       var dataValue = json['data'];
      
//       if (dataValue is Map<String, dynamic>) {
//         // Normal case: data is a Map
//         dataModel = GetInstructorAvailabilitieDataModel.fromJson(dataValue);
//       } else if (dataValue is List) {
//         // Empty case: data is an empty List
//         dataModel = null; // or create empty model
//       } else {
//         // Unexpected case
//         dataModel = null;
//       }
//     } catch (e) {
//       print('Error parsing instructor availabilities: $e');
//       dataModel = null;
//     }

//     return GetInstructorAvailabilitiesModelSafe(
//       data: dataModel,
//       status: json['status'] as int?,
//       message: json['message'] as String?,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'data': data?.toJson(),
//       'status': status,
//       'message': message,
//     };
//   }
// }