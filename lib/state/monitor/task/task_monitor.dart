import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../model/monitor/task/task_message.dart';

class TaskMonitor extends AsyncNotifier<List<TaskMessage>> {
  @override
  FutureOr<List<TaskMessage>> build() {
    return [];
  }

  Future<void> addTaskMessage(TaskMessage taskMessage) async {
    state = const AsyncLoading();
    state = AsyncValue.data([...?state.value, taskMessage]);
  }

  Future<void> removeTaskMessage(String id) async {
    state = const AsyncLoading();
    state = AsyncValue.data([
      for (final taskM in state.value!)
        if (taskM.id! != id) taskM
    ]);
  }
}

final tasKMessageProvider = AsyncNotifierProvider(()=> TaskMonitor());
