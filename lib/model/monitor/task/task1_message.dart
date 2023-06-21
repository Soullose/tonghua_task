// To parse this JSON data, do
//
//     final task1Message = task1MessageFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'task1_message.freezed.dart';
part 'task1_message.g.dart';

Task1Message task1MessageFromJson(String str) =>
    Task1Message.fromJson(json.decode(str));

String task1MessageToJson(Task1Message data) => json.encode(data.toJson());

@freezed
class Task1Message with _$Task1Message {
  const factory Task1Message({
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
  }) = _Task1Message;

  factory Task1Message.fromJson(Map<String, dynamic> json) =>
      _$Task1MessageFromJson(json);
}

@freezed
class StockLocation with _$StockLocation {
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
class TruckLocation with _$TruckLocation {
  const factory TruckLocation({
    int? row,
    int? level,
  }) = _TruckLocation;

  factory TruckLocation.fromJson(Map<String, dynamic> json) =>
      _$TruckLocationFromJson(json);
}
