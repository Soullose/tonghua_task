class MqttTopics {
  MqttTopics._();

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

  static String? analysis(String topic) {
    switch (topic) {
      case _task1:
        break;
      case _task2:
        break;
      case _devices:
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
