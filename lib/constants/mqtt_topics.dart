import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/monitor/device/agv1_message.dart';
import '../model/monitor/device/agv2_message.dart';
import '../model/monitor/device/device_message.dart';
import '../model/monitor/device/platform_crane1_message.dart';
import '../model/monitor/device/platform_crane2_message.dart';
import '../model/monitor/device/warehouse_crane1_message.dart';
import '../model/monitor/device/warehouse_crane2_message.dart';
import '../model/monitor/task/task1_message.dart';
import '../model/monitor/task/task2_message.dart';
import '../state/monitor/device/device_monitor.dart';
import 'app_static_variable.dart';

class MqttTopics {
  MqttTopics({required this.ref});

  final AsyncNotifierProviderRef ref;

  static const List<String> topics = [
    'wms/scheduler/1/task',
    'wms/scheduler/2/task',
    'wms/scheduler/devices/message',
    'wms/scheduler/devices/AGV01/state',
    'wms/scheduler/devices/AGV02/state',
  ];

  static const String _task1 = 'wms/scheduler/1/task';
  static const String _task2 = 'wms/scheduler/2/task';
  static const String _devices = 'wms/scheduler/devices/message';
  static const String _agv1State = 'wms/scheduler/devices/AGV01/state';
  static const String _agv2State = 'wms/scheduler/devices/AGV02/state';

  Future analysis(String topic, dynamic data) async {
    switch (topic) {
      case _task1:
        ref
            .read(DeviceMonitor.task1messageProvider.notifier)
            .set(task1MessageFromJson(data));
        break;
      case _task2:
        ref
            .read(DeviceMonitor.task2messageProvider.notifier)
            .set(task2MessageFromJson(data));
        break;
      case _devices:
        String senderId = deviceMessageFromJson(data).senderId!;
        if (senderId == AppStaticV.platformCrane01) {
          ref
              .read(DeviceMonitor.platformCrane1MessageProvider.notifier)
              .set(platformCrane1MessageFromJson(data));
        } else if (senderId == AppStaticV.platformCrane02) {
          ref
              .read(DeviceMonitor.platformCrane2MessageProvider.notifier)
              .set(platformCrane2MessageFromJson(data));
        } else if (senderId == AppStaticV.warehouseCrane01) {
          ref
              .read(DeviceMonitor.warehouseCrane1MessageProvider.notifier)
              .set(warehouseCrane1MessageFromJson(data));
        } else if (senderId == AppStaticV.warehouseCrane02) {
          ref
              .read(DeviceMonitor.warehouseCrane2MessageProvider.notifier)
              .set(warehouseCrane2MessageFromJson(data));
        } else if (senderId == AppStaticV.plantAGV) {
          ref
              .read(DeviceMonitor.agv1messageProvider.notifier)
              .set(agv1MessageFromJson(data));
        } else if (senderId == AppStaticV.transplantAGV) {
          ref
              .read(DeviceMonitor.agv2messageProvider.notifier)
              .set(agv2MessageFromJson(data));
        }
        break;
      case _agv1State:
        break;
      case _agv2State:
        break;
    }
  }
}

enum Topics {
  task1(topic: 'wms/scheduler/1/task'),
  task2(topic: 'wms/scheduler/2/task'),
  devices(topic: 'wms/scheduler/devices/message'),
  agv1State(topic: 'wms/scheduler/devices/AGV01/state'),
  agv2State(topic: 'wms/scheduler/devices/AGV02/state');

  const Topics({required this.topic});

  final String topic;
}
