import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tonghua_task/common/state/user_state.dart';
import 'package:tonghua_task/common/utils/log_utils.dart';

import '../../common/net/http_client.dart';
import '../../common/storage/basic_storage_provider.dart';
import '../../constants/api_path.dart';

class TaskMonitorPage extends ConsumerWidget {
  const TaskMonitorPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              title: const Text('ListTile selected'),
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
