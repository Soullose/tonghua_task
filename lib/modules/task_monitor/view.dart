import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tonghua_task/common/state/auth.dart';
import 'package:tonghua_task/common/state/user_state.dart';

class TaskMonitorPage extends ConsumerWidget {
  const TaskMonitorPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userStateProvider);

    return Scaffold(
      body: Center(
        child: Text('任务监控${userState.value?.firstName }'),
      ),
    );
  }
}
