// To parse this JSON data, do
//
//     final taskMessage = taskMessageFromJson(jsonString);

///{
// "id":"2f880a17-4fa8-45f0-a726-1ede34877aae",
// "materialType":3,
// "agvId":"AGV01",
// "platformCraneId":"PLATFORM_CRANE01",
// "warehouseCraneId":"WAREHOUSE_CRANE01",
// "platformTag":1,
// "stockLocation":{
// "areaType":"STRAIGHT",
// "tag":101,
// "row":1,
// "level":2,
// "qrCode":0,
// "rfid":0
// },
// "truckLocation":{
// "row":1,
// "level":1
// },
// "platformUserId":"ADMIN",
// "platformUsername":"管理员",
// "warehouseUserId":"ADMIN",
// "warehouseUsername":"管理员",
// "type":"StraightInbound",
// "taskNo":"IN2304003",
// "matCode":null,
// "storageNo":"AC01-1-2",
// "cave":"上洞口"
// }

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'task_message.freezed.dart';
part 'task_message.g.dart';

TaskMessage taskMessageFromJson(String str) =>
    TaskMessage.fromJson(json.decode(str));

String taskMessageToJson(TaskMessage data) => json.encode(data.toJson());

@freezed
abstract class TaskMessage with _$TaskMessage {
  const factory TaskMessage({
    String? id,
    int? materialType,
    String? agvId,
    String? platformCraneId,
    String? warehouseCraneId,
    int? platformTag,
    StockLocation? stockLocation,
    TruckLocation? truckLocation,
    String? platformUserId,
    String? platformUsername,
    String? warehouseUserId,
    String? warehouseUsername,
    String? type,
    String? taskNo,
    dynamic matCode,
    String? storageNo,
    String? cave,
  }) = _TaskMessage;

  factory TaskMessage.fromJson(Map<String, dynamic> json) =>
      _$TaskMessageFromJson(json);
}

@freezed
abstract class StockLocation with _$StockLocation {
  const factory StockLocation({
    String? areaType,
    int? tag,
    int? row,
    int? level,
    int? qrCode,
    int? rfid,
  }) = _StockLocation;

  factory StockLocation.fromJson(Map<String, dynamic> json) =>
      _$StockLocationFromJson(json);
}

@freezed
abstract class TruckLocation with _$TruckLocation {
  const factory TruckLocation({
    int? row,
    int? level,
  }) = _TruckLocation;

  factory TruckLocation.fromJson(Map<String, dynamic> json) =>
      _$TruckLocationFromJson(json);
}
