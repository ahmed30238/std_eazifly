//
// import 'package:json_annotation/json_annotation.dart';
// import 'dart:convert';
//
// part 'complex_error_message_model_model.g.dart';
//
// @JsonSerializable(explicitToJson: true)
// class ComplexErrorMessageModelModel {
//   @JsonKey(name: "data")
//   dynamic data;
//   @JsonKey(name: "status")
//   int? status;
//   @JsonKey(name: "message")
//   List<List<String>>? message;
//
//   ComplexErrorMessageModelModel({
//     this.data,
//     this.status,
//     this.message,
//   });
//
//   factory ComplexErrorMessageModelModel.fromJson(Map<String, dynamic> json) => _$ComplexErrorMessageModelModelFromJson(json);
//
//   Map<String, dynamic> toJson() => _$ComplexErrorMessageModelModelToJson(this);
// }
