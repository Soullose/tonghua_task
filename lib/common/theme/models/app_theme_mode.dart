import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tonghua_task/common/utils/log_utils.dart';

import '../../storage/shared_preferences_provider.dart';

class AppThemeMode extends StateNotifier<ThemeMode> {
  AppThemeMode() : super(ThemeMode.system);

  // static const ThemeMode _themeMode = ThemeMode.system;

  set _index(ThemeMode themeMode) => state = themeMode;

  void change(ThemeMode value) => _index = value;
}

final themeModeProvider = StateNotifierProvider<AppThemeMode, ThemeMode>((ref) {
  // final appThemeMode = ref.notifier;
  final preferences = ref.watch(sharedPreferencesProvider);
  final n = preferences.getInt('themeMode');
  LogUtils.i('sp_themeMode:$n');
  // switch (n) {
  //   case 0:
  //     appThemeMode.change(ThemeMode.light);
  //     break;
  //   case 1:
  //     appThemeMode.change(ThemeMode.system);
  //     break;
  //   case 2:
  //     appThemeMode.change(ThemeMode.dark);
  //     break;
  // }
  ref.listenSelf((previous, next) {
    switch (next) {
      case ThemeMode.light:
        preferences.setInt('themeMode', 0);
        break;
      case ThemeMode.system:
        preferences.setInt('themeMode', 1);
        break;
      case ThemeMode.dark:
        preferences.setInt('themeMode', 2);
        break;
    }
  });
  return AppThemeMode();
});

// class AppThemeMode extends AutoDisposeAsyncNotifier<ThemeMode> {
//   @override
//   FutureOr<ThemeMode> build() {
//     return ThemeMode.system;
//   }
//
//
// }
//
// final themeModeProvider =
//     AutoDisposeAsyncNotifierProvider<AppThemeMode, ThemeMode>(
//         () => AppThemeMode());
