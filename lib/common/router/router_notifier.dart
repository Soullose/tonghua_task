import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../state/auth.dart';
import 'router_path.dart';

class RouterNotifier extends AutoDisposeAsyncNotifier<void>
    implements Listenable {
  VoidCallback? routerListener;
  bool isAuth = false; // Useful for our global redirect functio

  @override
  FutureOr<void> build() async {
    isAuth = await ref.watch(authNotifierProvider.selectAsync(
        (data) => data.map(signedIn: (_) => true, signedOut: (_) => false)));

    log('isAuth:--$isAuth');
    ref.listenSelf((previous, next) {
      if (state.isLoading) return;

      routerListener?.call();
    });
    // throw UnimplementedError();
  }

  /// Redirects the user when our authentication changes
  Future<String?> redirect(BuildContext context, GoRouterState state) async {
    if (this.state.isLoading || this.state.hasError) return null;

    final isSplash = state.location == RouterPath.welcome.path;

    if (isSplash) {
      await Future.delayed(const Duration(seconds: 3));
      return isAuth ? RouterPath.taskMonitor.path : RouterPath.signIn.path;
    }

    final isSetting = state.location == RouterPath.setting.path;
    if (isSetting) {
      return RouterPath.setting.path;
    }

    final isLoggingIn = state.location == RouterPath.signIn.path;
    if (isLoggingIn) return isAuth ? RouterPath.taskMonitor.path : null;

    return isAuth ? null : RouterPath.signIn.path;
  }

  @override
  void addListener(VoidCallback listener) {
    routerListener = listener;
  }

  @override
  void removeListener(VoidCallback listener) {
    routerListener = null;
  }
}

final routerNotifierProvider =
    AutoDisposeAsyncNotifierProvider<RouterNotifier, void>(() {
  return RouterNotifier();
});
