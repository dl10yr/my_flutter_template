part of '../../go_router_provider.dart';

@TypedStatefulShellRoute<BottomTabRoute>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    searchBranch,
    settingsBranch,
  ],
)
class BottomTabRoute extends StatefulShellRouteData {
  const BottomTabRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return BottomTabPage(navigationShell);
  }

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
  // static const String $restorationScopeId = 'restorationScopeId';
}

class BranchSearchData extends StatefulShellBranchData {
  const BranchSearchData();

  static final GlobalKey<NavigatorState> $navigatorKey = searchTabNavigatorKey;
  // static const String $restorationScopeId = 'restorationScopeId';
}

class BranchSettingsData extends StatefulShellBranchData {
  const BranchSettingsData();

  static final GlobalKey<NavigatorState> $navigatorKey =
      settingsTabNavigatorKey;
  // static const String $restorationScopeId = 'restorationScopeId';
}
