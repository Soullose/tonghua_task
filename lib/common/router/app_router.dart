import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tonghua_task/common/router/router_notifier.dart';
import 'package:tonghua_task/common/router/router_path.dart';
import 'package:tonghua_task/modules/welcome/welcome_page.dart';

final GlobalKey<NavigatorState> _key =
    GlobalKey<NavigatorState>(debugLabel: 'rootKey');

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellKey');

final routerProvider = Provider.autoDispose<GoRouter>((ref) {
  final notifier = ref.watch(routerNotifierProvider.notifier);

  return GoRouter(
    navigatorKey: _key,
    refreshListenable: notifier,
    debugLogDiagnostics: true,
    initialLocation: RouterPath.welcome.path,
    routes: routes,
    redirect: notifier.redirect,
  );
});

List<RouteBase> get routes => [
      GoRoute(
        path: RouterPath.welcome.path,
        name: RouterPath.welcome.name,
        builder: (_, __) => const WelcomePage(),
      ),
      GoRoute(
        path: RouterPath.signIn.path,
        name: RouterPath.signIn.name,
      ),
      GoRoute(
        path: RouterPath.home.path,
        name: RouterPath.home.name,
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        // builder: (BuildContext context, GoRouterState state, Widget child) {
        //   return ScaffoldWithNavBar(child: child);
        // },
        routes: [
          GoRoute(
            path: RouterPath.home.path,
            name: RouterPath.home.name,
          ),
        ],
      ),
    ];
