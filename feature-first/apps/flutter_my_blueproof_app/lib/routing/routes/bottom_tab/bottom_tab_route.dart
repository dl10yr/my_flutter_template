import 'package:flutter/material.dart';
import 'package:flutter_my_blueprint/core/widgets/bottom_tab/bottom_tab_screen.dart';
import 'package:flutter_my_blueprint/routing/go_router_provider.dart';
import 'package:go_router/go_router.dart';

class BottomTabRoute extends StatefulShellRouteData {
  const BottomTabRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return BottomTabScreen(navigationShell);
  }

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
  static const String $restorationScopeId = 'restorationScopeId';
}

class BranchSearchData extends StatefulShellBranchData {
  const BranchSearchData();

  static final GlobalKey<NavigatorState> $navigatorKey = searchTabNavigatorKey;
  static const String $restorationScopeId = 'restorationScopeId';
}

class BranchSettingsData extends StatefulShellBranchData {
  const BranchSettingsData();

  static final GlobalKey<NavigatorState> $navigatorKey =
      settingsTabNavigatorKey;
  static const String $restorationScopeId = 'restorationScopeId';
}
