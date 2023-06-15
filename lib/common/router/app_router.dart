import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tonghua_task/common/router/router_notifier.dart';
import 'package:tonghua_task/common/router/router_path.dart';
import 'package:tonghua_task/modules/main_wrapper/index.dart';
import 'package:tonghua_task/modules/setting/view.dart';
import 'package:tonghua_task/modules/sign_in/view.dart';
import 'package:tonghua_task/modules/single_task/view.dart';
import 'package:tonghua_task/modules/task_monitor/view.dart';
import 'package:tonghua_task/modules/welcome/welcome_page.dart';

final GlobalKey<NavigatorState> _rootKey =
    GlobalKey<NavigatorState>(debugLabel: 'rootKey');

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellKey');

final routerProvider = Provider.autoDispose<GoRouter>((ref) {
  final notifier = ref.watch(routerNotifierProvider.notifier);

  return GoRouter(
    navigatorKey: _rootKey,
    refreshListenable: notifier,
    debugLogDiagnostics: true,
    initialLocation: RouterPath.welcome.path,
    routes: routes,
    redirect: notifier.redirect,
  );
});

List<RouteBase> get routes => [
      // 欢迎页
      GoRoute(
        path: RouterPath.welcome.path,
        name: RouterPath.welcome.name,
        builder: (_, __) => const WelcomePage(),
      ),
      //登录页
      GoRoute(
        path: RouterPath.signIn.path,
        name: RouterPath.signIn.name,
        builder: (_, __) => const SignInPage(),
      ),
      //设置页
      GoRoute(
        path: RouterPath.setting.path,
        name: RouterPath.setting.name,
        builder: (_, __) => const SettingPage(),
      ),

      //底部导航栏
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return MainWrapperPage(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _shellNavigatorKey,
            routes: <RouteBase>[
              //任务监控
              GoRoute(
                  path: RouterPath.taskMonitor.path,
                  name: RouterPath.taskMonitor.name,
                  builder: (_, __) => const TaskMonitorPage())
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              //单车任务
              GoRoute(
                  path: RouterPath.singleTask.path,
                  name: RouterPath.singleTask.name,
                  builder: (_, __) => const SingleTaskPage())
            ],
          ),
        ],
      ),
    ];
