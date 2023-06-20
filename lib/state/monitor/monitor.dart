import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class Monitor<T> extends AutoDisposeAsyncNotifier<T> {
  Monitor({required this.defaultValue});

  final T defaultValue;

  @override
  FutureOr<T> build() {
    state = AsyncValue.data(defaultValue);
    return state.value!;
  }

  Future<void> set(T newValue) async {
    state = const AsyncValue.loading();
    state = AsyncValue.data(newValue);
  }
}
