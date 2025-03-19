import 'package:flutter/material.dart';
import 'package:flutter_my_blueprint/routing/bottom_tab_route.dart';
import 'package:flutter_my_blueprint/routing/search_branch.dart';
import 'package:flutter_my_blueprint/routing/search_tab_route.dart';
import 'package:flutter_my_blueprint/routing/settings_branch.dart';
import 'package:flutter_my_blueprint/routing/settings_tab_route.dart';
import 'package:flutter_my_blueprint/ui/start/start_screen.dart';
import 'package:go_router/go_router.dart';

part 'router.g.dart';

/// NavigatorKey
final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'rootNavigator');
final searchTabNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'homeTab');
final settingsTabNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'settingsTab',
);

/// TypedGoRoute
@TypedGoRoute<StartUpRoute>(
  path: '/',
  routes: [
    TypedStatefulShellRoute<BottomTabRoute>(
      branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
        searchBranch,
        settingsBranch,
      ],
    ),
  ],
)
class StartUpRoute extends GoRouteData {
  const StartUpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const StartScreen();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
}
