// To parse this JSON data, do
//
//     final task2Message = task2MessageFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'task2_message.freezed.dart';
part 'task2_message.g.dart';

Task2Message task2MessageFromJson(String str) =>
    Task2Message.fromJson(json.decode(str));

String task2MessageToJson(Task2Message data) => json.encode(data.toJson());

@freezed
abstract class Task2Message with _$Task2Message {
  const factory Task2Message({
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
  }) = _Task2Message;

  factory Task2Message.fromJson(Map<String, dynamic> json) =>
      _$Task2MessageFromJson(json);
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
