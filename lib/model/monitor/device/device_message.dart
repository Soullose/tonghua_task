// To parse this JSON data, do
//
//     final deviceMessage = deviceMessageFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'device_message.freezed.dart';
part 'device_message.g.dart';

DeviceMessage deviceMessageFromJson(String str) =>
    DeviceMessage.fromJson(json.decode(str));

String deviceMessageToJson(DeviceMessage data) => json.encode(data.toJson());

@freezed
@JsonSerializable()
abstract class DeviceMessage with _$DeviceMessage {
  const DeviceMessage({
    this.senderId,
    this.senderType,
    this.taskId,
    this.type,
    this.payload,
  });

  @override
  final String? senderId;
  @override
  final String? senderType;
  @override
  final String? taskId;
  @override
  final String? type;
  @override
  final String? payload;

  factory DeviceMessage.fromJson(Map<String, dynamic> json) =>
      _$DeviceMessageFromJson(json);

  Map<String,dynamic> toJson() => _$DeviceMessageToJson(this);
}
