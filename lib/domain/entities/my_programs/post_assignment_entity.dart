// post_assignment_entity.dart

import 'package:json_annotation/json_annotation.dart';

class PostAssignmentEntity {
  @JsonKey(name: "data")
  dynamic data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  PostAssignmentEntity({
    this.data,
    this.status,
    this.message,
  });
}
