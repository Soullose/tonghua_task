import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/theme/models/app_theme_mode.dart';
import 'theme_mode_toggle_buttons.dart';

class ThemeModeListTile extends ConsumerWidget {
  const ThemeModeListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeMode mode = ref.watch(themeModeProvider);
    return ListTile(
      title: const Text('Theme mode'),
      subtitle: Text('Theme ${mode.name}'),
      onTap: () {
        switch (ref.read(themeModeProvider)) {
          case ThemeMode.light:
            ref.read(themeModeProvider.notifier).change(ThemeMode.system);
            break;
          case ThemeMode.system:
            ref.read(themeModeProvider.notifier).change(ThemeMode.dark);
            break;
          case ThemeMode.dark:
            ref.read(themeModeProvider.notifier).change(ThemeMode.light);
            break;
        }
      },
      trailing: const ThemeModeToggleButtons(),
    );
  }
}
