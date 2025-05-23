import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tonghua_task/model/monitor/device/agv3_message.dart';

import '../../../model/monitor/device/agv1_message.dart';
import '../../../model/monitor/device/agv2_message.dart';
import '../../../model/monitor/device/platform_crane1_message.dart';
import '../../../model/monitor/device/platform_crane2_message.dart';
import '../../../model/monitor/device/warehouse_crane1_message.dart';
import '../../../model/monitor/device/warehouse_crane2_message.dart';
import '../../../model/monitor/task/task1_message.dart';
import '../../../model/monitor/task/task2_message.dart';
import '../monitor.dart';

class DeviceMonitor {
  const DeviceMonitor._();

  static const Task1Message _task1message = Task1Message();

  static const Task2Message _task2message = Task2Message();

  static const Agv1Message _agv1message = Agv1Message();

  static const Agv2Message _agv2message = Agv2Message();

  static const Agv3Message _agv3message = Agv3Message();

  static const PlatformCrane1Message _platformCrane1Message =
      PlatformCrane1Message();

  static const PlatformCrane2Message _platformCrane2Message =
      PlatformCrane2Message();

  static const WarehouseCrane1Message _warehouseCrane1Message =
      WarehouseCrane1Message();

  static const WarehouseCrane2Message _warehouseCrane2Message =
      WarehouseCrane2Message();

  /// String key used for defining
  static const String _keyTask1message = 'task1message';

  ///
  static final AsyncNotifierProvider<Monitor<Task1Message>, Task1Message>
      task1messageProvider =
      AsyncNotifierProvider<Monitor<Task1Message>, Task1Message>(
    () {
      return Monitor<Task1Message>(defaultValue: _task1message);
    },
    name: '${_keyTask1message}Provider',
  );

  /// String key used for defining
  static const String _keyTask2message = 'task2message';

  ///
  static final AsyncNotifierProvider<Monitor<Task2Message>, Task2Message>
      task2messageProvider =
      AsyncNotifierProvider<Monitor<Task2Message>, Task2Message>(
    () {
      return Monitor<Task2Message>(defaultValue: _task2message);
    },
    name: '${_keyTask2message}Provider',
  );

  /// String key used for defining
  static const String _keyAgv1message = 'agv1message';

  ///
  static final AsyncNotifierProvider<Monitor<Agv1Message>, Agv1Message>
      agv1messageProvider =
      AsyncNotifierProvider<Monitor<Agv1Message>, Agv1Message>(
    () {
      return Monitor<Agv1Message>(defaultValue: _agv1message);
    },
    name: '${_keyAgv1message}Provider',
  );

  /// String key used for defining
  static const String _keyAgv2message = 'agv2message';

  ///
  static final AsyncNotifierProvider<Monitor<Agv2Message>, Agv2Message>
      agv2messageProvider =
      AsyncNotifierProvider<Monitor<Agv2Message>, Agv2Message>(
    () {
      return Monitor<Agv2Message>(defaultValue: _agv2message);
    },
    name: '${_keyAgv2message}Provider',
  );

  /// String key used for defining
  static const String _keyPlatformCrane1Message = 'platformCrane1Message';

  ///
  static final AsyncNotifierProvider<Monitor<PlatformCrane1Message>,
          PlatformCrane1Message> platformCrane1MessageProvider =
      AsyncNotifierProvider<Monitor<PlatformCrane1Message>,
          PlatformCrane1Message>(
    () {
      return Monitor<PlatformCrane1Message>(
          defaultValue: _platformCrane1Message);
    },
    name: '${_keyPlatformCrane1Message}Provider',
  );

  /// String key used for defining
  static const String _keyPlatformCrane2Message = 'platformCrane2Message';

  ///
  static final AsyncNotifierProvider<Monitor<PlatformCrane2Message>,
          PlatformCrane2Message> platformCrane2MessageProvider =
      AsyncNotifierProvider<Monitor<PlatformCrane2Message>,
          PlatformCrane2Message>(
    () {
      return Monitor<PlatformCrane2Message>(
          defaultValue: _platformCrane2Message);
    },
    name: '${_keyPlatformCrane2Message}Provider',
  );

  /// String key used for defining
  static const String _keyWarehouseCrane1Message = 'warehouseCrane1Message';

  ///
  static final AsyncNotifierProvider<Monitor<WarehouseCrane1Message>,
          WarehouseCrane1Message> warehouseCrane1MessageProvider =
      AsyncNotifierProvider<Monitor<WarehouseCrane1Message>,
          WarehouseCrane1Message>(
    () {
      return Monitor<WarehouseCrane1Message>(
          defaultValue: _warehouseCrane1Message);
    },
    name: '${_keyWarehouseCrane1Message}Provider',
  );

  /// String key used for defining
  static const String _keyWarehouseCrane2Message = 'warehouseCrane2Message';

  ///
  static final AsyncNotifierProvider<Monitor<WarehouseCrane2Message>,
          WarehouseCrane2Message> warehouseCrane2MessageProvider =
      AsyncNotifierProvider<Monitor<WarehouseCrane2Message>,
          WarehouseCrane2Message>(
    () {
      return Monitor<WarehouseCrane2Message>(
          defaultValue: _warehouseCrane2Message);
    },
    name: '${_keyWarehouseCrane2Message}Provider',
  );
}
