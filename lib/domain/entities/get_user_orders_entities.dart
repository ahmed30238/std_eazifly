import 'package:eazifly_student/data/models/order_and_subscribe/create_order_model.dart';
// import 'package:json_annotation/json_annotation.dart';

class GetUserOrdersEntity {
  final List<CreateOrderDataModel>? data;
  final int? status;
  final String? message;
  const GetUserOrdersEntity({this.data, this.status, this.message});
}
