// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:flutter_my_blueprint/core/botom_tab/presentation/bottom_tab_screen.dart';
import 'package:flutter_my_blueprint/ui/settings/settings_screen.dart';
import 'package:flutter_my_blueprint/routing/app_routes.dart';
import 'package:flutter_my_blueprint/ui/github_repository/search/github_repository_search_screen.dart';

part 'router.g.dart';

final rootNavigationKey = GlobalKey<NavigatorState>();
final _shellSearchNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'searchTab',
);
final _shellSettingsNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'settingsTab',
);

@riverpod
GoRouter goRouter(Ref ref) {
  return GoRouter(
    navigatorKey: rootNavigationKey,
    initialLocation: AppRoutes.searchTab.path,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      return null;
    },
    observers: [],
    routes: [
      StatefulShellRoute.indexedStack(
        pageBuilder: (context, state, navigationShell) {
          return CupertinoPage(child: BottomTabScreen(navigationShell));
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellSearchNavigatorKey,
            routes: [
              GoRoute(
                path: AppRoutes.searchTab.path,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(
                    child: GithubRepositorySearchScreen(),
                  );
                },
                routes: const [],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellSettingsNavigatorKey,
            routes: [
              GoRoute(
                path: AppRoutes.settings.path,
                pageBuilder: (context, state) {
                  return NoTransitionPage(child: SettingsScreen());
                },
                routes: [],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
