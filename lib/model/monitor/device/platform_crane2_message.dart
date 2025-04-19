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
@JsonSerializable()
abstract class PlatformCrane2Message with _$PlatformCrane2Message {

  const PlatformCrane2Message._();

  const factory PlatformCrane2Message({
    String? senderId,
    String? senderType,
    String? taskId,
    String? type,
    String? payload,
}) = _PlatformCrane2Message;
  //
  // const PlatformCrane2Message({
  //   this.senderId,
  //   this.senderType,
  //   this.taskId,
  //   this.type,
  //   this.payload,
  // });
  //
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

  factory PlatformCrane2Message.fromJson(Map<String, dynamic> json) =>
      _$PlatformCrane2MessageFromJson(json);

  Map<String,dynamic> toJson() => _$PlatformCrane2MessageToJson(this);
}
