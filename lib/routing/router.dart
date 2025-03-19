// Flutter imports:
import 'package:flutter/cupertino.dart';
// Package imports:
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../ui/botom_tab/presentation/bottom_tab_screen.dart';
import '../ui/github_repository/search/github_repository_search_screen.dart';
import '../ui/settings/settings_screen.dart';
// Project imports:
import 'app_routes.dart';

part 'router.g.dart';

final GlobalKey<NavigatorState> rootNavigationKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellSearchNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'searchTab');
final GlobalKey<NavigatorState> _shellSettingsNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'settingsTab');

@riverpod
GoRouter goRouter(Ref ref) {
  return GoRouter(
    navigatorKey: rootNavigationKey,
    initialLocation: AppRoutes.searchTab.path,
    debugLogDiagnostics: true,
    redirect: (BuildContext context, GoRouterState state) {
      return null;
    },
    observers: <NavigatorObserver>[],
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        pageBuilder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return CupertinoPage(child: BottomTabScreen(navigationShell));
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _shellSearchNavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.searchTab.path,
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return const NoTransitionPage(
                    child: GithubRepositorySearchScreen(),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellSettingsNavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.settings.path,
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return const NoTransitionPage(child: SettingsScreen());
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
