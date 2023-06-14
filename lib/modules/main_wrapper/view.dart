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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
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
      body: navigationShell,
    );
  }
}
