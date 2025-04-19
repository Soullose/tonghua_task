

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tonghua_task/model/monitor/device/device_message.dart';
part 'agv3_message.freezed.dart';
part 'agv3_message.g.dart';

@freezed
@JsonSerializable()
class Agv3Message extends DeviceMessage with _$Agv3Message {

  const Agv3Message._();

  const Agv3Message();

  factory Agv3Message.fromJson(Map<String, dynamic> json) =>
      _$Agv3MessageFromJson(json);

  Map<String,dynamic> toJson() => _$Agv3MessageToJson(this);

}