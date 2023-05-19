import 'package:mqtt_client/mqtt_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'mqtt_connection_status_provider.g.dart';

@Riverpod(keepAlive: true)
class MqttClientConnectStatus extends _$MqttClientConnectStatus {
  @override
  MqttConnectionState build() {
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
