// To parse this JSON data, do
//
//     final agv2Message = agv2MessageFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'agv2_message.freezed.dart';
part 'agv2_message.g.dart';

Agv2Message agv2MessageFromJson(String str) =>
    Agv2Message.fromJson(json.decode(str));

String agv2MessageToJson(Agv2Message data) => json.encode(data.toJson());

@freezed
class Agv2Message with _$Agv2Message {
  const factory Agv2Message({
    String? senderId,
    String? senderType,
    String? taskId,
    String? type,
    String? payload,
  }) = _Agv2Message;

  factory Agv2Message.fromJson(Map<String, dynamic> json) =>
      _$Agv2MessageFromJson(json);
}
