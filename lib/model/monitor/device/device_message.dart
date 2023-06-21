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
class DeviceMessage with _$DeviceMessage {
  const factory DeviceMessage({
    String? senderId,
    String? senderType,
    String? taskId,
    String? type,
    String? payload,
  }) = _DeviceMessage;

  factory DeviceMessage.fromJson(Map<String, dynamic> json) =>
      _$DeviceMessageFromJson(json);
}
