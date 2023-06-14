import 'package:riverpod_annotation/riverpod_annotation.dart';

class SettingState extends AutoDisposeAsyncNotifier {
  @override
  FutureOr build() {}

  String get title => "设置页面";
}

final settingStateProvider =
    AutoDisposeAsyncNotifierProvider<SettingState, void>(() => SettingState());
