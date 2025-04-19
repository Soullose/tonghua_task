// To parse this JSON data, do
//
//     final platformCrane1Message = platformCrane1MessageFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'platform_crane1_message.freezed.dart';
part 'platform_crane1_message.g.dart';

PlatformCrane1Message platformCrane1MessageFromJson(String str) =>
    PlatformCrane1Message.fromJson(json.decode(str));

String platformCrane1MessageToJson(PlatformCrane1Message data) =>
    json.encode(data.toJson());

@freezed
@JsonSerializable()
abstract class PlatformCrane1Message with _$PlatformCrane1Message {

  const PlatformCrane1Message._();

  const factory PlatformCrane1Message({
    String? senderId,
    String? senderType,
    String? taskId,
    String? type,
    String? payload,
}) = _PlatformCrane1Message;

  // const PlatformCrane1Message({
  //   this.senderId,
  //   this.senderType,
  //   this.taskId,
  //   this.type,
  //   this.payload,
  // });
  // @override
  // final String? senderId;
  // @override
  // final String? senderType;
  // @override
  // final String? taskId;
  // @override
  // final String? type;
  // @override
  // final String? payload;

  factory PlatformCrane1Message.fromJson(Map<String, dynamic> json) =>
      _$PlatformCrane1MessageFromJson(json);

  Map<String,dynamic> toJson() => _$PlatformCrane1MessageToJson(this);
}
