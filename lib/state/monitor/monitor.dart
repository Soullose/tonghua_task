import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class Monitor<T> extends AsyncNotifier<T> {
  Monitor({required this.defaultValue});

  final T defaultValue;

  @override
  FutureOr<T> build() {
    ref.onDispose(() => defaultValue);
    return defaultValue;
  }

  Future<void> set(T newValue) async {
    state = AsyncValue.data(newValue);
  }
}
