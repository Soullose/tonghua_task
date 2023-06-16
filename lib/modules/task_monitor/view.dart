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
    final userState = ref.watch(userStateProvider);
    final httpManager = ref.read(httpManagerProvider.notifier);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('任务监控${userState.value}'),
          ElevatedButton(
            onPressed: () async {
              dynamic response = await httpManager.netFetch(
                  "${ref.watch(serveAddress)}${ApiPath.initUrl}",
                  method: DioMethod.get);

              LogUtils.i(response.data);
            },
            child: const Text('测试'),
          ),
        ],
      ),
    );
  }
}
