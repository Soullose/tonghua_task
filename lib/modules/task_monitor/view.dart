import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tonghua_task/common/state/user_state.dart';
import 'package:tonghua_task/common/utils/log_utils.dart';

import '../../common/net/http_client.dart';
import '../../common/storage/basic_storage_provider.dart';
import '../../constants/api_path.dart';
import '../../state/monitor/device/device_monitor.dart';

class TaskMonitorPage extends ConsumerWidget {
  const TaskMonitorPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final platformCrane1Message =
        ref.watch(DeviceMonitor.platformCrane1MessageProvider);
    final warehouseCrane1MessageProvider =
    ref.watch(DeviceMonitor.warehouseCrane1MessageProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('监控'),
      ),
      body: RepaintBoundary(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              leading: const Icon(Icons.info),
              title: Text('${platformCrane1Message.value?.payload}'),
              subtitle: const Text('Selected list tile sub title'),
              trailing: const Text('Trailing'),
              selected: true,
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.info),
              title: Text('${warehouseCrane1MessageProvider.value?.payload}'),
              subtitle: const Text('Selected list tile sub title'),
              trailing: const Text('Trailing'),
              selected: true,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
