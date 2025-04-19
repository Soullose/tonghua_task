// To parse this JSON data, do
//
//     final agv1Message = agv1MessageFromJson(jsonString);
// import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'agv1_message.freezed.dart';
part 'agv1_message.g.dart';

Agv1Message agv1MessageFromJson(String str) =>
    Agv1Message.fromJson(json.decode(str));

String agv1MessageToJson(Agv1Message data) => json.encode(data.toJson());

@freezed
@JsonSerializable()
abstract class Agv1Message with _$Agv1Message {
  const factory Agv1Message({
    String? senderId,
    String? senderType,
    String? taskId,
    String? type,
    String? payload,
}) = _Agv1Message;
  // const Agv1Message({
  //   this.senderId,
  //   this.senderType,
  //   this.taskId,
  //   this.type,
  //   this.payload,
  // });
  // final String? senderId;
  // final String? senderType;
  // final String? taskId;
  // final String? type;
  // final String? payload;

  factory Agv1Message.fromJson(Map<String, dynamic> json) =>
      _$Agv1MessageFromJson(json);

  Map<String,dynamic> toJson() => _$Agv1MessageToJson(this);
}
