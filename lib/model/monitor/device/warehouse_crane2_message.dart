// To parse this JSON data, do
//
//     final warehouseCrane2Message = warehouseCrane2MessageFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'warehouse_crane2_message.freezed.dart';
part 'warehouse_crane2_message.g.dart';

WarehouseCrane2Message warehouseCrane2MessageFromJson(String str) => WarehouseCrane2Message.fromJson(json.decode(str));

String warehouseCrane2MessageToJson(WarehouseCrane2Message data) => json.encode(data.toJson());

@freezed
class WarehouseCrane2Message with _$WarehouseCrane2Message {
  const factory WarehouseCrane2Message({
    String? senderId,
    String? senderType,
    String? taskId,
    String? type,
    String? payload,
  }) = _WarehouseCrane2Message;

  factory WarehouseCrane2Message.fromJson(Map<String, dynamic> json) => _$WarehouseCrane2MessageFromJson(json);
}
