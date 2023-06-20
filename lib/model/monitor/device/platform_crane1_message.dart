// To parse this JSON data, do
//
//     final platformCrane1Message = platformCrane1MessageFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'platform_crane1_message.freezed.dart';
part 'platform_crane1_message.g.dart';

PlatformCrane1Message platformCrane1MessageFromJson(String str) => PlatformCrane1Message.fromJson(json.decode(str));

String platformCrane1MessageToJson(PlatformCrane1Message data) => json.encode(data.toJson());

@freezed
class PlatformCrane1Message with _$PlatformCrane1Message {
  const factory PlatformCrane1Message({
    String? senderId,
    String? senderType,
    String? taskId,
    String? type,
    String? payload,
  }) = _PlatformCrane1Message;

  factory PlatformCrane1Message.fromJson(Map<String, dynamic> json) => _$PlatformCrane1MessageFromJson(json);
}
