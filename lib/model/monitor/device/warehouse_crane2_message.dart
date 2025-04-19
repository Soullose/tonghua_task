// To parse this JSON data, do
//
//     final warehouseCrane2Message = warehouseCrane2MessageFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'warehouse_crane2_message.freezed.dart';
part 'warehouse_crane2_message.g.dart';

WarehouseCrane2Message warehouseCrane2MessageFromJson(String str) =>
    WarehouseCrane2Message.fromJson(json.decode(str));

String warehouseCrane2MessageToJson(WarehouseCrane2Message data) =>
    json.encode(data.toJson());

@freezed
@JsonSerializable()
abstract class WarehouseCrane2Message with _$WarehouseCrane2Message {

  const WarehouseCrane2Message._();

  const factory WarehouseCrane2Message({
    String? senderId,
    String? senderType,
    String? taskId,
    String? type,
    String? payload,
}) = _WarehouseCrane2Message;

  // const WarehouseCrane2Message({
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

  factory WarehouseCrane2Message.fromJson(Map<String, dynamic> json) =>
      _$WarehouseCrane2MessageFromJson(json);

  Map<String,dynamic> toJson() => _$WarehouseCrane2MessageToJson(this);
}
