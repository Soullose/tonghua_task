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
class WarehouseCrane1Message with _$WarehouseCrane1Message {
  const factory WarehouseCrane1Message({
    String? senderId,
    String? senderType,
    String? taskId,
    String? type,
    String? payload,
  }) = _WarehouseCrane1Message;

  factory WarehouseCrane1Message.fromJson(Map<String, dynamic> json) =>
      _$WarehouseCrane1MessageFromJson(json);
}
