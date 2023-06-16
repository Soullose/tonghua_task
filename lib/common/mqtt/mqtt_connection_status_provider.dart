import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'mqtt_connection_status_provider.g.dart';

@Riverpod(keepAlive: true)
class MqttClientConnectStatus extends _$MqttClientConnectStatus {
  @override
  MqttConnectionState build() {
    ref.listenSelf((previous, next) {
      switch (next) {
        case MqttConnectionState.connected:
          Fluttertoast.cancel();
          Fluttertoast.showToast(
            msg: '消息服务连接成功',
            backgroundColor: Colors.white,
            textColor: Colors.black,
          );
          break;
        case MqttConnectionState.disconnecting:
          Fluttertoast.cancel();
          Fluttertoast.showToast(
            msg: '消息服务连接正在与代理断开连接',
            backgroundColor: Colors.white,
            textColor: Colors.black,
          );
          break;
        case MqttConnectionState.disconnected:
          Fluttertoast.cancel();
          Fluttertoast.showToast(
            msg: '消息服务断开连接',
            backgroundColor: Colors.white,
            textColor: Colors.black,
          );
          break;
        case MqttConnectionState.connecting:
          Fluttertoast.cancel();
          Fluttertoast.showToast(
            msg: '消息服务正在连接',
            backgroundColor: Colors.white,
            textColor: Colors.black,
          );
          break;
        case MqttConnectionState.faulted:
          Fluttertoast.cancel();
          Fluttertoast.showToast(
            msg: '消息服务连接出现故障，不再与代理通信。',
            backgroundColor: Colors.white,
            textColor: Colors.black,
          );
          break;
      }
    });
    return MqttConnectionState.disconnected;
  }
}

// final mqttConnectionStatusProvider =
//     AutoDisposeNotifierProvider<MqttClientConnectStatus, MqttConnectionState>(
//       MqttClientConnectStatus.new,
//   name: r'mqttConnectionStatusProvider',
// );

// abstract class _$MqttConnectionState
//     extends AutoDisposeNotifier<MqttConnectionState> {
//   @override
//   MqttConnectionState build();
// }
