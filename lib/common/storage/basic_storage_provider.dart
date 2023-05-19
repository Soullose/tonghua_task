import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'shared_preferences_provider.dart';

class BasicStorage extends StateNotifier {
  final SharedUtility sharedUtility;

  BasicStorage(this.sharedUtility) : super(null);
}

final ipAddressProvider = StateProvider<String>((ref) {
  final preferences = ref.watch(sharedPreferencesProvider);
  final currentValue = preferences.getString('ip') ?? '192.168.1.110';
  ref.listenSelf((prev, curr) {
    preferences.setString('ip', curr);
  });
  return currentValue;
});

final serveAddress =
    StateProvider<String>((ref) => "${ref.watch(ipAddressProvider)}:8080");
