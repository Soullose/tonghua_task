import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'shared_preferences_provider.dart';

class BasicStorage extends StateNotifier {
  final SharedUtility sharedUtility;

  BasicStorage(this.sharedUtility) : super(null);
}

final ipAddressProvider = StateProvider<String>((ref) {
  final preferences = ref.watch(sharedPreferencesProvider);
  final currentValue = preferences.getString('ip') ?? '172.31.80.1';
  ref.listenSelf((prev, curr) {
    preferences.setString('ip', curr);
  });
  return currentValue;
});

final serveAddress = StateProvider<String>(
    (ref) => "http://${ref.watch(ipAddressProvider)}:8080");
