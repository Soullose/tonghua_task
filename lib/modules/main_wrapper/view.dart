import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainWrapperPage extends ConsumerWidget {
  const MainWrapperPage({
    required this.navigationShell,
    Key? key,
  }) : super(key: key);

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  /// 不退出
  Future<bool> _dialogExitApp(BuildContext context) async {
    ///如果是 android 回到桌面
    if (Platform.isAndroid) {
      AndroidIntent intent = const AndroidIntent(
        action: 'android.intent.action.MAIN',
        category: "android.intent.category.HOME",
      );
      await intent.launch();
    }

    return Future.value(false);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () => _dialogExitApp(context),
      child: Scaffold(
        bottomNavigationBar: GestureDetector(
          onDoubleTap: () {
            if (kDebugMode) {
              print('${navigationShell.currentIndex}');
            }
          },
          child: NavigationBar(
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.monitor_heart_outlined), label: "任务监控"),
              NavigationDestination(
                  icon: Icon(Icons.devices_outlined), label: "单车任务"),
            ],
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: (int index) {
              return navigationShell.goBranch(index,
                  initialLocation: navigationShell.currentIndex == index);
            },
            animationDuration: const Duration(milliseconds: 1000),
          ),
        ),
        body: navigationShell,
      ),
    );
  }
}
