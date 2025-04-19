// To parse this JSON data, do
//
//     final warehouseCrane1Message = warehouseCrane1MessageFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'warehouse_crane1_message.freezed.dart';
part 'warehouse_crane1_message.g.dart';

WarehouseCrane1Message warehouseCrane1MessageFromJson(String str) =>
    WarehouseCrane1Message.fromJson(json.decode(str));

String warehouseCrane1MessageToJson(WarehouseCrane1Message data) =>
    json.encode(data.toJson());

@freezed
@JsonSerializable()
abstract class WarehouseCrane1Message with _$WarehouseCrane1Message {

  const WarehouseCrane1Message._();

  const factory WarehouseCrane1Message({
    String? senderId,
    String? senderType,
    String? taskId,
    String? type,
    String? payload,
}) = _WarehouseCrane1Message;


  // const WarehouseCrane1Message({
  //   this.senderId,
  //   this.senderType,
  //   this.taskId,
  //   this.type,
  //   this.payload,
  // });
  //
  // @override
  // final String? senderId;
  // @override
  // final String? senderType;
  // @override
  // final String? taskId;
  // @override
  // final String? type;
  // @override
  // final String? payload;

  factory WarehouseCrane1Message.fromJson(Map<String, dynamic> json) =>
      _$WarehouseCrane1MessageFromJson(json);

  Map<String,dynamic> toJson() => _$WarehouseCrane1MessageToJson(this);
}
