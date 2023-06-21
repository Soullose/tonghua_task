// To parse this JSON data, do
//
//     final platformCrane2Message = platformCrane2MessageFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'platform_crane2_message.freezed.dart';
part 'platform_crane2_message.g.dart';

PlatformCrane2Message platformCrane2MessageFromJson(String str) =>
    PlatformCrane2Message.fromJson(json.decode(str));

String platformCrane2MessageToJson(PlatformCrane2Message data) =>
    json.encode(data.toJson());

@freezed
class PlatformCrane2Message with _$PlatformCrane2Message {
  const factory PlatformCrane2Message({
    String? senderId,
    String? senderType,
    String? taskId,
    String? type,
    String? payload,
  }) = _PlatformCrane2Message;

  factory PlatformCrane2Message.fromJson(Map<String, dynamic> json) =>
      _$PlatformCrane2MessageFromJson(json);
}
