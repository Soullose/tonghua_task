import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/theme/models/app_theme_mode.dart';

class ThemeModeToggleButtons extends ConsumerWidget {
  const ThemeModeToggleButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeMode themeMode = ref.watch(themeModeProvider).value!;
    final List<bool> isSelected = <bool>[
      themeMode == ThemeMode.light,
      themeMode == ThemeMode.system,
      themeMode == ThemeMode.dark,
    ];
    return ToggleButtons(
      isSelected: isSelected,
      onPressed: (int newIndex) {
        if (newIndex == 0) {
          ref.read(themeModeProvider.notifier).change(ThemeMode.light);
        } else if (newIndex == 1) {
          ref.read(themeModeProvider.notifier).change(ThemeMode.system);
        } else {
          ref.read(themeModeProvider.notifier).change(ThemeMode.dark);
        }
      },
      children: const <Widget>[
        Icon(Icons.wb_sunny),
        Icon(Icons.phone_iphone),
        Icon(Icons.bedtime),
      ],
    );
  }
}
