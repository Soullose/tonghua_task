// To parse this JSON data, do
//
//     final agv1Message = agv1MessageFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'agv1_message.freezed.dart';
part 'agv1_message.g.dart';

Agv1Message agv1MessageFromJson(String str) =>
    Agv1Message.fromJson(json.decode(str));

String agv1MessageToJson(Agv1Message data) => json.encode(data.toJson());

@freezed
class Agv1Message with _$Agv1Message {
  const factory Agv1Message({
    String? senderId,
    String? senderType,
    String? taskId,
    String? type,
    String? payload,
  }) = _Agv1Message;

  factory Agv1Message.fromJson(Map<String, dynamic> json) =>
      _$Agv1MessageFromJson(json);
}
